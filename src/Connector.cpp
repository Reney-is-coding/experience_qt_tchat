#include "include/Connector.h"

Connector::Connector(short unsigned int port, const std::string address, QObject *parent) : QObject(parent)
{
    _qaddress = address.c_str();
    _port = port;
    _sock = new QTcpSocket(this);
    QHostAddress hAddress(_qaddress);
    _sock->bind(hAddress, reinterpret_cast<quint16>(_port), QAbstractSocket::DefaultForPlatform);
    _sock->connectToHost(QHostAddress(address.c_str()), port);
    _sock->open(QIODevice::ReadWrite);
}

Connector::~Connector()
{
    _sock->reset();
}

QString Connector::messages()
{
    return m_messages;
}

void Connector::sendDatagram(QString message)
{
    QByteArray datagram;
    QHostAddress hAddress(_qaddress);
    datagram.append(message);
    _sock->write(datagram);
    readyRead();
}

void Connector::readyRead()
{
    if (_sock->waitForReadyRead())
    {
        qDebug() << "J'attend des trucs";
    }
    QByteArray datas = _sock->readAll();
    qDebug() << "reçu  = " << datas;
    if (!m_messages.isEmpty())
        m_messages += QString("\n");
    m_messages += QString(datas);
    emit messagesChanged();
}

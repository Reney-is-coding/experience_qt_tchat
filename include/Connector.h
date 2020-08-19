#include <string>

#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QTimer>

#include <QtNetwork/QHostAddress>
#include <QtNetwork/QTcpSocket>
#include <QString>

class Connector : public QObject
{
    Q_OBJECT

public:
    Connector(short unsigned int port, const std::string address, QObject *parent = 0);
    ~Connector();

    Q_PROPERTY(QString messages READ messages NOTIFY messagesChanged)

    QString messages();

signals:
    void messagesChanged();

public slots:
    void readyRead();
    void sendDatagram(QString message);

private:
    QTcpSocket *_sock;
    QString _qaddress;
    short unsigned int _port;
    QString m_messages;
};

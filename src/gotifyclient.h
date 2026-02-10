#ifndef GOTIFYCLIENT_H
#define GOTIFYCLIENT_H

#include <QNetworkRequest>
#include <QObject>
#include <QString>

class GotifyClient : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString token READ token WRITE setToken NOTIFY tokenChanged)
    Q_PROPERTY(QString gotifyUrl READ gotifyUrl WRITE setGotifyUrl NOTIFY gotifyUrlChanged)

public:
    explicit GotifyClient(QObject* parent = nullptr);

    QString token() const;
    void setToken(const QString& token);

    QString gotifyUrl() const;
    void setGotifyUrl(const QString& gotifyUrl);

    QNetworkRequest getRequest(QString& endpoint) const;

signals:
    void tokenChanged(const QString& token);
    void gotifyUrlChanged(const QString& gotifyUrl);

private:
    QString m_token;
    QString m_gotifyUrl;
};

#endif // GOTIFYCLIENT_H

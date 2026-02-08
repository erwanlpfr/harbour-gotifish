#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>

class NetworkManager : public QObject {
    Q_OBJECT
public:
    static NetworkManager& instance(QObject* parent = nullptr);
    QNetworkReply* get(const QNetworkRequest& networkRequest);

signals:
    void requestFailed(const QString& error, int statusCode);
    void sslErrors(QNetworkReply* reply, const QList<QSslError>& errors);

private:
    explicit NetworkManager(QObject* parent = nullptr);
    QNetworkAccessManager* m_manager;
};
#endif

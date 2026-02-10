#include "networkmanager.h"

NetworkManager& NetworkManager::instance(QObject* parent)
{
    static NetworkManager instance(parent);
    return instance;
}

NetworkManager::NetworkManager(QObject* parent)
    : QObject(parent)
    , m_manager(new QNetworkAccessManager(this))
{
    connect(m_manager, &QNetworkAccessManager::sslErrors, this,
        &NetworkManager::sslErrors);
}

QNetworkReply* NetworkManager::get(const QNetworkRequest& networkRequest)
{
    return m_manager->get(networkRequest);
}

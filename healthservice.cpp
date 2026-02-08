#include "healthservice.h"
#include "gotifyclient.h"
#include "healthmodel.h"
#include "networkmanager.h"
#include "requeststates.h"
#include <QJsonDocument>
#include <QJsonObject>

HealthService::HealthService(QObject* parent)
    : QObject(parent)
{
}

GotifyClient* HealthService::gotifyClient() const
{
    return m_gotifyClient;
}

void HealthService::setGotifyClient(GotifyClient* gotifyClient)
{
    if (m_gotifyClient != gotifyClient) {
        m_gotifyClient = gotifyClient;
        emit gotifyClientChanged(m_gotifyClient);
    }
}

void HealthService::getHealth()
{
    m_healthRequestState = RequestStates::State::Loading;
    emit healthRequestStateChanged(m_healthRequestState);

    QString endpoint("/health");

    QNetworkReply* reply = NetworkManager::instance().get(m_gotifyClient->getRequest(endpoint));

    connect(reply, &QNetworkReply::finished, [=]() {
        if (reply->error() == QNetworkReply::NoError) {
            QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
            QJsonObject response = doc.object();

            m_health.database = response.value("database").toString("gray");
            m_health.health = response.value("health").toString("gray");
            m_healthRequestState = RequestStates::Success;
        } else {
            m_healthRequestState = RequestStates::Error;
            emit errorOccurred(reply->errorString());
        }

        emit healthChanged(m_health);
        emit healthRequestStateChanged(m_healthRequestState);
        reply->deleteLater();
    });
}

HealthModel HealthService::health() const
{
    return m_health;
}

RequestStates::State HealthService::healthRequestState() const
{
    return m_healthRequestState;
}

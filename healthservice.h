// healthservice.h
#ifndef HEALTHSERVICE_H
#define HEALTHSERVICE_H

#include "healthmodel.h"
#include "requeststates.h"
#include <QObject>

class GotifyClient;

class HealthService : public QObject {
    Q_OBJECT
    Q_PROPERTY(GotifyClient* gotifyClient READ gotifyClient WRITE setGotifyClient NOTIFY gotifyClientChanged)
    Q_PROPERTY(HealthModel health READ health NOTIFY healthChanged)
    Q_PROPERTY(RequestStates::State healthRequestState READ healthRequestState NOTIFY healthRequestStateChanged)

public:
    explicit HealthService(QObject* parent = nullptr);

    GotifyClient* gotifyClient() const;
    void setGotifyClient(GotifyClient* gotifyClient);

    HealthModel health() const;
    RequestStates::State healthRequestState() const;

    Q_INVOKABLE void getHealth();

signals:
    void gotifyClientChanged(GotifyClient* gotifyClient);
    void healthChanged(HealthModel& health);
    void healthRequestStateChanged(RequestStates::State healthRequest);
    void errorOccurred(const QString& message);

private:
    GotifyClient* m_gotifyClient;
    HealthModel m_health;
    RequestStates::State m_healthRequestState = RequestStates::State::Idle;
};

#endif // HEALTHSERVICE_H

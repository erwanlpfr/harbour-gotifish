#include "gotifyclient.h"
#include <QNetworkRequest>
#include <QUrl>
#include <QUrlQuery>

GotifyClient::GotifyClient(QObject* parent)
    : QObject(parent)
    , m_token("")
    , m_gotifyUrl("")
{
}

QString GotifyClient::token() const { return m_token; }

void GotifyClient::setToken(const QString& token)
{
    if (m_token != token) {
        m_token = token;
        emit tokenChanged(m_token);
    }
}

QString GotifyClient::gotifyUrl() const { return m_gotifyUrl; }

void GotifyClient::setGotifyUrl(const QString& gotifyUrl)
{
    if (m_gotifyUrl != gotifyUrl) {
        m_gotifyUrl = gotifyUrl;
        emit gotifyUrlChanged(m_gotifyUrl);
    }
}

QNetworkRequest GotifyClient::getRequest(QString& endpoint) const
{
    QUrl url(m_gotifyUrl + endpoint);
    QUrlQuery query;

    query.addQueryItem("token", m_token);
    url.setQuery(query);

    QNetworkRequest request(url);

    return request;
}

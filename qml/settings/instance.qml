pragma Singleton

import QtQuick 2.0
import Nemo.Configuration 1.0

QtObject {
  id: instanceSettings

  property ConfigurationValue currentGotifyUrlConfig: ConfigurationValue {
    key: "/apps/harbour-gotifish/currentGotifyUrl"
    defaultValue: ""
  }

  property ConfigurationValue currentTokenConfig: ConfigurationValue {
    key: "/apps/harbour-gotifish/currentToken"
    defaultValue: ""
  }

  property ConfigurationValue currentInstanceIndexConfig: ConfigurationValue {
    key: "/apps/harbour-gotifish/currentInstanceIndex"
    defaultValue: 0
  }

  readonly property string currentGotifyUrl: currentGotifyUrlConfig.value
  readonly property string currentToken: currentTokenConfig.value
  readonly property int currentInstanceIndex: currentInstanceIndexConfig.value

  function setGotifyUrl(url) {
    currentGotifyUrlConfig.value = url
    currentGotifyUrlConfig.sync()
  }

  function setToken(token) {
    currentTokenConfig.value = token
    currentTokenConfig.sync()
  }

  function setCurrentInstanceIndex(index) {
    currentInstanceIndexConfig.value = index
    currentInstanceIndexConfig.sync()
  }
}

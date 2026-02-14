import QtQuick 2.6
import Nemo.Configuration 1.0

QtObject {
  property ConfigurationValue clientsConfig: ConfigurationValue {
    key: "/apps/harbour-gotifish/clientsJson"
    defaultValue: "[]"
  }

  property var clients: JSON.parse(clientsConfig.value)

  function addClient(gotifyUrl, token) {
    var _clients = clients.slice()
    _clients.push({
                    "gotifyUrl": gotifyUrl,
                    "token": token
                  })
    clientsConfig.value = JSON.stringify(_clients)
    clientsConfig.sync()
  }

  function removeClient(index) {
    var _clients = clients.slice()
    _clients.splice(index, 1)
    clientsConfig.value = JSON.stringify(_clients)
    clientsConfig.sync()
  }
}

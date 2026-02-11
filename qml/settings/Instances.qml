import QtQuick 2.6
import Nemo.Configuration 1.0

QtObject {
  id: instancesManager

  property ConfigurationValue instancesConfig: ConfigurationValue {
    key: "/apps/harbour-gotifish/instancesJson"
    defaultValue: "[]"
  }

  property var instances: JSON.parse(instancesConfig.value)

  function addInstance(name, gotifyUrl, token) {
    var newInstances = instances.slice()
    newInstances.push({
                        "name": name,
                        "gotifyUrl": gotifyUrl,
                        "token": token
                      })
    instancesConfig.value = JSON.stringify(newInstances)
    instancesConfig.sync()
  }

  function removeInstance(index) {
    var newInstances = instances.slice()
    newInstances.splice(index, 1)
    instancesConfig.value = JSON.stringify(newInstances)
    instancesConfig.sync()
  }

  function updateInstance(index, name, gotifyUrl, token) {
    var newInstances = instances.slice()
    newInstances[index] = {
      "name": name,
      "gotifyUrl": gotifyUrl,
      "token": token
    }
    instancesConfig.value = JSON.stringify(newInstances)
    instancesConfig.sync()
  }
}

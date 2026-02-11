import QtQuick 2.6
import Sailfish.Silica 1.0
import "../settings" as Settings
import "../components" as Components

Page {
  id: root
  allowedOrientations: Orientation.All

  property bool isRemoving: false

  Settings.Instances {
    id: instances
  }

  SilicaFlickable {
    anchors.fill: parent

    PullDownMenu {
      MenuItem {
        text: qsTr("Add an application")
        onClicked: {
          pageStack.push(Qt.resolvedUrl("../dialogs/AddInstance.qml"))
        }
      }
    }

    Column {
      width: page.width
      spacing: Theme.paddingLarge
      anchors {
        fill: parent
      }

      PageHeader {
        title: qsTr("Applications")
      }

      Repeater {
        visible: instances.instances.length > 0
        model: instances.instances

        delegate: ListItem {
          width: parent.width
          menu: ContextMenu {
            MenuItem {
              text: qsTr("Delete")
              onClicked: {
                root.isRemoving = true
                var remorse = Remorse.popupAction(root, modelData.name,
                                                  function () {
                                                    instances.removeInstance(
                                                          index)
                                                  })

                remorse.canceled.connect(function () {
                  root.isRemoving = false
                })
              }
            }
          }

          Components.ApplicationItem {
            text: modelData.name
            description: modelData.gotifyUrl
          }
        }
      }
    }

    ViewPlaceholder {
      enabled: instances.instances.length === 0
      text: qsTr("No instances saved")
      hintText: qsTr("Swipe down to add an application")
    }
  }
}

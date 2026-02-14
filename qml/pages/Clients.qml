import QtQuick 2.6
import Sailfish.Silica 1.0
import "../settings" as Settings
import "../components" as Components

Page {
  id: root
  allowedOrientations: Orientation.All

  Settings.Instances {
    id: instances
  }

  SilicaFlickable {
    anchors.fill: parent

    PullDownMenu {
      MenuItem {
        text: qsTr("Add a client")
        onClicked: {
          pageStack.push(Qt.resolvedUrl("../dialogs/AddClient.qml"))
        }
      }
    }

    Column {
      width: page.width
      anchors {
        fill: parent
      }

      PageHeader {
        title: qsTr("Clients")
      }

      Repeater {
        visible: instances.clients.length > 0
        model: instances.clients

        delegate: ListItem {
          id: combobox
          width: parent.width

          Label {
            id: label
            text: modelData.gotifyUrl
            leftPadding: Theme.paddingLarge
            rightPadding: Theme.paddingLarge
          }
          Label {
            anchors.top: label.bottom
            text: modelData.token
            font.pixelSize: Theme.fontSizeExtraSmall
            leftPadding: Theme.paddingLarge
            rightPadding: Theme.paddingLarge
          }

          menu: ContextMenu {
            MenuItem {
              text: qsTr("Delete")
              onClicked: {
                var idx = index
                remorse.execute(combobox, qsTr("Deleting...") + modelData.name,
                                function () {
                                  instances.removeClient(idx)
                                })
              }
            }
          }

          RemorseItem {
            id: remorse
          }
        }
      }
    }

    ViewPlaceholder {
      enabled: instances.clients.length === 0
      text: qsTr("No clients saved")
      hintText: qsTr("Swipe down to add a client")
    }
  }
}

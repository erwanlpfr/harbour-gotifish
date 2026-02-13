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
        text: qsTr("Add an application")
        onClicked: {
          pageStack.push(Qt.resolvedUrl("../dialogs/AddInstance.qml"))
        }
      }
    }

    Column {
      width: page.width
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
          id: combobox
          width: parent.width

          Label {
            id: label
            text: modelData.name
            leftPadding: Theme.paddingLarge
            rightPadding: Theme.paddingLarge
          }
          Label {
            anchors.top: label.bottom
            text: modelData.gotifyUrl
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
                                  instances.removeInstance(idx)
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
      enabled: instances.instances.length === 0
      text: qsTr("No instances saved")
      hintText: qsTr("Swipe down to add an application")
    }
  }
}

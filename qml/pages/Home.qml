import QtQuick 2.6
import Sailfish.Silica 1.0
import harbour.org.gotifish 1.0

Page {
  id: page

  allowedOrientations: Orientation.All

  GotifyClient {
    id: gotifyClient
    gotifyUrl: ""
    token: ""
  }

  HealthService {
    id: heatlhService
    gotifyClient: gotifyClient
  }

  SilicaFlickable {
    anchors.fill: parent

    PullDownMenu {
      MenuItem {
        text: qsTr("Settings")
        onClicked: {
          pageStack.push(Qt.resolvedUrl(("./Settings.qml")))
        }
      }
    }

    contentHeight: column.height

    Column {
      id: column

      width: page.width
      spacing: Theme.paddingLarge
      PageHeader {
        title: qsTr("Gotify")
      }
      Label {
        x: Theme.horizontalPageMargin
        text: qsTr("Hello Sailors")
        color: Theme.secondaryHighlightColor
        font.pixelSize: Theme.fontSizeExtraLarge
      }

      Label {
        text: heatlhService.healthRequestState
      }

      Label {
        visible: heatlhService.health
        text: "Health: " + heatlhService.health.health + ", Database: "
              + heatlhService.health.database
      }

      Button {
        text: "click"
        onClicked: heatlhService.getHealth()
      }
    }
  }

  onStatusChanged: {
    if (status === PageStatus.Active) {
      pageStack.pushAttached("./Applications.qml")
    }
  }
}

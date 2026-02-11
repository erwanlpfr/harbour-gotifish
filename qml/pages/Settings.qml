import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
  allowedOrientations: Orientation.All

  SilicaFlickable {
    anchors.fill: parent

    Column {
      width: page.width
      spacing: Theme.paddingLarge
      anchors {
        left: parent.left
        right: parent.right
        leftMargin: Theme.paddingLarge
        rightMargin: Theme.paddingLarge
      }

      PageHeader {
        title: qsTr("Settings")
      }
    }
  }
}

import QtQuick 2.6
import Sailfish.Silica 1.0

MenuItem {
  id: iconMenuItem

  property alias description: descriptionLabel.text

  height: Theme.itemSizeSmall + Theme.paddingSmall * 2
  topPadding: descriptionLabel.text.length ? -descriptionLabel.implicitHeight : 0
  horizontalAlignment: Text.AlignLeft

  Label {
    id: descriptionLabel

    anchors {
      verticalCenter: parent.verticalCenter
      verticalCenterOffset: parent.implicitHeight + Theme.paddingSmall
    }
    width: parent.width
    text: description
    leftPadding: parent.leftPadding

    horizontalAlignment: parent.horizontalAlignment
    verticalAlignment: parent.verticalAlignment
    color: Theme.rgba(parent.color, Theme.opacityHigh)

    font.pixelSize: Theme.fontSizeExtraSmall
    truncationMode: parent.truncationMode
  }
}

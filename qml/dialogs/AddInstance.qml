import QtQuick 2.6
import Sailfish.Silica 1.0

Dialog {

  Column {
    width: parent.width

    DialogHeader {
      title: qsTr("Add an application")
      acceptText: qsTr("Save")
      cancelText: qsTr("Cancel")
    }

    TextField {
      focus: true
      label: qsTr("Name")
      placeholderText: qsTr("For display")
    }

    TextField {
      focus: true
      label: qsTr("Gotify URL")
      placeholderText: "https://..."
    }

    TextField {
      focus: true
      label: qsTr("Token")
      placeholderText: qsTr("Generated in your dashboard")
    }
  }

  onAccepted: {
    console.log("test")
  }

  onRejected: {
    console.log("test2")
  }
}

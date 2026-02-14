import QtQuick 2.6
import Sailfish.Silica 1.0
import "../settings" as Settings

Dialog {
  canAccept: nameInput.text != "" && gotifyUrlInput.text != ""
             && userNameInput.text != "" && passwordInput.text != ""

  Settings.Instances {
    id: instances
  }

  Column {
    width: parent.width

    DialogHeader {
      title: qsTr("Add a client")
      acceptText: qsTr("Save")
      cancelText: qsTr("Cancel")
    }

    TextField {
      id: nameInput
      focus: true
      label: qsTr("Client name")
      placeholderText: qsTr("For display")
    }

    TextField {
      id: gotifyUrlInput
      label: qsTr("Gotify URL")
      placeholderText: "https://..."
    }

    TextField {
      id: userNameInput
      label: qsTr("Username")
      placeholderText: qsTr("Client username")
    }

    TextField {
      id: passwordInput
      label: qsTr("Password")
      placeholderText: qsTr("Client password")
    }
  }

  onDone: {
    if (result == DialogResult.Accepted) {

      // TODO : check URL + create client + save token
    }
  }
}

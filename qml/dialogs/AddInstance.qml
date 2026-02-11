import QtQuick 2.6
import Sailfish.Silica 1.0
import "../settings" as Settings

Dialog {
  canAccept: nameInput.text != "" && gotifyUrlInput.text != ""
             && tokenInput.text

  Settings.Instances {
    id: instances
  }

  Column {
    width: parent.width

    DialogHeader {
      title: qsTr("Add an application")
      acceptText: qsTr("Save")
      cancelText: qsTr("Cancel")
    }

    TextField {
      id: nameInput
      focus: true
      label: qsTr("Name")
      placeholderText: qsTr("For display")
    }

    TextField {
      id: gotifyUrlInput
      label: qsTr("Gotify URL")
      placeholderText: "https://..."
    }

    TextField {
      id: tokenInput
      label: qsTr("Token")
      placeholderText: qsTr("Generated in your dashboard")
    }
  }

  onDone: {
    if (result == DialogResult.Accepted) {
      instances.addInstance(nameInput.text, gotifyUrlInput.text,
                            tokenInput.text)
    }
  }
}

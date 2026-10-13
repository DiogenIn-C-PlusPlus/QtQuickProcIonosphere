import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 2.0


Item
{
    id : input_settings
    property alias label_text: description_info.text
    property alias clue: edit_intpur_parametrs.placeholderText
    Text
    {
        id: description_info
        font.pixelSize: 18
        color: "green"
        anchors.left: parent.left
        Layout.preferredWidth: 150
        Layout.alignment: Qt.AlignLeft
        elide: Text.ElideRight
        height: 50
    }
    TextField
    {
        id : edit_intpur_parametrs
        Layout.preferredWidth: 200
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignLeft
        height: 40
    }
}

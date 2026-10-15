import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15


RowLayout
{
    id : input_settings
    spacing: 8
    property alias label_text: description_info.text
    property alias clue: edit_intpur_parametrs.placeholderText
    property alias units: units_of_measurement.text
    Text
    {
        id: description_info
        font.pixelSize: 18
        color: "green"
        Layout.alignment: Qt.AlignLeft
        elide: Text.ElideRight
    }
    TextField
    {
        id : edit_intpur_parametrs
        Layout.preferredWidth: 200
        Layout.alignment: Qt.AlignLeft
        background: Rectangle
        {
            color: "white"
            border.color: "#B0B0B0"        // серый
            border.width: 1
            radius: 4
        }
    }
    Text
    {
        id: units_of_measurement
        font.pixelSize: 18
        color: "green"
        Layout.alignment: Qt.AlignLeft
        elide: Text.ElideRight
    }
}

import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15


RowLayout
{
    id : input_settings
    spacing: 8
    property alias description_text: description_info.text
    property var combo_model: []
    Text
    {
        id: description_info
        font.pixelSize: 18
        color: "green"
        Layout.alignment: Qt.AlignLeft
        elide: Text.ElideRight
    }
    ComboBox
    {
        id: combo_box
        Layout.preferredWidth: 160
        model : input_settings.combo_model
        background: Rectangle
        {
            color: "white"
            border.color: "#B0B0B0"
            border.width: 1
            radius: 4
        }
    }
}


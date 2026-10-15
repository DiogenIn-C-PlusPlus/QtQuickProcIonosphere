import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0


Item
{
    property alias target_text: target_search.text
    Text
    {
        id: target_search
        font.pixelSize: 18
        color: "green"
        Layout.alignment: Qt.AlignLeft
        elide: Text.ElideRight
    }
    SearchField
    {
        id: searchField
        width: 300
        placeholderText: qsTr("Поиск файлов...")

        // Срабатывает при нажатии Enter или кнопки лупы
        onAccepted: {
            console.log("Ищем:", text)
            // Здесь логика поиска
        }

        // Срабатывает при клике по иконке поиска
        onSearchButtonPressed: {
            console.log("Кнопка поиска нажата:", text)
        }
    }
}

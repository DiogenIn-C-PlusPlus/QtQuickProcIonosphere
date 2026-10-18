import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0


RowLayout
{
    id: search_line
    spacing: 8
    property alias target_text: target_search.text
    property alias clue: path_file.placeholderText
    Text
    {
        id: target_search
        font.pixelSize: 18
        color: "green"
        Layout.alignment: Qt.AlignLeft
        elide: Text.ElideRight
    }
    TextField
    {
        id : path_file
        Layout.preferredWidth: 300
        Layout.alignment: Qt.AlignLeft
        background: Rectangle
        {
            color: "white"
            border.color: "#B0B0B0"        // серый
            border.width: 1
            radius: 4
        }
        Image
        {
            source: "qrc:/icons/search.svg" // Укажите путь к вашей иконке
            sourceSize.width: 20
            sourceSize.height: 20
            anchors.right : parent.right
            anchors.rightMargin:  8
            anchors.verticalCenter: parent.verticalCenter
            opacity: mouseArea.pressed ? 1.0 : 0.6
            MouseArea
            {
                id: mouseArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    searchPopup.open()
                    //console.log(searchPopup.open(), path_file.text)
                }
            }
        }
        Button
        {
            visible: path_file.text.length > 0
            width: 20
            height: 20
            anchors.right: parent.right
            anchors.rightMargin: 28
            anchors.verticalCenter: parent.verticalCenter
            background: null // Убираем стандартный фон кнопки
            contentItem: Text
            {
                text: "✕"
                font.pixelSize: 14
                anchors.right : parent.right
                anchors.rightMargin:  8
                color: "#888"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: path_file.clear()
        }
    }
    Popup
    {
        id: searchPopup
        // Центрируем окно по родителю (TextField) или по всему окну
        anchors.centerIn: Overlay.overlay
        width: 400
        height: 300

        // Модальность: затемняет фон и блокирует клики "сквозь" окно
        modal: true
        focus: true
        // Закрывать по Esc (как в проводнике)
        closePolicy: Popup.CloseOnEscape

        // Содержимое окна
        ColumnLayout
        {
            anchors.fill: parent

            // Поле ввода внутри попапа (можно использовать ваше path_file)
            TextField
            {
                id: popupSearchField
                Layout.fillWidth: true
                placeholderText: "Поиск..."
                // Автоматически ставим фокус при открытии
                Component.onCompleted: forceActiveFocus()
            }

            // Список результатов (пример)
            ListView
            {
                Layout.fillWidth: true
                Layout.fillHeight: true
                model: ["Результат 1", "Результат 2", "Результат 3"]
                delegate: ItemDelegate
                {
                    width: parent.width
                    text: modelData
                    onClicked:
                    {
                        // Логика выбора результата
                        console.log("Выбрано:", modelData)
                        searchPopup.close()
                    }
                }
            }
        }
    }
}

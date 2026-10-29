import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.folderlistmodel 2.15
import QtQuick.Window 2.0

Window
{
    id : searchwindow
   // objectName: "searchwindow" связь через С++
    width : 1450
    height : 750
    title : qsTr("Поиск файлов")
    visible : false
    color : "#FFCC80"
   // transientParent: base_window
    modality: Qt.ApplicationModal
    signal fileSelected(string path)
    signal directorySelected(string path)

    property string current_path: fileModel.folder

    ColumnLayout
    {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        RowLayout         // Панель навигации
        {
            Layout.fillWidth: true
            spacing: 5
            Button
            {
                id : text_button
                text: "⬅ Назад"
                background: Rectangle
                {
                    color: text_button.down    ? "#9B111E" :
                              text_button.hovered ?   "#C19A6B" : "#FFCC80"
                    border.color: "#FF8C00"
                    border.width: 2
                    radius: 4
                    Behavior on color { ColorAnimation { duration: 120 } }
                }
                contentItem: Text
                {
                    text: text_button.text
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    color: "black"
                }
                enabled: fileModel.parentFolder !== "" && fileModel.parentFolder !== fileModel.folder
                onClicked:
                {
                    fileModel.folder = fileModel.parentFolder
                }
            }
            Label
            {
                Layout.fillWidth: true
                text: "Текущее расположение: " + fileModel.folder.toString().replace("file://", "")
                elide: Text.ElideLeft
                font.pixelSize: 20
                color: "black"
                font.weight: Font.Bold
            }
            Button
            {
                id: selectButton
                text: "Выбрать"
                Layout.preferredWidth: implicitWidth  // Не даём кнопке сжаться
                background: Rectangle
                {
                    color: selectButton.down    ? "#9B111E" :
                              selectButton.hovered ?   "#C19A6B" : "#FFCC80"
                    border.color: "#FF8C00"
                    border.width: 2
                    radius: 4
                    Behavior on color { ColorAnimation { duration: 120 } }
                }
                contentItem: Text
                {
                    text: selectButton.text
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    color: "black"
                }
                onClicked:
                {
                    var path = fileModel.folder.toString().replace("file://", "")
                    searchWindow.directorySelected(path)               // Выбираем текущую директорию
                    searchWindow.close()
                }
            }
        }

        TextField         // Поле фильтра
        {
            id: filterField
            Layout.fillWidth: true
            placeholderText: "Фильтр по имени..."
            onTextChanged:
            {
                fileModel.nameFilters = text === "" ? ["*"] : ["*" + text + "*"]
            }
            Button
            {
                visible: filterField.text.length > 0
                width: 20
                height: 20
                anchors.right: parent.right
                anchors.rightMargin: 10
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
                onClicked: filterField.clear()
            }
        }

        ListView
        {
            id: fileListView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: fileModel

            delegate: ItemDelegate
            {
                visible: filterField.text === "" || !fileIsDir || fileName.toLowerCase().includes(filterField.text.toLowerCase())
                width: ListView.view.width
                text: (fileIsDir ? "📁 " : "📄 ") + fileName
                onClicked:
                {
                    if (fileIsDir)
                    {
                        fileModel.folder = fileUrl
                        filterField.text = ""
                    }
                    else
                    {
                        searchWindow.fileSelected(filePath)
                        searchWindow.close()
                    }
                }
            }

            FolderListModel
            {
                id: fileModel
                folder: "/home" // Начальный путь
                showDirs: true
                showFiles: true
                showDirsFirst: true
                showDotAndDotDot: false
            }
        }
    }
}

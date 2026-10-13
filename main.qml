import QtQuick 2.15
import QtQuick.Window 2.15


Window
{
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Column
    {
        spacing: 12
        anchors.left:  parent.left
        DescriptionInput {label_text: "Ширина временного окна:"; clue: "Пр: 900, 1800, 3600"}
        DescriptionInput {label_text: "Шаг по частоте:"; clue: "Пр: 1000"}
        DescriptionInput {label_text: "Тип гистограммы:"; clue: "Пр: Вероятностное"}
    }
}

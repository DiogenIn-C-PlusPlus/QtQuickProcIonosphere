import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0

Window
{
    id: base_window
    width: 640
    height: 450
    visible: true
    title: qsTr("Обработка эмпирических и моделированных данных")
    color: "#FFCC80"
    Row
    {
        id: chose_window
        spacing: 80
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin:  7
        Button
        {
            id: but_experiment
            text : "Эксперимент"
            background: Rectangle
            {
                color: but_experiment.down    ? "#9B111E" :
                          but_experiment.hovered ?   "#C19A6B" : "#FFCC80"
                border.color: "#FF8C00"
                border.width: 2
                radius: 4
                Behavior on color { ColorAnimation { duration: 120 } }
            }
            contentItem: Text
            {
                text: but_experiment.text
                font.pixelSize: 24
                font.weight: Font.Bold
                color: "black"
            }
        }
        Button
        {
            id: but_modeling
            text : "Моделирование"
            background: Rectangle
            {
                color: but_modeling.down    ? "#9B111E" :
                          but_modeling.hovered ?   "#C19A6B" : "#FFCC80"
                border.color: "#FF8C00"
                border.width: 2
                radius: 4
                Behavior on color { ColorAnimation { duration: 120 } }
            }
            contentItem: Text
            {
                text: but_modeling.text
                font.pixelSize: 24
                font.weight: Font.Bold
                color: "black"
            }
        }
    }

    DescriptionChoseVariant
    {
        id: chose_trace
        description_text : "Тип радиотрассы:"; combo_model: ["Кипр", "Алис-Спрингс"]
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: chose_window.bottom
        anchors.topMargin: 15
    }

    Column
    {
        id: form_parametrs_measurment
        spacing: 12
        anchors.left:  parent.left
        anchors.top:  chose_trace.bottom
        anchors.leftMargin: 20
        anchors.topMargin:  20
        DescriptionInput {label_text: "Ширина временного окна:"; clue: "Пр: 900, 1800, 3600"; units : "(с)"}
        DescriptionInput {label_text: "Шаг по частоте:"; clue: "Пр: 1000"; units : "(кГц)"}
        DescriptionChoseVariant {description_text : "Тип гистограммы:"; combo_model: ["Максимальное", "Расширяющие", "Вероятностное"] }
        ActionSearch {target_text: "Путь к считыванию данных:"; clue: "/home/user/data/2025_Kipr";}
        ActionSearch {target_text: "Путь к записи расчетов:"; clue: "/home/user/results/2025_Kipr";}
    }

    Button
    {
        id: run_button
        text: "Рассчитать"
        anchors.horizontalCenter: base_window.contentItem.horizontalCenter
        anchors.top:              form_parametrs_measurment.bottom
        anchors.topMargin:        45
        background: Rectangle
        {
            color: run_button.down    ? "#9B111E" :
                   run_button.hovered ?   "#C19A6B" : "#FFCC80"

            border.color: "#FF8C00"
            border.width: 2
            radius: 4
            Behavior on color { ColorAnimation { duration: 120 } }
        }
        contentItem: Text
        {
            text: run_button.text
            font.pixelSize: 20
            color: "black"
        }
    }
}

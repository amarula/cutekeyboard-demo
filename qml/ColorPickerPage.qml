import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

GridLayout {
    property alias backgroundColor:backgroundColor.text
    property alias btnBackgroundColor:btnBackgroundColor.text
    property alias btnSpecialBackgroundColor:btnSpecialBackgroundColor.text
    property alias btnTextColor:btnTextColor.text
    columns:2
    CustomTextField
    {
        id:backgroundColor
        font.pixelSize: parent.height*0.08
        text:"#000000"
        Layout.alignment: Qt.AlignCenter
    }
    CustomTextField
    {
        id:btnBackgroundColor
        font.pixelSize: parent.height*0.08
        text:"#808080"
        Layout.alignment: Qt.AlignCenter
    }
    CustomTextField
    {
        id:btnSpecialBackgroundColor
        font.pixelSize: parent.height*0.08
        text:Qt.darker("#808080")
        Layout.alignment: Qt.AlignCenter
    }
    CustomTextField
    {
        id:btnTextColor
        font.pixelSize: parent.height*0.08
        text:"#ffffff"
        Layout.alignment: Qt.AlignCenter
    }
}


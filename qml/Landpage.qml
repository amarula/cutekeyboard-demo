import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    FontLoader {
        id: titillFont
        source: "qrc:/amarulasolutions.com/imports/Fonts/Titillium_Web/TitilliumWeb-Regular.ttf"
    }
    Label
    {
        anchors.centerIn:   parent
        width:parent.width*0.9
        height:parent.height*0.9
        text: qsTr("Cute Keyboard\n Demo")
        fontSizeMode:Text.Fit
        font.pixelSize: 80
        font.family: titillFont.name
        color: "#afafb1"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}

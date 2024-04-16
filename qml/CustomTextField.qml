import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

TextField
{
    id:textfield
    color: "white"
    font.family: titillFont.name
    FontLoader {
        id: titillFont
        source: "qrc:/amarulasolutions.com/imports/Fonts/Titillium_Web/TitilliumWeb-Regular.ttf"
    }
    background: Item {
        implicitWidth: 200
        implicitHeight: 40
        Rectangle
        {
            id:botomline
            width:parent.width
            height:1
            anchors.bottom: parent.bottom
            color:"#afafb1"
        }
        Rectangle
        {
            width:parent.width*((textfield.activeFocus)?1.0:0.4)
            Behavior on width { SmoothedAnimation { velocity: 200 } }
            height:4
            anchors.verticalCenter: botomline.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color:"#afafb1"
            radius:Math.min(width,height);
            visible:textfield.enabled
        }
    }
}



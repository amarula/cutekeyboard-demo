import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


ColumnLayout
{
    id:control
    property string selected:inlayouts.get(languageselector.currentIndex).value
    Layout.bottomMargin: 10

    FontLoader {
        id: titillFont
        source: "qrc:/amarulasolutions.com/imports/Fonts/Titillium_Web/TitilliumWeb-Regular.ttf"
    }

    Item {
        id: languageselector
        property int currentIndex: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.margins: 20
        Layout.maximumWidth: 3*height
        Layout.maximumHeight: 300
        Layout.minimumHeight: 100
        Layout.alignment: Qt.AlignTop|Qt.AlignHCenter

        ListModel {
            id: inlayouts
            ListElement {
                name: "English"
                value: "En"
            }
            ListElement {
                name: "Français"
                value: "Fr"
            }
            ListElement {
                name: "Italiano"
                value: "It"
            }
            ListElement {
                name: "Español"
                value: "Es"
            }
            ListElement {
                name: qsTr("Deutsch")
                value: "De"
            }
            ListElement {
                name: "Nederlands"
                value: "Nl"
            }
            ListElement {
                name: "Português"
                value: "Pt"
            }
            ListElement {
                name: "Čeština"
                value: "Cs"
            }
            ListElement {
                name: "Ελληνικός"
                value: "El"
            }
            ListElement {
                name: "Polski"
                value: "Pl"
            }
        }
        Label
        {
            id:llanguage
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            text:qsTr("Layout language")
            font.pixelSize: 30
            font.family: titillFont.name
            color: "#afafb1"
        }
        RowLayout
        {
            anchors.fill: parent
            width:parent.width
            height:parent.height-llanguage.height
            anchors.top: llanguage.bottom
            Label
            {
                id:first
                text: (languageselector.currentIndex)?
                          inlayouts.get(languageselector.currentIndex-1).name:""
                Layout.fillWidth: true
                Layout.maximumWidth: parent.width*0.3
                Layout.fillHeight: true
                Layout.maximumHeight: 100
                opacity: 0.5
                color:"white"
                font.family: titillFont.name
                fontSizeMode:Text.Fit
                font.pixelSize: 80
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: { if(languageselector.currentIndex)languageselector.currentIndex--; }
                }
            }
            Label
            {
                id:second
                text: inlayouts.get(languageselector.currentIndex).name
                Layout.fillWidth: true
                Layout.maximumWidth: parent.width*0.4
                Layout.fillHeight: true
                Layout.maximumHeight: 200
                color:"white"
                font.family: titillFont.name
                fontSizeMode:Text.Fit
                font.pixelSize: 80
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Label
            {
                id:third
                text: (languageselector.currentIndex<inlayouts.rowCount()-1)?
                          inlayouts.get(languageselector.currentIndex+1).name:""
                Layout.fillWidth: true
                Layout.maximumWidth: parent.width*0.3
                Layout.fillHeight: true
                Layout.maximumHeight: 100
                color:"white"
                opacity: 0.5
                font.family: titillFont.name
                fontSizeMode:Text.Fit
                font.pixelSize: 80
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: { if(languageselector.currentIndex<inlayouts.rowCount()-1)languageselector.currentIndex++; }
                }
            }
        }

    }

    CustomTextField
    {
        id:textfield
        Layout.alignment: Qt.AlignBottom|Qt.AlignHCenter
        Layout.bottomMargin: 50
        Layout.fillWidth: true
        Layout.maximumWidth: 500

        font.pixelSize: parent.height*0.1

    }


}




import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQml 2.15

Item {

    Control
    {
        id:control
        property string text
        property string inputMask:"99999"
        property double margins:10
        property int echoMode: TextInput.Normal
        property int inputMethodHints: Qt.ImhDigitsOnly

        implicitWidth:rowlayout.implicitWidth
        implicitHeight:rowlayout.implicitHeight
        focus:true

        anchors.centerIn: parent
        width:parent.width*0.7
        height:parent.height*0.4

        font.pixelSize: Math.min(control.height,control.width)*0.2
        onFocusChanged: {
            if(control.focus)repeater.itemAt(0).focus=true;
        }

        function getText() {
            stext.text="";

            for (var i = 0; i < repeater.count; i++)  {
                stext.text+=repeater.itemAt(i).text;
            }
            if(stext.text!==control.text&&stext.text.length===repeater.count&&stext.acceptableInput)
            {
                control.text=stext.text;
                control.textChanged();
            }

        }
        function setText(vtext) {

            if(vtext==="")
            {
                stext.selectAll();
                stext.paste();
            }
            else
            {
                stext.text=vtext;
            }
            return (stext.text!==control.text&&stext.text.length===repeater.count&&stext.acceptableInput)
        }
        function useStext(){
            var ccount=0;
            for (var i = 0; i < repeater.count; i++)  {
                repeater.itemAt(i).text=stext.text.charAt(i);
                if(repeater.itemAt(i).acceptableInput)
                    ccount++;

            }
            if(ccount===repeater.count)
                control.getText();
        }

        function useClipBoard() {

            if(control.setText(""))
            {
                pastebutt.visible=true;
            }
        }
        Timer {
            id: timer
            property int cindex:0;
            interval: (control.echoMode===TextInput.PasswordEchoOnEdit)?500:0; running: false; repeat: false
            onTriggered: repeater.itemAt(timer.cindex).focus=true;
        }


        RowLayout {
            id:rowlayout
            anchors.fill: control

            Repeater {
                id:repeater
                model: control.inputMask.length
                delegate: CustomTextField
                {
                    id:tdel
                    required property int index
                    inputMask:control.inputMask.charAt(tdel.index)
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: control.margins
                    echoMode:control.echoMode
                    inputMethodHints:control.inputMethodHints
                    font:control.font
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignBottom
                    cursorVisible: false
                    Keys.onPressed: (event)=> {
                                        if (event.key === Qt.Key_Backspace) {
                                            if(tdel.cursorPosition===0&&tdel.index)
                                            {
                                                repeater.itemAt(index-1).focus=true;
                                            }
                                        }
                                        if (event.matches(StandardKey.Paste))
                                        {
                                            if(control.setText(""))
                                            {
                                                control.useStext();
                                            }

                                            event.accepted = true;
                                        }
                                    }
                    onFocusChanged: {
                        timer.stop();
                        if(focus)cursorPosition=0;
                    }
                    onPressAndHold: control.useClipBoard();
                    onTextEdited: {

                        if(tdel.acceptableInput)
                        {

                            if(repeater.itemAt(index+1))
                            {
                                timer.cindex=index+1;
                                timer.restart();
                            }
                            control.getText();
                        }

                    }


                }
            }
        }

        TextInput
        {
            id:stext
            visible:false
            inputMask: control.inputMask
        }
        Button
        {
            id:pastebutt
            anchors.centerIn: parent
            visible:false
            text: qsTr("Paste")
            onClicked: control.useStext();
            Timer {
                id: btimer
                interval: 5000; running: false; repeat: false
                onTriggered: pastebutt.visible=false;
            }
            onVisibleChanged:
            {
                if(pastebutt.visible)btimer.restart();
            }

        }

    }

}




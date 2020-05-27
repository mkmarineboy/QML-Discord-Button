import QtQuick.Controls 2.14
import QtQuick.Window 2.14
import QtQuick 2.14

import "./buttons"


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property color discordBlue: "#7289da"
    property color discordBlack0: "#424549"
    property color discordBlack1: "#36393e"
    property color discordBlack2: "#282b30"
    property color discordBlack3: "#1e2124"
    property color discordGreen: "#43b581"

    CircularIconButton{
        size: 50
        source: "qrc:/icons/globe.svg"
//       selected: true
        primaryColor : discordBlack0
        secondaryColor : discordGreen
        primaryEnabledColor: discordBlue
        secondaryEnabledColor : "white"
    }

}

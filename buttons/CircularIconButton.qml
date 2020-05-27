import QtQuick 2.14
import QtGraphicalEffects 1.14

Rectangle {
    id: root

    // PROPERTIES
    property string source
    property real size: 50
    property bool flat: false
    property bool highlighted: true
    property bool enabled: true
    property bool selected: false
    property color primaryColor : discordBlack0
    property color secondaryColor : discordGreen
    property color primaryEnabledColor: discordGreen
    property color secondaryEnabledColor : "white"

    // SIGNALS
    signal clicked

    color: primaryColor
    width: size
    height: size
    radius: size * 0.5

    Rectangle{
        id: innerButton

        width: parent.width * 0.4
        height: width
        radius: width * 0.5
        anchors.centerIn: parent
        color: parent.color

        Image{
            id: image

            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: root.source
            anchors.fill: parent
        }

        ColorOverlay{
            id: imageOverlay

            anchors.fill: image
            source:image
            color: secondaryColor
            transform:rotation
        }

    }

    //MOUSEAREA
    MouseArea{
        id: mouseArea

        property bool isEntered: false
        property bool isPressed: false

        anchors.fill: parent
        enabled: parent.enabled
        hoverEnabled: parent.enabled
        cursorShape: Qt.PointingHandCursor
        onPressed: {
            parent.state = "PRESSED"
            isPressed = true
        }
        onReleased: isEntered ? parent.state = "RELEASED" : parent.state = "EXITED"
        onEntered: {
            parent.state = "ENTERED"
            isEntered = true
        }
        onExited: {
            parent.state = parent.selected ? "ENTERED" : "EXITED"
            isEntered = false
        }
        onClicked: parent.clicked()
    }

    state: selected? "ENTERED" : "EXITED"

    //STATES
    states: [
        State {
            name: "ENTERED"
            PropertyChanges { target: root; radius: width * 0.3}
            PropertyChanges { target: root; color: primaryEnabledColor}
            PropertyChanges { target: imageOverlay; color: secondaryEnabledColor}
        },
        State {
            name: "EXITED"
            PropertyChanges { target: root; radius: width * 0.5}
            PropertyChanges { target: root; color: primaryColor}
            PropertyChanges { target: imageOverlay; color: secondaryColor}
        },
        State {
            name: "PRESSED"
            PropertyChanges { target: root; y: +2}
            PropertyChanges { target: root; radius: width * 0.3}
            PropertyChanges { target: root; color: primaryEnabledColor}
            PropertyChanges { target: imageOverlay; color:secondaryEnabledColor}
        },
        State {
            name: "RELEASED"
            PropertyChanges { target: root; radius: width * 0.3}
            PropertyChanges { target: root; color: primaryEnabledColor}
            PropertyChanges { target: imageOverlay; color: secondaryEnabledColor}
        },
        State {
            name: "SELECTED"
            PropertyChanges { target: root; radius: width * 0.3}
            PropertyChanges { target: root; color: primaryEnabledColor}
            PropertyChanges { target: imageOverlay; color: secondaryEnabledColor}
        }
    ]

    //TRANSITIONS
    transitions: [
        Transition {
            from: "EXITED"
            to: "ENTERED"
            NumberAnimation { properties: "radius"; from: width * 0.5; duration: 150}
            ColorAnimation {properties: "color"; from: discordBlack0; duration: 150 }
            ColorAnimation {properties: "color"; from: discordGreen; duration: 150 }
        },
        Transition {
            from: "ENTERED"
            to: "EXITED"
            NumberAnimation { properties: "radius"; from: width * 0.3;  duration: 150}
            ColorAnimation {properties: "color"; from: discordGreen; duration: 150 }
            ColorAnimation {properties: "color"; from: "white"; duration: 150 }
        },
        Transition {
            from: "PRESSED"
            to: "EXITED"
            NumberAnimation { properties: "radius"; from: width * 0.3; duration: 150}
        }

    ]
}

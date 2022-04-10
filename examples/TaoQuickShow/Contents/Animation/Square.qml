import QtQuick 2.9
import QtQuick.Controls 2.2
import aa 1.0

AnimationBase {
    anchors.fill: parent
    Image {
        id: src
        source: imgPath + "Effect/Girls/girl9.jpeg"
        visible: false
    }
    Grid {
        anchors.centerIn: parent
        columns: 2
        spacing: 40
        ASquare {
            id: s1
            width: 250
            height: 375
            dir: directFromInner
            effectSource.sourceItem: src
        }
        ASquare {
            id: s2
            width: 250
            height: 375
            dir: directFromOuter
            effectSource.sourceItem: src
        }
    }
    Component.onCompleted: {
        ani.start()
    }
    SequentialAnimation {
        id: ani
        ScriptAction {script: {s1.restart() } }
        PauseAnimation {duration: 1200}
        ScriptAction {script: {s2.restart() } }
    }
    onReplayClicked: {
        ani.restart()
    }
}

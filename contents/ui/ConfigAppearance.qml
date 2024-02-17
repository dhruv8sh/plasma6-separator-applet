import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Item {
    id: root

    property alias cfg_lengthMargin: lengthMargin.value
    property alias cfg_thickMargin: thickMargin.value

    // used from the ui
    readonly property real centerFactor: 0.3
    readonly property int minimumWidth: 220

    ColumnLayout {
        spacing: Kirigami.Units.largeSpacing
        Layout.fillWidth: true

        GridLayout{
            columns: 2
            Label {
                Layout.minimumWidth: Math.max(centerFactor * root.width, minimumWidth)
                text: i18n("Length margin:")
                horizontalAlignment: Text.AlignRight
            }

            SpinBox{
                id: lengthMargin

                from: 1
                to: 64
                stepSize: 1
                textFromValue: function(value,locale) { return qsTr("%1 px").arg(value)}
            }

            Label {
                Layout.minimumWidth: Math.max(centerFactor * root.width, minimumWidth)
                text: i18n("Thickness margin:")
                horizontalAlignment: Text.AlignRight
            }

            SpinBox{
                id: thickMargin
                from: 0
                to: 64
                stepSize: 1
                textFromValue: function(value,locale) { return qsTr("%1 px").arg(value)}
            }
        }

    }
}

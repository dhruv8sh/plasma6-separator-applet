import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.extras as PlasmaExtras
import org.kde.kirigami as Kirigami
PlasmoidItem {
    id: root
    readonly property bool horizontal: plasmoid.formFactor === PlasmaCore.Types.Horizontal
    readonly property bool planar: plasmoid.formFactor === PlasmaCore.Types.Planar

    Layout.fillWidth: horizontal ? false : true
    Layout.fillHeight: horizontal ? true : false

    Layout.minimumWidth:   horizontal ? length : -1
    Layout.preferredWidth: Layout.minimumWidth
    Layout.maximumWidth:   Layout.minimumWidth

    Layout.minimumHeight: !horizontal ? length : -1
    Layout.preferredHeight: Layout.minimumHeight
    Layout.maximumHeight: Layout.minimumHeight

    preferredRepresentation: fullRepresentation
    // backgroundHints: planar ? PlasmaCore.Types.StandardBackground : PlasmaCore.Types.NoBackground

    readonly property int length: Math.max(1, totalLength)
    readonly property int totalLength: 2*plasmoid.configuration.lengthMargin

    readonly property int fullThickness: {
        return plasmoid.formFactor === PlasmaCore.Types.Vertical ? parent.width - 10 : parent.height - 10
    }
    readonly property int thickness: fullThickness - (2*thickMargin)

    readonly property int thickMargin: plasmoid.configuration.thickMargin
    readonly property int lengthMargn: plasmoid.configuration.lengthMargin

    function increaseLength() {
        plasmoid.configuration.lengthMargin = plasmoid.configuration.lengthMargin + 4;
    }

    function decreaseLength() {
        plasmoid.configuration.lengthMargin = Math.max(0,plasmoid.configuration.lengthMargin - 4);
    }

    Rectangle {
        id: sep
        anchors.centerIn: parent

        width: horizontal ? 1 : thickness
        height: !horizontal ? 1 : thickness
        color: Kirigami.Theme.textColor
        opacity: 0.4
        visible: !planar
    }
}

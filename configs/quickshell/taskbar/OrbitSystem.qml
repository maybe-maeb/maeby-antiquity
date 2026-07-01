import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick
import Qt5Compat.GraphicalEffects
import "../smallicons/" as Smallicons
import "../utils/" as Utils
import "../sidebarPopups/" as Popups
import ".."

Scope {

    Variants {
        model: Quickshell.screens
        Item {
            id: root
            required property var modelData

            // This is a "tap outside of popup to close it" functionality. Might abstract it later.
            PanelWindow {
                id: closerPanel
                screen: root.modelData
                WlrLayershell.layer: WlrLayer.Top
                visible: !radialTaskbar.isOpen && radialTaskbar.currentPopup == Config.SidebarPopup.None ? false : true
                //WlrLayershell.layer: WlrLayer.Bottom
                exclusionMode: ExclusionMode.Ignore //Ignore
                color: Qt.rgba(0, 0, 0, 0)
                anchors {
                    top: true
                    bottom: true
                    left: true
                    right: true
                }
                MouseArea {
                    anchors.fill: parent
                    z: -1
                    onClicked: {
                        radialTaskbar.closeAllPopups();
                    }
                }
            }


            Popups.PowerMenu {
            anchorWindow: radialTaskbar
            buttonItem: sunButton
            popupState: radialTaskbar.currentPopupsasatttea
        }

        Popups.FavoriteAppsMenu {
            anchorWindow: radialTaskbar
            popupState: radialTaskbar.currentPopup
            closeCallback: radialTaskbar.closeAllPopups
        }

        Popups.ThemingMenu {
            anchorWindow: radialTaskbar
            popupState: radialTaskbar.currentPopup
        }

        Popups.MainMenu {
            anchorWindow: radialTaskbar
            popupState: radialTaskbar.currentPopup
            closeCallback: radialTaskbar.closeAllPopups
        }

        Popups.AppLauncher {
            anchorWindow: radialTaskbar
            popupState: radialTaskbar.currentPopup
            closeCallback: radialTaskbar.closeAllPopups
        }


            PanelWindow {
                id: radialTaskbar
                screen: root.modelData
                WlrLayershell.layer: isOpen || currentPopup != Config.SidebarPopup.None ? WlrLayer.Top : WlrLayer.Bottom
Item {
    id: modalOverlay
    anchors.fill: parent
    z: 9999

    property bool active: radialTaskbar.currentPopup !== Config.SidebarPopup.None
                       || radialTaskbar.isOpen

    // invisible when inactive, but still exists
    visible: active
    opacity: active ? 1 : 0

    Behavior on opacity {
        NumberAnimation { duration: 0 } // explicitly NO animation
    }

    Rectangle {
        anchors.fill: parent
        color: "#55000000"
    }

    MouseArea {
        anchors.fill: parent
        enabled: modalOverlay.active

        onClicked: radialTaskbar.closeAllPopups()
    }
}
                //WlrLayershell.layer: WlrLayer.Bottom
                exclusionMode: ExclusionMode.Ignore //Ignore
                WlrLayershell.namespace: "diinki_celestialantiquity:bars"

                property int currentPopup: Config.SidebarPopup.None

                property bool isOpen: false
                /*function refreshState(workspaceId) {
                    Hyprland.dispatch(`workspace ` + workspaceId);
                }*/
                function closeAllPopups() {
                    currentPopup = Config.SidebarPopup.None;

                    radialTaskbar.isOpen = false;
                }
                anchors {
                    top: false
                    bottom: false
                    left: false
                    right: false
                }
                implicitWidth: screen.width
                implicitHeight: screen.height
                color: Qt.rgba(0, 0, 0, 0)

                /*
                // Close the popup when clicking outside of the window.

                */
                Item {
                    id: radialBarCurve
                    anchors.fill: parent
                    // This is kind of ugly, prolly a better way to get this kind of
                    // dynamic scale depending on screen size, but width of the screen
                    // divided by 3 is a reasonable width in my opinion.
                    property point pointA: Qt.point(0, parent.height - parent.height / 1.38)
                    property point pointB: Qt.point(0, parent.height / 1.38)
                    property real curvature: 175

                    property point innerPointA: Qt.point(0, parent.height - parent.height / 1.57)
                    property point innerPointB: Qt.point(0, parent.height / 1.57)


                    Canvas {
                        id: orbitCanvas
                        anchors.fill: parent
                        z: -1

                        property point center: Qt.point(width / 2, height / 2)

                        function drawOrbit(ctx, radius, color) {
                            ctx.beginPath();
                            ctx.arc(width / 2, height / 2, radius, 0, Math.PI * 2);

                            if (Config.orbitPathColorOverride == Qt.rgba(0,0,0,0)) 
                            {
                                var c = Qt.color(color)
                                ctx.strokeStyle = Qt.rgba(c.r, c.g, c.b, Config.orbitPathTransparency)
                            }
                            else ctx.strokeStyle = Config.orbitPathColorOverride
                            ctx.stroke();
                        }

                        onPaint: {
                            var ctx = getContext("2d");

                            ctx.reset();

                            ctx.lineWidth = 1;

                            // match your planet radii
                            drawOrbit(ctx, Config.mercuryDistance, Config.colors.mercuryColor);
                            drawOrbit(ctx, Config.venusDistance, Config.colors.venusColor);
                            drawOrbit(ctx, Config.earthDistance, Config.colors.earthColor);
                            drawOrbit(ctx, Config.marsDistance, Config.colors.marsColor);
                            drawOrbit(ctx, Config.jupiterDistance, Config.colors.jupiterColor);
                            drawOrbit(ctx, Config.saturnDistance, Config.colors.saturnColor);
                            drawOrbit(ctx, Config.uranusDistance, Config.colors.uranusColor);
                            drawOrbit(ctx, Config.neptuneDistance, Config.colors.neptuneColor);
                        }
                    }

                    function controlPoint(a, b, curve) {
                        var midX = (a.x + b.x) / 2;
                        var midY = (a.y + b.y) / 2;
                        return Qt.point(midX + curve, midY);
                    }
                    function pointOnCurve(t, a, b) {
                        var cp = controlPoint(a, b, curvature);
                        var x = Math.pow(1 - t, 2) * pointA.x + 2 * (1 - t) * t * cp.x + Math.pow(t, 2) * pointB.x;

                        var y = Math.pow(1 - t, 2) * pointA.y + 2 * (1 - t) * t * cp.y + Math.pow(t, 2) * pointB.y;

                        return Qt.point(x, y);
                    }

                    // Sun: PowerMenu
                    Rectangle {
                        id: sunButton
                        width: Config.sunSize
                        height: Config.sunSize
                        anchors.centerIn: parent
                        property real t: 1 - 0.0
                        property point p: parent.pointOnCurve(t, parent.pointA, parent.pointB)

                        property point center: Qt.point(sunButton.x + sunButton.width/2,
                                sunButton.y + sunButton.height/2)

                     

                        color: "transparent"
                        RectangularShadow {
                            anchors.centerIn: parent
                            width: config.sunSize
                            height: config.sunSize
                            radius: width / 2
                            blur: 32
                        }

                        Popups.PowerMenu {
                            id: powerMenu
                            anchorWindow: radialTaskbar
                            buttonItem: sunButton
                            popupState: radialTaskbar.currentPopup
                        }
                        Smallicons.StarMoodRelaxed {
                            id: sunImage
                            backgroundColor: Config.colors.cbodyPowerMenu
                            lineColor: Config.colors.cbodyStroke
                            width: sunButton.width
                            height: sunButton.height
                            anchors.centerIn: parent
                            transform: [
                                Rotation {
                                    id: rotation
                                    origin.x: sunImage.width / 2
                                    origin.y: sunImage.height / 2
                                    angle: 0
                                }
                            ]
                            SequentialAnimation {
                                id: wiggle
                                running: true
                                loops: Animation.Infinite
                                NumberAnimation {
                                    target: rotation
                                    property: "angle"
                                    to: -10
                                    duration: 4400
                                    easing.type: Easing.InOutQuad
                                }
                                NumberAnimation {
                                    target: rotation
                                    property: "angle"
                                    to: 10
                                    duration: 4400
                                    easing.type: Easing.InOutQuad
                                }
                            }
                        }
                        MouseArea {
                            anchors.fill: sunImage

                            onClicked: {
                                radialTaskbar.currentPopup = radialTaskbar.currentPopup == Config.SidebarPopup.PowerMenu ? Config.SidebarPopup.None : Config.SidebarPopup.PowerMenu;
                            }
                            HoverHandler {
                                acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                                cursorShape: Qt.PointingHandCursor
                            }
                        }
                    }
                    //Mercury
                    Planet {
                        size: Config.planetSize
                        angle: Config.mercuryAngle
                        distance: Config.mercuryDistance
                        center: sunButton.center

                        onClicked: {
                            radialTaskbar.currentPopup =
                                radialTaskbar.currentPopup === Config.SidebarPopup.FavoriteAppsMenu
                                    ? Config.SidebarPopup.None
                                    : Config.SidebarPopup.FavoriteAppsMenu
                        }

                        Smallicons.CbodyMoodAgitated {
                            anchors.fill: parent
                            backgroundColor: Config.colors.mercuryColor
                            lineColor: Config.colors.cbodyStroke
                        }
                    }
                    // Venus: themes
                    Planet {
                        size: Config.planetSize
                        angle: Config.venusAngle
                        distance: Config.venusDistance
                        center: sunButton.center

                        onClicked: {
                            radialTaskbar.currentPopup =
                                radialTaskbar.currentPopup === Config.SidebarPopup.ThemingMenu
                                    ? Config.SidebarPopup.None
                                    : Config.SidebarPopup.ThemingMenu
                        }

                        Smallicons.CbodyMoodContent {
                            anchors.fill: parent
                            backgroundColor: Config.colors.venusColor
                            lineColor: Config.colors.cbodyStroke
                        }
                    }
                    // Earth: Menu
                    Planet {
                        size: Config.planetSize
                        angle: Config.earthAngle
                        distance: Config.earthDistance
                        center: sunButton.center

                        onClicked: {
                            radialTaskbar.isOpen = true
                            radialTaskbar.currentPopup =
                                radialTaskbar.currentPopup === Config.SidebarPopup.MainMenu
                                    ? Config.SidebarPopup.None
                                    : Config.SidebarPopup.MainMenu
                        }

                        Smallicons.CbodyMoodRelaxed {
                            anchors.fill: parent
                            backgroundColor: Config.colors.earthColor
                            lineColor: Config.colors.cbodyStroke
                        }
                    }
                    //Mars
                    Planet {
                        size: Config.planetSize
                        angle: Config.marsAngle
                        distance: Config.marsDistance
                        center: sunButton.center

                        onClicked: {
                            radialTaskbar.isOpen = true
                            radialTaskbar.currentPopup =
                                radialTaskbar.currentPopup === Config.SidebarPopup.AppLauncher
                                    ? Config.SidebarPopup.None
                                    : Config.SidebarPopup.AppLauncher
                        }

                        Smallicons.CbodyMoodRelaxed {
                            anchors.fill: parent
                            backgroundColor: Config.colors.marsColor
                            lineColor: Config.colors.cbodyStroke
                        }
                    }
                    //Jupiter
                    Planet {
                        size: Config.planetSize
                        angle: Config.jupiterAngle
                        distance: Config.jupiterDistance
                        center: sunButton.center

                        onClicked: {
                            radialTaskbar.isOpen = true
                            radialTaskbar.currentPopup =
                                radialTaskbar.currentPopup === Config.SidebarPopup.AppLauncher
                                    ? Config.SidebarPopup.None
                                    : Config.SidebarPopup.AppLauncher
                        }

                        Smallicons.CbodyMoodRelaxed {
                            anchors.fill: parent
                            backgroundColor: Config.colors.jupiterColor
                            lineColor: Config.colors.cbodyStroke
                        }
                    }
                    //Saturn
                    Planet {
                        size: Config.planetSize
                        angle: Config.saturnAngle
                        distance: Config.saturnDistance
                        center: sunButton.center

                        onClicked: {
                            radialTaskbar.isOpen = true
                            radialTaskbar.currentPopup =
                                radialTaskbar.currentPopup === Config.SidebarPopup.AppLauncher
                                    ? Config.SidebarPopup.None
                                    : Config.SidebarPopup.AppLauncher
                        }

                        Smallicons.CbodyMoodRelaxed {
                            anchors.fill: parent
                            backgroundColor: Config.colors.saturnColor
                            lineColor: Config.colors.cbodyStroke
                        }
                    }
                    //Uranus
                    Planet {
                        size: Config.planetSize
                        angle: Config.uranusAngle
                        distance: Config.uranusDistance
                        center: sunButton.center

                        onClicked: {
                            radialTaskbar.isOpen = true
                            radialTaskbar.currentPopup =
                                radialTaskbar.currentPopup === Config.SidebarPopup.AppLauncher
                                    ? Config.SidebarPopup.None
                                    : Config.SidebarPopup.AppLauncher
                        }

                        Smallicons.CbodyMoodRelaxed {
                            anchors.fill: parent
                            backgroundColor: Config.colors.uranusColor
                            lineColor: Config.colors.cbodyStroke
                        }
                    }
                    //Neptune
                    Planet {
                        size: Config.planetSize
                        angle: Config.neptuneAngle
                        distance: Config.neptuneDistance
                        center: sunButton.center

                        onClicked: {
                            radialTaskbar.isOpen = true
                            radialTaskbar.currentPopup =
                                radialTaskbar.currentPopup === Config.SidebarPopup.AppLauncher
                                    ? Config.SidebarPopup.None
                                    : Config.SidebarPopup.AppLauncher
                        }

                        Smallicons.CbodyMoodRelaxed {
                            anchors.fill: parent
                            backgroundColor: Config.colors.neptuneColor
                            lineColor: Config.colors.cbodyStroke
                        }
                    }
            

                    
                // Mouse areas in order to move the ui to the front or back depending on
                // mouse enter.
                MouseArea {
                    //anchors.top: parent.top
                    //anchors.bottom: parent.bottom
                    //anchors.top: parent.top
                    anchors.left: parent.left
                    //anchors.centerIn: parent
                    width: 8
                    height: parent.height / 1.7
                    y: (parent.height - height) / 2

                    hoverEnabled: true
                    onEntered: {
                        radialTaskbar.isOpen = true;
                    }
                }
                MouseArea {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    height: 8
                    width: 10
                    hoverEnabled: true
                    onEntered: {
                        if (radialTaskbar.currentPopup == Config.SidebarPopup.None) {
                            radialTaskbar.isOpen = false;
                        }
                    }
                }
            }
        }
    }
}
}
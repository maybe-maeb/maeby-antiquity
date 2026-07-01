pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    
    //*=======================================================================*/
    // READ THIS NOTE:
    // Simply add to this list in order to create your
    // own color schemes, they will automatically show up in the theme picker.
    property var colors: themes[themes[settings.currentTheme] == null ? 'helios' : settings.currentTheme]
    property var themes: {
        "helios": {
            "base": "#181818",
            "shadow": "#121212",
            "highlight": "#333333",
            "urgent": "#ff723e",
            "accent": "#fccf8a",
            "accentDark": "#87704f",
            "text": "#121212",
            "textLight": "#d0daed",
            "outline": "#121212",
            "outlineGradientFade": "#161616",
            "defaultWallpaperPath": "",
            "danger": "#fc5870",
            "warning": "#fcd37b",
            "cbodyBackground": "#fccf8a",
            "cbodyBackgroundShadow": "#d1a67b",
            "cbodyMoonBackground": "#484a5e",
            "cbodyMoonBackgroundShadow": "#5e5e5e",
            "cbodyStroke": "#000000",
            "cbodyPowerMenu": "#fccf8a",
            "cbodyThemingMenu": "#a0675d",
            "cbodyFavoriteApps": "#5e5e5e",
            "cbodyMainMenu": "#666c93",
            "glassTintColor": "#fce2ab",
            "appLauncherBackground": "#252525",
            "patternLineColor": "#87704f",
            "humorWet": "#425682",
            "humorDry": "#c4a78f",
            "humorCold": "#92bbcc",
            "humorHot": "#c44444",
            "elementAir": "#ccdde2",
            "elementWater": "#6f8ebc",
            "elementEarth": "#473e39",
            "elementFire": "#c15555",

            mercuryColor: '#929191',
            venusColor: '#c18a24',
            earthColor: '#4059b1',
            marsColor: '#c05b20',
            jupiterColor: '#dab67f',
            saturnColor: '#d1c46b',
            uranusColor: '#88d2c0',
            neptuneColor: '#7b8bc3'
        },
        "eris": {
            "base": "#1b1c1e",
            "shadow": "#121212",
            "highlight": "#2f2f33",
            "urgent": "#ff723e",
            "accent": "#c7cfe5",
            "accentDark": "#989daa",
            "text": "#121212",
            "textLight": "#b6aae2",
            "outline": "#121212",
            "danger": "#fc5870",
            "warning": "#fcd37b",
            "cbodyBackground": "#d2dddc",
            "cbodyBackgroundShadow": "#97a09f",
            "cbodyMoonBackground": "#484a5e",
            "cbodyMoonBackgroundShadow": "#5e5e5e",
            "cbodyStroke": "#000000",
            "cbodyPowerMenu": "#d2dddc",
            "cbodyThemingMenu": "#767d7f",
            "cbodyFavoriteApps": "#536868",
            "cbodyMainMenu": "#68877f",
            "glassTintColor": "#b9c5c9",
            "appLauncherBackground": "#252525",
            "patternLineColor": "#505160",
            "humorWet": "#425682",
            "humorDry": "#c4a78f",
            "humorCold": "#92bbcc",
            "humorHot": "#c44444",
            "elementAir": "#ccdde2",
            "elementWater": "#6f8ebc",
            "elementEarth": "#473e39",
            "elementFire": "#c15555",

            mercuryColor: '#929191',
            venusColor: '#c18a24',
            earthColor: '#4059b1',
            marsColor: '#c05b20',
            jupiterColor: '#dab67f',
            saturnColor: '#d1c46b',
            uranusColor: '#88d2c0',
            neptuneColor: '#7b8bc3'
        },
        "priapus": {
            "base": "#1f211e",
            "shadow": "#121410",
            "highlight": "#393d2d",
            "urgent": "#ff723e",
            "accent": "#a7b777",
            "accentDark": "#747c5c",
            "text": "#121212",
            "textLight": "#d0daed",
            "outline": "#141612",
            "danger": "#fc5870",
            "warning": "#fcd37b",
            "cbodyBackground": "#f2efb3",
            "cbodyBackgroundShadow": "#aaa87c",
            "cbodyMoonBackground": "#484a5e",
            "cbodyMoonBackgroundShadow": "#5e5e5e",
            "cbodyStroke": "#000000",
            "cbodyPowerMenu": "#f2d793",
            "cbodyThemingMenu": "#666c75",
            "cbodyFavoriteApps": "#5b5050",
            "cbodyMainMenu": "#5b6b54",
            "glassTintColor": "#a6bf85",
            "appLauncherBackground": "#252525",
            "patternLineColor": "#4a5437",
            "humorWet": "#425682",
            "humorDry": "#cdce8c",
            "humorCold": "#bcd8d6",
            "humorHot": "#c44444",
            "elementAir": "#c7e0ca",
            "elementWater": "#6f8ebc",
            "elementEarth": "#3e3f2f",
            "elementFire": "#c15555",

            mercuryColor: '#929191',
            venusColor: '#c18a24',
            earthColor: '#4059b1',
            marsColor: '#c05b20',
            jupiterColor: '#dab67f',
            saturnColor: '#d1c46b',
            uranusColor: '#88d2c0',
            neptuneColor: '#7b8bc3'
        },
        "eros": {
            "base": "#15101c",
            "shadow": "#110c16",
            "highlight": "#2c243d",
            "urgent": "#ff723e",
            "accent": "#fccb7b",
            "accentDark": "#87704f",
            "text": "#121212",
            "textLight": "#d0daed",
            "outline": "#0c0b0c",
            "danger": "#eda1a6",
            "warning": "#fcd37b",
            "cbodyBackground": "#f9997f",
            "cbodyBackgroundShadow": "#b78487",
            "cbodyMoonBackground": "#484a5e",
            "cbodyMoonBackgroundShadow": "#5e5e5e",
            "cbodyStroke": "#000000",
            "cbodyPowerMenu": "#f9997f",
            "cbodyThemingMenu": "#705a7a",
            "cbodyFavoriteApps": "#ad7082",
            "cbodyMainMenu": "#53475e",
            "glassTintColor": "#3c2d66",
            "appLauncherBackground": "#252525",
            "patternLineColor": "#725c3b",
            "humorWet": "#425682",
            "humorDry": "#c4a78f",
            "humorCold": "#92bbcc",
            "humorHot": "#c44444",
            "elementAir": "#ccdde2",
            "elementWater": "#6f8ebc",
            "elementEarth": "#473e39",
            "elementFire": "#c15555",

            mercuryColor: '#929191',
            venusColor: '#c18a24',
            earthColor: '#4059b1',
            marsColor: '#c05b20',
            jupiterColor: '#dab67f',
            saturnColor: '#d1c46b',
            uranusColor: '#88d2c0',
            neptuneColor: '#7b8bc3'
        },
        "hades": {
            "base": "#181818",
            "shadow": "#121212",
            "highlight": "#333333",
            "urgent": "#ff723e",
            "accent": "#d1ceca",
            "accentDark": "#969593",
            "text": "#eaeaea",
            "textLight": "#f7f8f9",
            "outline": "#e3e7e8",
            "danger": "#aa3a3a",
            "warning": "#c6c479",
            "cbodyBackground": "#181818",
            "cbodyBackgroundShadow": "#121212",
            "cbodyMoonBackground": "#484a5e",
            "cbodyMoonBackgroundShadow": "#5e5e5e",
            "cbodyStroke": "#eaeaea",
            "cbodyPowerMenu": "#181818",
            "cbodyThemingMenu": "#181818",
            "cbodyFavoriteApps": "#181818",
            "cbodyMainMenu": "#181818",
            "glassTintColor": "#d7dddb",
            "appLauncherBackground": "#252525",
            "patternLineColor": "#7f7f7f",
            "humorWet": "#425682",
            "humorDry": "#c6c479",
            "humorCold": "#8da5c9",
            "humorHot": "#c44444",
            "elementAir": "#cccccc",
            "elementWater": "#66929e",
            "elementEarth": "#423f3d",
            "elementFire": "#c15555",

            mercuryColor: '#929191',
            venusColor: '#c18a24',
            earthColor: '#4059b1',
            marsColor: '#c05b20',
            jupiterColor: '#dab67f',
            saturnColor: '#d1c46b',
            uranusColor: '#88d2c0',
            neptuneColor: '#7b8bc3'
        }
    }

    property real planetSize: 85
    property real sunSize: 150

    //Keep distance underneath ~690 on 1440p monitors to keep it on the screen
    //Keep distance above 105 on 1440p monitors to keep it outside of the sun
    //If you want to make sure no planets collide, keep them at least 45 units apart

    //If you want every planet to be the same distance apart, make each planet 83 units further from the previous (so if mercury was at 105, make venus 178)

    property real mercuryDistance: 105
    property real venusDistance: 188
    property real earthDistance: 271
    property real marsDistance: 354
    property real jupiterDistance: 437
    property real saturnDistance: 520
    property real uranusDistance: 603
    property real neptuneDistance: 686

    ////////////////////////////////////////////////////////////////////////////////////////////////////
        //You can choose how you'd like your planets organized. Leave whichever version you want uncommented
        //Angle is 0-360 (0 being above the sun, 90 being to the right, etc)

            //Fixed
                /*property real mercuryAngle: 0
                property real venusAngle: 0
                property real earthAngle: 0
                property real marsAngle: 0
                property real jupiterAngle: 0
                property real saturnAngle: 0
                property real uranusAngle: 0
                property real neptuneAngle: 0*/

            //Real-Time (adjust targetDate below so orbits are relative to your chosen date. Default is Jan 1 2000)
                property real mercuryAngle: angleByOrbitDuration(87.9693)
                property real venusAngle: angleByOrbitDuration(224.7008)
                property real earthAngle: angleByOrbitDuration(365.2564)
                property real marsAngle: angleByOrbitDuration(686.9796)
                property real jupiterAngle: angleByOrbitDuration(4,332.5890)
                property real saturnAngle: angleByOrbitDuration(10,759.2200)
                property real uranusAngle: angleByOrbitDuration(30,685.4000)
                property real neptuneAngle: angleByOrbitDuration(60,189.0000)
        ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Whenever a planet is back to where it was on this date, it will be directly above the sun.
    //If you set it to the date you're reading his, all planets will be above the sun in a straight line.
        //88 days from now, Mercury would be back above the Sun because its orbit is 88 days, 
        //Earth would be to the right because it would only be about a quarter of the way through its orbit
    //If you set this to your birthday, if a planet was straight up, that would mean it was back to where it was when you were born
    property date targetDate: new Date(2000, 0, 1) //Months are 0-indexed, so Jan is 0, Feb is 1, etc

    //Only used if orbitPathColorOverride is (0,0,0,0)
    property real orbitPathTransparency: 0.4

    //If you want every orbit path to be the same color, update this. If this is (0,0,0,0), orbit paths will match the color of the planet
    property color orbitPathColorOverride: Qt.rgba(0, 0, 0, 0)

    enum SystemPopup {
        Startmenu,
        ThemePicker,
        AppLauncher,
        None
    }
    enum SidebarPopup {
        PowerMenu,
        FavoriteAppsMenu,
        ThemingMenu,
        MainMenu,
        AppLauncher,
        None
    }
    // TODO: Finish adding all the other widgets
    readonly property var widgetTypes: ["Weather"]
    readonly property var widgetPaths: {
        "Weather": "WeatherWidget.qml"
        //"CPUTemp": "CPUTemperatureWidget.qml",
        //"GPUTemp": "GPUTemperatureWidget.qml",
        //"RAM": "RAMWidget.qml",
        //"Clock": "ClockWidget.qml",
        //"TheDate": "DateWidget.qml"
    }

    // Weather stuff
    property var weatherData: undefined
    function fetchWeatherData() {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status == 200) {
                weatherData = JSON.parse(xmlhttp.responseText);
            }
        };

        const url = `https://api.openweathermap.org/data/2.5/weather` + `?q=${settings.openWeatherMap.city}` + `&appid=${settings.openWeatherMap.apiKey}` + `&units=metric` + `&lang=en`;

        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }
    Timer {
        interval: 10 * 60 * 1000
        running: Config.settings.openWeatherMap.enableWeather
        repeat: Config.settings.openWeatherMap.enableWeather
        triggeredOnStart: Config.settings.openWeatherMap.enableWeather
        onTriggered: Config.fetchWeatherData()
    }

    function toggleFavoriteApp(appName: string, exec: list<string>, iconPath: string) {
        let updated = Object.assign({}, favoriteApps);
        if (favoriteApps[appName] != null) {
            delete favoriteApps[appName];
            return;
        }
        if (!favoriteApps[appName]) {
            updated[appName] = {};
            favoriteApps = updated;
        }
        updated[appName] = {
            "name": appName,
            "execCommand": exec,
            "icon": iconPath
        };
        favoriteApps = updated;
    }
    property alias favoriteApps: favoriteAppsAdapter.apps
    FileView {
        path: Qt.resolvedUrl("./favoriteapps.json")
        // when changes are made on disk, reload the file's content
        watchChanges: true
        onFileChanged: reload()
        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        onLoadFailed: error => {
            if (error == FileViewError.FileNotFound) {
                writeAdapter();
            }
        }
        JsonAdapter {
            id: favoriteAppsAdapter

            // IGNORE WARNING, do not wrap in ()
            property var apps: ({})
        }
    }
    //Widgets
    function addWidget(monitorName: string, widgetType: int, widgetName: string, x: int, y: int, enableBackground: bool) {
        let updated = Object.assign({}, widgets);
        if (!widgets[monitorName]) {
            updated[monitorName] = {};
            widgets = updated;
        }
        updated[monitorName] = Object.assign({}, updated[monitorName]);
        updated[monitorName][Object.keys(updated[monitorName]).length] = {
            "widgetName": widgetName,
            "widgetType": widgetType,
            "x": x,
            "y": y,
            "enableBackground": enableBackground,
            "monitorName": monitorName,
            "widgetId": Object.keys(updated[monitorName]).length.toString()
        };
        widgets = updated;
    }
    function updateWidget(monitorName: string, widgetId: int, widgetName: string, x: int, y: int, enableBackground: bool, widgetType: int) {
        let updated = Object.assign({}, widgets);
        if (!widgets[monitorName]) {
            console.error("Monitor not found!");
            return;
        }
        updated[monitorName] = Object.assign({}, updated[monitorName]);
        updated[monitorName][widgetId] = {
            "widgetName": widgetName,
            "widgetType": widgetType,
            "x": x,
            "y": y,
            "enableBackground": enableBackground,
            "monitorName": monitorName,
            "widgetId": widgetId
        };
        widgets = updated;
    }
    function removeWidget(monitorName: string, widgetId: string) {
        let updated = Object.assign({}, widgets);
        delete updated[monitorName][widgetId];
        widgets = updated;
    }
    property alias widgets: widgetsAdapter.monitors
    FileView {
        path: Qt.resolvedUrl("./widgets.json")
        // when changes are made on disk, reload the file's content
        watchChanges: true
        onFileChanged: reload()
        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        onLoadFailed: error => {
            if (error == FileViewError.FileNotFound) {
                writeAdapter();
            }
        }
        JsonAdapter {
            id: widgetsAdapter

            // IGNORE WARNING, do not wrap in ()
            property var monitors: ({})
        }
    }

    property bool openSettingsWindow: false
    property alias settings: settingsJsonAdapter.settings
    FileView {
        path: Qt.resolvedUrl("./settings.json")
        // when changes are made on disk, reload the file's content
        watchChanges: true
        onFileChanged: reload()
        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        onLoadFailed: error => {
            if (error == FileViewError.FileNotFound) {
                writeAdapter();
            }
        }

        JsonAdapter {
            id: settingsJsonAdapter
            property JsonObject settings: JsonObject {
                property string version: "0.1"
                property bool militaryTimeClockFormat: true
                property string currentTheme: "helios"
                property int defaultWindowRadius: 12
                property bool appLauncherBackground: true
                property JsonObject openWeatherMap: JsonObject {
                    property string apiKey: ""
                    property string city: "Umeå"
                    property string unit: "metric" //standard = kelvin, metric = c, imperial = F
                    property bool enableWeather: false
                }
                property JsonObject execCommands: JsonObject {
                    property string terminal: "kitty"
                    property string files: "nemo"
                }
                property JsonObject bar: JsonObject {
                    property int fontSize: 12
                    property double workspacePadding: 0.032
                    property int trayIconSize: 12
                    property bool monochromeTrayIcons: true
                }
                onCurrentThemeChanged: {
                    console.info("Updated theme to: " + currentTheme);
                }
            }
        }
    }




    //Planet positioning stuff

    function daysSince(dateInput) {
        var past = (dateInput instanceof Date) ? dateInput : new Date(dateInput);
        var now = new Date();

        past.setHours(0,0,0,0);
        now.setHours(0,0,0,0);

        return Math.floor((now - past) / (1000 * 60 * 60 * 24));
    }
    function angleByOrbitDuration(duration){
        return (daysSince(targetDate) / duration) * 360
    }
}

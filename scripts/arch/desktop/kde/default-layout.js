let setupMyPanel = function () {
    let panel = new Panel;

    panel.height = gridUnit * 2;
    panel.alignment = 'center';
    panel.location = 'bottom';

    // Restrict horizontal panel to a maximum size of a 21:9 monitor
    const maximumAspectRatio = 21 / 9;
    if (panel.formFactor === "horizontal") {
        const geo = screenGeometry(panel.screen);
        const maximumWidth = Math.ceil(geo.height * maximumAspectRatio);

        if (geo.width > maximumWidth) {
            panel.minimumLength = maximumWidth;
            panel.maximumLength = maximumWidth;
        }
    }

    let kickoff = panel.addWidget("org.kde.plasma.kickoff");
    kickoff.currentConfigGroup = ["Shortcuts"];
    kickoff.writeConfig("global", "Alt+F1");

    panel.addWidget("org.kde.plasma.pager");

    panel.addWidget("org.kde.plasma.panelspacer");

    let taskbar = panel.addWidget("org.kde.plasma.icontasks");
    taskbar.currentConfigGroup = ["General"];
    taskbar.writeConfig("launchers", []);

    panel.addWidget("org.kde.plasma.panelspacer");

    panel.addWidget("org.kde.plasma.marginsseparator");

    if (["ja", "zh_TW"].indexOf(languageId) != -1) {
        panel.addWidget("org.kde.plasma.kimpanel");
    }

    panel.addWidget("org.kde.plasma.systemtray");
    panel.addWidget("org.kde.plasma.digitalclock");
    panel.addWidget("org.kde.plasma.showdesktop");
}

panels().forEach((panel) => panel.remove())

setupMyPanel()

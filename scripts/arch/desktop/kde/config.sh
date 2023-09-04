#!/usr/bin/env bash

script () {
cat << EOF
    let setupMyPanel = function () {
        let panel = new Panel;

        panel.height = gridUnit * 2;
        panel.alignment = 'center';
        panel.location = 'bottom';

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

    panels().forEach((panel) => panel.remove());

    setupMyPanel();
EOF
}

qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "$(script)"

sleep 3

kwriteconfig5 --file "${HOME}/.config/klaunchrc" --group 'BusyCursorSettings' --key 'Bouncing' 'false'
kwriteconfig5 --file "${HOME}/.config/klaunchrc" --group 'FeedbackStyle' --key 'BusyCursor' 'false'

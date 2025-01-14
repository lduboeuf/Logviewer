import QtQuick 2.9
import Lomiri.Components 1.3

Page {
    id: settingPage

    property alias interval: intervalSlider.value
    property alias filter: filterText.text
    property alias dpFontSize: fontslider.value

    signal applyChanges
    signal cancelChanges

    header: PageHeader {
        title: i18n.tr("Settings")
        flickable: scrollView.flickableItem

        leadingActionBar.actions: Action {
            text: i18n.tr("Cancel")
            iconName: "close"
            onTriggered: {
                settingPage.cancelChanges();
                pageStack.pop();
            }
        }

        trailingActionBar.actions: Action {
            text: i18n.tr("Apply")
            iconName: "ok"
            onTriggered: {
                settingPage.applyChanges();
                pageStack.pop();
            }
        }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent

        Column {
            id: column
            width: scrollView.width

            property int mSpacing: units.gu(1)

            // TODO: directory could be replaced by a system/user service switch?

            ListItem {
                height: filterlabel.height + filterText.height + 2 * column.mSpacing

                Label {
                    id: filterlabel
                    text: i18n.tr("Filter:")

                    anchors {
                        top: parent.top
                        topMargin: column.mSpacing
                        left: parent.left
                        leftMargin: units.gu(1)
                        right: parent.right
                        rightMargin: units.gu(1)
                    }
                }
                TextField {
                    id: filterText
                    width: parent.width

                    anchors {
                        top: filterlabel.bottom
                        left: parent.left
                        leftMargin: units.gu(1)
                        right: parent.right
                        rightMargin: units.gu(1)
                    }
                }
            }

            ListItem {
                height: intervalLabel.height + intervalSlider.height + column.mSpacing

                Label {
                    id:intervalLabel
                    text: i18n.tr("Refresh interval (ms):")

                    anchors {
                        top: parent.top; topMargin: column.mSpacing
                        left: parent.left; leftMargin: units.gu(1)
                        right: parent.right; rightMargin: units.gu(1)
                    }
                }
                Slider {
                    id:intervalSlider
                    minimumValue: 50
                    maximumValue: 5000
                    value: 100
                    live: true
                    width: parent.width

                    anchors {
                        top: intervalLabel.bottom
                        left: parent.left
                        leftMargin: units.gu(1)
                        right: parent.right
                        rightMargin: units.gu(1)
                    }
                    
                    function formatValue(v) {
                        return v.toFixed(0)
                    }
                }
            }

            ListItem {
                height: fontlabel.height + fontslider.height + column.mSpacing

                Label {
                    id: fontlabel
                    text: i18n.tr("Font size:")

                    anchors {
                        top: parent.top; topMargin: column.mSpacing
                        left: parent.left; leftMargin: units.gu(1)
                        right: parent.right; rightMargin: units.gu(1)
                    }
                }
                Slider {
                    id: fontslider
                    minimumValue: 4
                    maximumValue: 24
                    value: 10
                    live: true
                    width: parent.width

                    anchors {
                        top: fontlabel.bottom
                        left: parent.left
                        leftMargin: units.gu(1)
                        right: parent.right
                        rightMargin: units.gu(1)
                    }
                    
                    function formatValue(v) {
                        return v.toFixed(0)
                    }
                }
            }
        }
    }
}

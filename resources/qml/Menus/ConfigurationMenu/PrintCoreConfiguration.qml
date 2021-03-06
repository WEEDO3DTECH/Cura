// Copyright (c) 2018 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.7
import QtQuick.Controls 2.0

import UM 1.5 as UM
import Cura 1.0 as Cura

Item
{
    id: extruderInfo
    property var printCoreConfiguration

    height: information.height

    //Extruder icon.
    Cura.ExtruderIcon
    {
        id: icon
        materialColor: printCoreConfiguration !== null ? printCoreConfiguration.material.color : ""
        anchors.verticalCenter: parent.verticalCenter
        extruderEnabled: printCoreConfiguration !== null && printCoreConfiguration.material.brand !== "" && printCoreConfiguration.hotendID !== ""
    }

    Column
    {
        id: information
        anchors
        {
            left: icon.right
            right: parent.right
            margins: UM.Theme.getSize("default_margin").width
        }

        UM.Label
        {
            text: (printCoreConfiguration !== null && printCoreConfiguration.material.brand) ? printCoreConfiguration.material.brand : " " //Use space so that the height is still correct.
            elide: Text.ElideRight
            color: UM.Theme.getColor("text_inactive")
            width: parent.width
        }
        UM.Label
        {
            text: (printCoreConfiguration !== null && printCoreConfiguration.material.brand) ? printCoreConfiguration.material.name : " " //Use space so that the height is still correct.
            elide: Text.ElideRight
            font: UM.Theme.getFont("medium")
            width: parent.width
        }
        UM.Label
        {
            text: (printCoreConfiguration !== null && printCoreConfiguration.hotendID) ? printCoreConfiguration.hotendID : " " //Use space so that the height is still correct.
            elide: Text.ElideRight
            color: UM.Theme.getColor("text_inactive")
            width: parent.width
        }
    }
}

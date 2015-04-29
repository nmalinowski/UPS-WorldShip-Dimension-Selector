#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=c:\users\nathaniel\desktop\aboutbox.kxf
$AboutBox = GUICreate("About", 334, 239, 509, 471)
$GroupBox1 = GUICtrlCreateGroup("", 8, 8, 305, 185)
$Image1 = GUICtrlCreatePic("C:\Users\Nathaniel\Pictures\WILLLOGO (2).bmp", 16, 24, 105, 97)
$Label1 = GUICtrlCreateLabel("UPS WorldShip Package Selector", 136, 24, 166, 17)
$Label2 = GUICtrlCreateLabel("1.7.0.2", 136, 48, 37, 17)
$Label4 = GUICtrlCreateLabel("UPS WorldShip® is a trademark of United Parcel Service of America, Inc ", 16, 160, 249, 14)
GUICtrlSetFont(-1, 6, 400, 0, "Arial")
$Label3 = GUICtrlCreateLabel("Nathaniel A. Malinowski (C) 2015", 16, 136, 160, 17)
$Label5 = GUICtrlCreateLabel("All rights reserved.", 16, 176, 68, 14)
GUICtrlSetFont(-1, 6, 400, 0, "Arial")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("&OK", 124, 208, 75, 25, 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			GUIDelete ()
			GUISetState()
			ExitLoop
		Case $Button1
			GUIDelete()
			GUISetState()
			ExitLoop
	EndSwitch
WEnd

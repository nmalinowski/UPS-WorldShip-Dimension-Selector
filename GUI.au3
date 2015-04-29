#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Local $UPWSPS = GUICreate("UPS WorldShip Package Selector", 396, 259, 192, 124)
Local $Hotkeys = GUICtrlCreateGroup("Hotkeys", 9, 9, 377, 241)
Local $About = GUICtrlCreateButton("About", 304, 216, 75, 25)
Local $Numpad1 = GUICtrlCreateLabel("Numpad 1: Small Package", 25, 33, 130, 17)
Local $Numpad2 = GUICtrlCreateLabel("Numpad 2: Medium Package", 25, 57, 142, 17)
Local $Numpad3 = GUICtrlCreateLabel("Numpad 3: Large Package", 25, 81, 132, 17)
Local $Numpad4 = GUICtrlCreateLabel("Numpad 4: Extra Large Package", 25, 105, 159, 17)
Local $Numpad5 = GUICtrlCreateLabel("Numpad 5: Extra Small Package", 25, 129, 157, 17)
Local $COPYRIGHT = GUICtrlCreateLabel("Will Enterprises, Inc (C) 2015", 16, 224, 140, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)

Local $nMsg
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $About
			GUISetState(@SW_DISABLE)
			_myAbout($UPWSPS)
			WinActivate($UPWSPS)
			GUISetState(@SW_ENABLE)
	EndSwitch
WEnd

Func _myAbout($iParent = 0)
	Local $AboutBox = GUICreate("About", 334, 239, 509, 471)
	Local $GroupBox1 = GUICtrlCreateGroup("", 8, 8, 305, 185)
	Local $Image1 = GUICtrlCreatePic("C:\Users\Nathaniel\Pictures\WILLLOGO (2).bmp", 16, 24, 105, 97)
	Local $Label1 = GUICtrlCreateLabel("UPS WorldShip Package Selector", 136, 24, 166, 17)
	Local $Label2 = GUICtrlCreateLabel("1.7.0.2", 136, 48, 37, 17)
	Local $Label4 = GUICtrlCreateLabel("UPS WorldShip® is a trademark of United Parcel Service of America, Inc ", 16, 160, 249, 14)
	GUICtrlSetFont(-1, 6, 400, 0, "Arial")
	Local $Label3 = GUICtrlCreateLabel("Nathaniel A. Malinowski (C) 2015", 16, 136, 160, 17)
	Local $Label5 = GUICtrlCreateLabel("All rights reserved.", 16, 176, 68, 14)
	GUICtrlSetFont(-1, 6, 400, 0, "Arial")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Local $Button1 = GUICtrlCreateButton("&OK", 124, 208, 75, 25, 0)
	GUISetState(@SW_SHOW)


	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete()
				GUISetState()
				ExitLoop
			Case $Button1
				GUIDelete()
				GUISetState()
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>_myAbout

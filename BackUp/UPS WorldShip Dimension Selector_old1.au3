#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=upswsds.ico
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=Will Enterprises, Inc (C) 2015
#AutoIt3Wrapper_Res_Description=UPS WorldShip Dimension Selector
#AutoIt3Wrapper_Res_Fileversion=1.7.19.60
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductVersion=1.7
#AutoIt3Wrapper_Res_LegalCopyright=Nathaniel A. Malinowski (C) 2015
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs -------------------------------------------------------------------------------------------

	UPS WorldShip Dimension Selector
	(C) 2015 - Nathaniel A. Malinowski - Le GeeX, LLC - http://www.legeex.com
	System/Network Adminstrator - Will Enterprises, Inc - http://www.willpromo.com


#ce -------------------------------------------------------------------------------------------
; Script Start
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Opt ("TrayIconHide", 1)
;GUI
; Labels for Hotkeys Generic: GUICtrlCreateLabel("Numpad 1: Jerzees Small Package", 25, X, Y, 17)
; X, Y represent the X & Y axis. in this instance I would just leave the Y access set to 180
; to keep the X axis looking evenly spaced just add 25 to the last X axis label.
; For example: 179 + 25 = 204
; so the output would be GUICtrlCreateLabel("Numpad 9: PACKAGE NAME", 25, 204, 180, 17)
Local $UPWSPS = GUICreate("UPS WorldShip Dimension Selector", 396, 259, 192, 124)
Local $Hotkeys = GUICtrlCreateGroup("Hotkeys", 9, 9, 377, 241)
Local $About = GUICtrlCreateButton("About", 304, 216, 75, 25)
Local $Numpad1 = GUICtrlCreateLabel("Numpad 1: Jerzees Small Package", 25, 33, 180, 17)
Local $Numpad2 = GUICtrlCreateLabel("Numpad 2: Jerzees Medium Package", 25, 57, 180, 17)
Local $Numpad3 = GUICtrlCreateLabel("Numpad 3: Jerzees Large Package", 25, 81, 180, 17)
Local $Numpad4 = GUICtrlCreateLabel("Numpad 4: Gildan Small Package", 25, 105, 180, 17)
Local $Numpad5 = GUICtrlCreateLabel("Numpad 5: Gildan Large Package", 25, 129, 180, 17)
Local $Numpad5 = GUICtrlCreateLabel("Numpad 7: Hanes", 25, 154, 157, 17)
Local $Numpad5 = GUICtrlCreateLabel("Numpad 8: Duotec", 25, 179, 157, 17)
Local $COPYRIGHT = GUICtrlCreateLabel("Will Enterprises, Inc (C) 2015", 16, 224, 140, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState()
Global $Hotkey = False, $hWnd
; MUST ADD PROCESSOR IF YOU ADD ANOTHER HOTKEY OR IT WILL NOT FUNCTION!
HotKeySet("{Home}", "_Start") ; Start and stop accepting other hot keys
HotKeySet("{NumPad1}", "_Process") ; Hotkeys to start different processing
HotKeySet("{NumPad2}", "_Process") ;Change {NUMPAD#} to any key described here: https://www.autoitscript.com/autoit3/docs/appendix/SendKeys.htm
HotKeySet("{NumPad3}", "_Process")
HotKeySet("{NumPad4}", "_Process")
HotKeySet("{NumPad5}", "_Process")
HotKeySet("{NumPad7}", "_Process")
HotKeySet("{NumPad8}", "_Process")
HotKeySet("{ESC}", "_Exit") ; Hotkey to end the script
Local $nMsg
While 1
	Sleep(10)
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
;DO NOT EDIT BELOW THIS LINE UNTIL YOU REACH THE HOTKEYS COMMENT
Func _myAbout($iParent = 0)
	Local $AboutBox = GUICreate("About", 334, 239, 509, 471)
	Local $GroupBox1 = GUICtrlCreateGroup("", 8, 8, 305, 185)
	Local $Image1 = GUICtrlCreatePic("logo.bmp", 16, 24, 105, 97)
	Local $Label1 = GUICtrlCreateLabel("UPS WorldShip Dimension Selector", 136, 24, 170, 17)
	Local $Label2 = GUICtrlCreateLabel("1.7.19.59", 136, 48, 55, 17)
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
; Exit the script
Func _Exit()
	ToolTip("")
	Exit
EndFunc   ;==>_Exit
; Start and stop accepting other hot keys
Func _Start()
	$Hotkey = Not $Hotkey
	If $Hotkey Then
		ToolTip("Script started!")
		WinActivate("UPS WorldShip", "Move to first record") ;Bring WorldShip to the front.
		Local $hWnd = WinGetHandle("UPS WorldShip", "")
	Else
		ToolTip("Script paused!")
	EndIf
EndFunc   ;==>_Start

; Process other hotkeys
; HOYTKEYS BEGIN EDITING AGAIN
Func _Process()
	FileCreateShortcut(@AutoItExe, @StartupDir & "\UPS WorldShip Dimension Selector.ink")
	If $Hotkey Then
		Switch @HotKeyPressed
			Case "{NUMPAD1}" ;When NUMPAD1 is pressed, make WorldShip window "Active", Select Preset Package Container, Press "L", Select Weight Box.
				WinActivate("UPS WorldShip", "Move to first record") ;Bring WorldShip to the front.
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]") ;Select Preset Package Container
				Sleep(100)
				Send("s") ;Presses "L" so we can select the Large Jerzees Package.
				Sleep(500)
				Send("{ENTER}") ;Press ENTER.
				Sleep(200)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]") ;Select Weight Box.
				Sleep(200)
				Send("15") ;Enter Small Package Weight in Weight Box.
				ToolTip("Fruit of the Loom - Youth")
				#cs ------------------------------------------------------------------------------------------
					Please use the comments on Case "{NUMPAD1}" section to edit the rest.
				#ce ------------------------------------------------------------------------------------------
			Case "{NUMPAD2}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("m")
				Sleep(500)
				Send("{ENTER}")
				Sleep(200)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				Sleep(200)
				Send("31")
				ToolTip("Fruit of the Loom - Small/Medium")
			Case "{NUMPAD3}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("l")
				Sleep(500)
				Send("{ENTER}")
				Sleep(200)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				Sleep(200)
				Send("35")
				ToolTip("Fruit of the Loom - L-3XL")
			Case "{NUMPAD4}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("1")
				Sleep(500)
				Send("{ENTER}")
				Sleep(200)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				Sleep(200)
				Send("15")
				ToolTip("Gildan Small")
			Case "{NUMPAD5}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("2")
				Sleep(500)
				Send("{ENTER}")
				Sleep(200)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				Sleep(200)
				Send("31")
				ToolTip("Gildan Large.")
			Case "{NUMPAD7}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("h")
				Sleep(500)
				Send("{ENTER}")
				Sleep(200)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				Sleep(200)
				Send("31")
				ToolTip("Hanes")
			Case "{NUMPAD8}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("d")
				Sleep(500)
				Send("{ENTER}")
				Sleep(200)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				Sleep(200)
				Send("15")
				ToolTip("Duotec")
			Case Else
				ToolTip("")
		EndSwitch
	EndIf
EndFunc   ;==>_Process


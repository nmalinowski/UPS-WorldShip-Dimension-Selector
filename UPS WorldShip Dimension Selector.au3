#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=upswsds.ico
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Comment=Will Enterprises, Inc (C) 2015
#AutoIt3Wrapper_Res_Description=UPS WorldShip Dimension Selector
#AutoIt3Wrapper_Res_Fileversion=1.7.19.18
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductVersion=1.7
#AutoIt3Wrapper_Res_LegalCopyright=Nathaniel A. Malinowski (C) 2015
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Add_Constants=n
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
;GUI
Local $UPWSPS = GUICreate("UPS WorldShip Dimension Selector", 396, 259, 192, 124)
Local $Hotkeys = GUICtrlCreateGroup("Hotkeys", 9, 9, 377, 241)
Local $About = GUICtrlCreateButton("About", 304, 216, 75, 25)
Local $Numpad1 = GUICtrlCreateLabel("Numpad 1: Small Package", 25, 33, 130, 17)
Local $Numpad2 = GUICtrlCreateLabel("Numpad 2: Medium Package", 25, 57, 142, 17)
Local $Numpad3 = GUICtrlCreateLabel("Numpad 3: Large Package", 25, 81, 132, 17)
Local $Numpad4 = GUICtrlCreateLabel("Numpad 4: Extra Large Package", 25, 105, 159, 17)
Local $Numpad5 = GUICtrlCreateLabel("Numpad 5: Extra Small Package", 25, 129, 157, 17)
Local $COPYRIGHT = GUICtrlCreateLabel("Will Enterprises, Inc (C) 2015", 16, 224, 140, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState()
Global $Hotkey = False, $hWnd
HotKeySet("{Home}", "_Start") ; Start and stop accepting other hot keys
HotKeySet("{NumPad1}", "_Process") ; Hotkeys to start different processing
HotKeySet("{NumPad2}", "_Process") ;Change {NUMPAD#} to any key described here: https://www.autoitscript.com/autoit3/docs/appendix/SendKeys.htm
HotKeySet("{NumPad3}", "_Process")
HotKeySet("{NumPad4}", "_Process")
HotKeySet("{NumPad5}", "_Process")
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
;DO NOT EDIT BELOW THIS LINE
Func _myAbout($iParent = 0)
	Local $AboutBox = GUICreate("About", 334, 239, 509, 471)
	Local $GroupBox1 = GUICtrlCreateGroup("", 8, 8, 305, 185)
	Local $Image1 = GUICtrlCreatePic("logo.bmp", 16, 24, 105, 97)
	Local $Label1 = GUICtrlCreateLabel("UPS WorldShip Dimension Selector", 136, 24, 170, 17)
	Local $Label2 = GUICtrlCreateLabel("1.7.19.17", 136, 48, 50, 17)
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
				Sleep(100)
				Send("{ENTER}") ;Press ENTER.
				Sleep(100)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]") ;Select Weight Box.
				ToolTip("Small Package Selected.")
				#cs ------------------------------------------------------------------------------------------
					Please use the comments on Case "{NUMPAD1}" section to edit the rest.
				#ce ------------------------------------------------------------------------------------------
			Case "{NUMPAD2}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("m")
				Sleep(100)
				Send("{ENTER}")
				Sleep(100)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				ToolTip("Medium Package Selected.")
			Case "{NUMPAD3}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("l")
				Sleep(100)
				Send("{ENTER}")
				Sleep(100)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				ToolTip("Large Package Selected.")
			Case "{NUMPAD4}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("1")
				Sleep(100)
				Send("{ENTER}")
				Sleep(100)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				ToolTip("Extra Large Package Selected.")
			Case "{NUMPAD5}"
				WinActivate("UPS WorldShip", "Move to first record")
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]")
				Sleep(100)
				Send("2")
				Sleep(100)
				Send("{ENTER}")
				Sleep(100)
				ControlClick($hWnd, "", "[CLASS:Edit; INSTANCE:32]")
				ToolTip("Extra Small Package Selected.")
			Case Else
				ToolTip("")
		EndSwitch
	EndIf
EndFunc   ;==>_Process

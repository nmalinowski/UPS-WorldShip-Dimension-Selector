#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Pictures\isp_icon.ico
#AutoIt3Wrapper_Res_Comment=Will Enterprises, Inc
#AutoIt3Wrapper_Res_Description=UPS WorldShip Dimension Selector
#AutoIt3Wrapper_Res_Fileversion=1.7.0.8
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=2015 (C) Nathaniel A. Malinowski
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
Global $Hotkey = False, $hWnd
HotKeySet("{Home}", "_Start") ; Start and stop accepting other hot keys
HotKeySet("{NumPad1}", "_Process") ; Hotkeys to start different processing
HotKeySet("{NumPad2}", "_Process") ;Change {NUMPAD#} to any key described here: https://www.autoitscript.com/autoit3/docs/appendix/SendKeys.htm
HotKeySet("{NumPad3}", "_Process")
HotKeySet("{NumPad4}", "_Process")
HotKeySet("{NumPad5}", "_Process")
HotKeySet("{ESC}", "_Exit") ; Hotkey to end the script
While 1
	Sleep(10)
WEnd
;DO NOT EDIT BELOW THIS LINE
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
	If $Hotkey Then
		Switch @HotKeyPressed
			Case "{NUMPAD1}" ;When NUMPAD1 is pressed, make WorldShip window "Active", Select Preset Package Container, Press "L", Select Weight Box.
				WinActivate("UPS WorldShip", "Move to first record") ;Bring WorldShip to the front.
				Local $hWnd = WinGetHandle("UPS WorldShip", "")
				ControlClick($hWnd, "", "[CLASS:ComboBox; INSTANCE:20]") ;Select Preset Package Container
				Sleep(100)
				Send("l") ;Presses "L" so we can select the Large Jerzees Package.
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
				Send("l")
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
				Send("l")
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
				Send("l")
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
-- IMPORTS
import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops -- xcomposit support and full screen
import XMonad.Util.EZConfig -- keybindings
import XMonad.Util.Ungrab 
import XMonad.Util.Run
import XMonad.Util.SpawnOnce -- autostart
-- BAR
import XMonad.Util.Loggers
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import DBus
import DBus.Client
import qualified Codec.Binary.UTF8.String as UTF8

-- ACTIONS
import XMonad.Actions.MouseResize
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), nextScreen, prevScreen)
import XMonad.Actions.CopyWindow (kill1) -- kill window with keybinding
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown) -- rotate windows
-- LAYOUTS
import XMonad.Layout.Spiral
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.Renamed
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Simplest
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.WindowNavigation
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile

-- MISC
import XMonad.Hooks.ManageHelpers -- gives the 'isDialog' function
import System.Exit


-- PROMPTS
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.Unicode

import Data.Char (isSpace)
 -- ColorScheme
import Colors.DoomOne


main :: IO()
main = do 
      dbus <- DBus.connectSession
      DBus.RequestName dbus (D.busName_ "org.xmonad.Log")
         [DBus.nameAllowReplacement, DBus.nameREplaceExisting, DBus.nameDoNotQueue]
      xmonad $ ewmhFullscreen $ewmh $ myConfig 
      
myConfig = def
      {modMask      = mod4Mask -- use super key as modifier key
      , layoutHook  = myLayout
      , logHook     = myLogHook
      , manageHook  = myManageHook
      , startupHook = myStartupHook 
      , terminal    = myTerminal
      }
      `additionalKeysP`
      [ ("M-S-s", unGrab *> spawn (myScriptPath ++ "screenshot -s"))
      , ("M-<Print>", unGrab *> spawn (myScriptPath ++ "screenshot -f"))
      , ("M-<Return>", spawn myTerminal)
      , ("M-d", spawn "rofi -show drun -show-icons")
      , ("M-b", spawn "bluetoothctl connect 28:52:E0:11:81:AF")
      , ("M-S-b", spawn "bluetoothctl disconnect")
      , ("M-q", kill ) -- close
      , ("M-S-q", kill1) -- force kill
      , ("M-r", spawn "xmonad --recompile; xmonad --restart") -- seemlessly restart xmonad
      , ("M-S-e", io (exitWith ExitSuccess)) -- exit xmonad 
      , ("<XF86AudioLowerVolume>", spawn "pamixer --decrease 5")
      , ("<XF86AudioRaiseVolume>", spawn "pamixer --allow-boost --increase 5")
      , ("<XF86AudioMute>", spawn "pamixer --toggle-mute")
      ]
      `removeKeysP`
      [ ("M-S-<Return>")         -- old terminal binding 
      , ("M-p")                  -- old dmenu config
      , ("M-S-c")                -- old close config
      ]

-- POLYBAR
myLogHook :: DBus.Client -> PP
myLogHook dbus = def
   { ppOutput = dbusOutput dbus
   , ppCurrent = wrap ("%{F" ++ color01 ++ "} ") " %{F-}"
   , ppVisible = wrap ("%{F" ++ color02 ++ "} ") " %{F-}"
   , ppUrgent = wrap ("%{F" ++ color03 ++ "} ") " %{F-}"
   , ppHidden = wrap ("%{F" ++ color04 ++ "} ") " %{F-}"
   , ppTitle = wrap ("%{F" ++ color05 ++ "} ") " %{F-}"
   }
-- Emit DBus signal on log updates
dbusOutput :: DBus.Client -> String -> IO ()
dbusOutput dbus str = do
      let signal = (DBus.signal objectPath interfaceName memberName) {
            DBus.signalBody = [DBus.toVariant $ UTF8.decodeString str]
         }
      Dbus.emit dbus signal 
   where 
      objectPath = DBus.objectPath_ "/org/xmonad.Log"
      interfaceName = DBus.interfaceName_ "org.xmonad.Log"
      memberName = DBus.memberName_ "Update"

-- STARTUP
myStartupHook = do
   spawn "kilall trayer"
   spawnOnce "picom --experimental-backends" -- compositor for transparent stuffs
   spawnOnce "nitrogen --restore" -- background
   spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x5f5f5f --height 18 &" -- system tray
   spawnOnce "xsetroot -cursor_name left_ptr" -- make cursor not shit
   spawnOnce "xset r rate 300 40" -- make repeat rate higher
   setWMName "LG3D"

-- BAR PRETTY PRINTER
myXmobarPP :: PP
myXmobarPP = def
   { ppSep =  "<fc=" ++ color09 ++ "> <fn=1>|</fn> </fc>"
   , ppTitleSanitize    = xmobarStrip
   , ppCurrent          = xmobarColor color06 "" . wrap ("<box type=Bottom width=2 mb=2 color=" ++ color06 ++ ">") "</box>"
   , ppHidden           = xmobarColor color05 "" . wrap ("<box type=Top width=2 mt=2 color=" ++ color05 ++ ">") "</box>"
   , ppHiddenNoWindows  = xmobarColor color05 ""
   , ppUrgent           = xmobarColor color02 "" . wrap "!" "!" 
   , ppOrder            = \(ws:l:t:ex) -> [ws,l]++ex++[t]
   }

myManageHook :: ManageHook
myManageHook = composeAll
   [ className =? "Gimp" --> doFloat
   , isDialog            --> doFloat
   ]

myLayout = avoidStruts
          $ mouseResize
          $ windowArrange
          $ myDefaultLayout
   where 
         myDefaultLayout = withBorder myBorderWidth       tall
                                                      ||| grid
                                                      ||| spirals


spirals  = renamed [Replace "spirals"]
            $ smartBorders
            $ windowNavigation
            $ subLayout [] (smartBorders Simplest)
            $ spiral (6/7)
tall        = renamed [Replace "tall"]
            $ smartBorders
            $ windowNavigation
            $ subLayout [] (smartBorders Simplest)
            $ ResizableTall 1 (3/100) (1/2) []
grid     = renamed [Replace "grid"]
            $ smartBorders
            $ windowNavigation
            $ subLayout [] (smartBorders Simplest)
            $ Grid (16/10)

-- CUSTOM PROMPTS
-- calculator
calcPrompt c ans = 
   inputPrompt c (trim ans) ?+ \input ->
      liftIO(runProcessWithInput "qalc" [input] "") >>= calcPrompt c
   where
      trim = f . f
         where f = reverse . dropWhile isSpace








-- VARIABLES
myFont :: String
myFont = "xft::SauceCodePro Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

myEmojiFont :: String
myEmojiFont = "xft:JoyPixels:regular:size=9:antialias=true:hinting=true"

myTerminal :: String
myTerminal = "alacritty "

myBrowser :: String
myBrowser = "firefox "

myEditor :: String
myEditor = "nvim "

myBorderWidth :: Dimension
myBorderWidth = 1

myNormColor :: String
myNormColor = "#282c34"

myScriptPath :: String 
myScriptPath = "/home/jodi/Scripts/utils/"


myToggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)

myToggleStrutsKey XConfig{ modMask = m } = (m, xK_z)









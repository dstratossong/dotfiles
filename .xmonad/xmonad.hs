import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed
import XMonad.Util.EZConfig
import XMonad.Util.Run
import Graphics.X11.ExtraTypes.XF86
import System.IO

import qualified Data.Map        as M
import qualified XMonad.StackSet as W

-- workspace
myWorkspaces = ["sh", "web", "code", "aux", "proc", "wall", "comm", "music", "misc"]

-- management
myManageHook = composeAll
    [ className =? "Firefox"         --> doShift "web"
    -- , className =? "google-chrome"   --> doShift "web"
    , className =? "sublime_text"    --> doShift "code"
    , className =? "jetbrains-idea"  --> doShift "code"
    , className =? "lighttable"      --> doShift "code"
    , className =? "atom"            --> doShift "code"
    , className =? "Atom"            --> doShift "code"
    , className =? "slack"           --> doShift "comm"
    , className =? "Slack"           --> doShift "comm"
    , className =? "drracket"        --> doShift "code"
    , className =? "spotify"         --> doShift "music"
    , className =? "Spotify"         --> doShift "music"
    -- , className =? ""                --> doShift "music"
    , isFullscreen                   --> doFullFloat ]

-- layout
defaultLayout =   renamed [Replace "full"] Full
              ||| renamed [Replace "tile"] tiled
  where
    tiled = spacing 2 $ Tall nmaster delta ratio
    nmaster = 1
    ratio = 3/5
    delta = 3/100

-- loghook
myLogHook dest = dynamicLogWithPP $ xmobarPP
    { ppOutput = hPutStrLn dest
    , ppTitle = xmobarColor "green" "" . shorten 50
    }
dimLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 1

-- mouse bindings
mouseBindings :: XConfig Layout -> M.Map (KeyMask, Button) (Window -> X ())
mouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList
  [ ((mod4Mask .|. shiftMask, button1), -- move window
  	 (\w -> focus w >> mouseMoveWindow w 
			               >> windows W.shiftMaster))

  , ((mod4Mask .|. shiftMask, button2), -- raise window
		 (windows . (W.shiftMaster .) . W.focusWindow))

	, ((mod4Mask .|. shiftMask, button3), -- resize window
		 (\w -> focus w >> mouseResizeWindow w 
			               >> windows W.shiftMaster))
	]


-- main
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ desktopConfig
    { borderWidth          = 0
    , normalBorderColor    = "#343838"
    , focusedBorderColor   = "#008C9E"
    , terminal             = "urxvtc"
    , modMask              = mod4Mask
    , workspaces           = myWorkspaces

    -- hooks
    , manageHook           = manageDocks <+> myManageHook
    , layoutHook           = avoidStruts $ smartBorders defaultLayout
    , startupHook          = setWMName "LG3D"
    , logHook              = dimLogHook >> (myLogHook xmproc)
    -- , handleEventHook      = fullscreenEventHook
    , handleEventHook      = mconcat
                           [ docksEventHook
                           , fullscreenEventHook ]

	  -- bindings
		, XMonad.mouseBindings = Main.mouseBindings
    }
    `additionalKeys`

    [ ((0, xK_Print),                     -- print screen
       spawn "scrot --delay 0.2 ~/Dropbox/pictures/screenshots/scrot-%Y-%m-%d-%T.png")

    , ((mod4Mask, xK_Print),              -- capture screen
       spawn "sleep 0.2; scrot --delay 0.2 --select ~/Dropbox/pictures/screenshots/scrot-capture-%Y-%m-%d-%T.png")

    , ((0, xK_Mode_switch),               -- launch
       spawn "dmenu_run")

    , ((mod4Mask .|. shiftMask, xK_w),    -- close
       kill)

    , ((mod4Mask .|. shiftMask, xK_c),    -- disable mod+C
       return ())

    , ((0, xF86XK_MonBrightnessUp),       -- brightness up
       spawn "light -A 5") 

    , ((0, xF86XK_MonBrightnessDown),     -- brightness down
       spawn "light -U 5")

    , ((0, xF86XK_AudioRaiseVolume),      -- volume up
       spawn "amixer -D pulse set Master on  && amixer -D pulse set Master 5%+")

    , ((0, xF86XK_AudioLowerVolume),      -- volume down
       spawn "amixer -D pulse set Master on && amixer -D pulse set Master 5%-")

    , ((0, xF86XK_AudioMute),             -- volume mute
       spawn "amixer -D pulse set Master toggle")

    , ((0, xF86XK_AudioPlay),             -- spotify play/pause
       spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")

    , ((0, xF86XK_AudioStop),             -- spotify stop
       spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop")

    , ((0, xF86XK_AudioNext),             -- spotify next
       spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")

    , ((0, xF86XK_AudioPrev),             -- spotify prev
       spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")

    , ((0, 0x1008FFB2),                   -- mic mute
       spawn "amixer -D pulse set Capture toggle")

    , ((0, xF86XK_ScreenSaver),           -- lock screen
       spawn "/home/melody/.bin/lock")

    , ((mod4Mask .|. shiftMask, xK_l),    -- lock screen
       spawn "/home/melody/.bin/lock")

    ]

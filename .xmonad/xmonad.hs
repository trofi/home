import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops (ewmh)

import System.IO

import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal      = "xterm"

myBorderWidth   = 1

myModMask       = mod1Mask

myWorkspaces    = ["[1]pdf","[2]irc","[3]im","[4]","[5]","[6]web","[7]mail","[8]net","[9]music"]

myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff0000"

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- launch a terminal
    [ ((controlMask ,          xK_grave ), spawn $ XMonad.terminal conf)
    , ((mod4Mask    ,          xK_grave ), spawn "xterm -e alsamixer" )
    -- , ((mod4Mask    ,          xK_grave ), spawn "pavucontrol" )

    -- launch dmenu
    , ((mod4Mask,               xK_p     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
    , ((mod4Mask,               xK_b     ), sendMessage ToggleStruts)

    -- my proggies
    , ((modMask .|. controlMask, xK_b     ), spawn "firefox")
    , ((modMask .|. controlMask, xK_e     ), spawn "emacs")
    , ((modMask .|. controlMask, xK_i     ), spawn "pidgin")
    , ((modMask .|. controlMask, xK_l     ), spawn "liferea")
    , ((modMask .|. controlMask, xK_t     ), spawn "tkabber")
    , ((modMask .|. controlMask, xK_m     ), spawn "claws-mail")
    , ((modMask .|. controlMask, xK_n     ), spawn "zim Notes")
    , ((modMask .|. controlMask, xK_s     ), spawn "skypetab-ng")

    -- xmms2d
    , ((mod4Mask               , xK_Home     ), spawn "xmms2 prev")
    , ((mod4Mask               , xK_End      ), spawn "xmms2 next")
    , ((mod4Mask               , xK_Insert   ), spawn "xmms2 play")
    , ((mod4Mask               , xK_Delete   ), spawn "xmms2 pause")
    , ((mod4Mask               , xK_Prior    ), spawn "xmms2 seek +30")
    , ((mod4Mask               , xK_Next     ), spawn "xmms2 seek -30")
    , ((mod4Mask               , xK_Up       ), spawn "xmms2 seek +20")
    , ((mod4Mask               , xK_Down     ), spawn "xmms2 seek -30")
    , ((mod4Mask               , xK_Right    ), spawn "xmms2 seek +10")
    , ((mod4Mask               , xK_Left     ), spawn "xmms2 seek -10")
    -- xmms2d fun stuff
    , ((mod4Mask               , xK_equal       ), spawn "xmms2 server config vocoder.speed 100")
    , ((mod4Mask               , xK_KP_Add      ), spawn "xmms2 server config vocoder.speed $((`xmms2 server config vocoder.speed | cut -d' ' -f3` + 10))")
    , ((mod4Mask               , xK_KP_Subtract ), spawn "xmms2 server config vocoder.speed $((`xmms2 server config vocoder.speed | cut -d' ' -f3` - 10))")

    -- misc
    , ((mod4Mask                 , xK_F8     ), spawn "~/.rc.d/x11/xmonad/mousekbd")
    , ((mod4Mask                 , xK_F9     ), spawn "xrandr              --output VGA1 --auto --primary; ~/.rc.d/x11/xmonad/wallpaper")
    , ((mod4Mask .|. controlMask , xK_F9     ), spawn "xrandr -s 1280x1024 --output VGA1 --auto --primary; ~/.rc.d/x11/xmonad/wallpaper")
    , ((mod4Mask                 , xK_F10    ), spawn "~/bin/s2ram.sh")
    , ((mod4Mask                 , xK_F11    ), spawn "xrdb ~/.Xdefaults")
    , ((mod4Mask                 , xK_F12    ), spawn "xrandr              --output LVDS1 --auto --primary; ~/.rc.d/x11/xmonad/wallpaper")
    , ((mod4Mask .|. controlMask , xK_F12    ), spawn "xrandr -s 1280x800  --output LVDS1 --auto --primary; ~/.rc.d/x11/xmonad/wallpaper")

    , ((mod3Mask                 , xK_e       ), spawn "set_kb_map 0") -- en_US
    , ((mod3Mask                 , xK_r       ), spawn "set_kb_map 1") -- ru
    , ((mod3Mask                 , xK_s       ), spawn "set_kb_map 2") -- se
    , ((mod3Mask                 , xK_n       ), spawn "set_kb_map 3") -- no
    , ((mod3Mask                 , xK_f       ), spawn "set_kb_map 4") -- fi
    , ((mod3Mask                 , xK_f       ), spawn "set_kb_map 5") -- de

    , ((0                        , xK_Scroll_Lock), spawn "xset dpms force standby")
    , ((0                        , xK_Print),       spawn "~/bin/screenshot.sh")

    -- launch gmrun
    , ((mod4Mask .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window 
    , ((mod4Mask .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((mod4Mask,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((mod4Mask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((mod4Mask,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((mod4Mask,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((mod4Mask,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((mod4Mask,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((mod4Mask,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((mod4Mask,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((mod4Mask .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((mod4Mask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((mod4Mask,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((mod4Mask,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((mod4Mask,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((mod4Mask              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((mod4Mask              , xK_period), sendMessage (IncMasterN (-1)))

    -- toggle the status bar gap
    -- TODO, update this binding with avoidStruts , ((modMask              , xK_b     ),

    -- Quit xmonad
    , ((mod4Mask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((mod4Mask             , xK_q     ),
          broadcastMessage ReleaseResources >> restart "xmonad" True)
    ]
    ++

    --
    -- control-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m , k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_F1 .. xK_F9]
        , (f, m) <- [(W.greedyView, controlMask), (W.shift, shiftMask .|. modMask)]]
{-
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
-}

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
    -- Mouse scroll wheel to raise/lower windows
    , ((modMask, button5), (\w -> windows W.swapDown))
    , ((modMask, button4), (\w -> windows W.swapUp))
    ]

myLayout = smartBorders $ avoidStruts $ (Full ||| tiled ||| Mirror tiled)
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 4/5
     delta   = 3/100

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "GQview"         --> doFloat
    , className =? "Wine"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myStartupHook = return ()

------------------------------------------------------------------------
xmobarCmdT = "                                            xmobar -o -B '#122c80' -F '#adbadd' -f 'xft:Terminus-12' -t '%StdinReader%'"
xmobarCmdB = "~/bin/player-status.sh | xmobar -b -B '#122c60' -F '#adbadd' -f 'xft:Terminus-10' -t '%StdinReader% }{ %battery% | %cpu% | %memory% ||| %wlan0% ||| <fc=cyan>%date%</fc>'"
-- xmobarCmdB = "~/bin/player-status.sh | xmobar -b -B '#122c60' -F '#adbadd' -f 'xft:Terminus-10' -t '%StdinReader% }{ %cpu% | %memory% ||| %wlan0% ||| <fc=cyan>%date%</fc>'"
main = do dinT <- spawnPipe xmobarCmdT
          dinB <- spawnPipe xmobarCmdB
          xmonad $ ewmh $ defaultConfig {
      -- simple stuff
      terminal           = myTerminal,
      focusFollowsMouse  = myFocusFollowsMouse,
      borderWidth        = myBorderWidth,
      modMask            = myModMask,
      workspaces         = myWorkspaces,
      normalBorderColor  = myNormalBorderColor,
      focusedBorderColor = myFocusedBorderColor,

      -- key bindings
      keys               = myKeys,
      mouseBindings      = myMouseBindings,

      -- hooks, layouts
      layoutHook         = myLayout,
      manageHook         = myManageHook,
      logHook            = dynamicLogWithPP $ {- dzenPP -} xmobarPP { ppOutput = hPutStrLn dinT },

      startupHook        = myStartupHook
}

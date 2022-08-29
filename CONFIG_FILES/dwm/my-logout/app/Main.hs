{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.GI.Base
import qualified GI.Gtk as Gtk
import System.Directory
import System.Process
import System.Posix.User

main :: IO ()
main = do 
  Gtk.init Nothing 

  win <- Gtk.windowNew Gtk.WindowTypeToplevel
  Gtk.setContainerBorderWidth win 10
  Gtk.setWindowTitle win "GoodBye!"
  Gtk.setWindowResizable win False
  Gtk.setWindowDefaultWidth win 750
  Gtk.setWindowDefaultHeight win 225
  Gtk.setWindowWindowPosition win Gtk.WindowPositionCenter
  Gtk.windowSetDecorated win False

  home <- getHomeDirectory
  user <- getEffectiveUserName

  logoutImage <- Gtk.imageNewFromFile $ home ++ "/.config/dwm/my-logout/img/logout.png"
  shutdownImage <- Gtk.imageNewFromFile $ home ++ "/.config/dwm/my-logout/img/shutdown.png"
  rebootImage <- Gtk.imageNewFromFile $ home ++ "/.config/dwm/my-logout/img/reboot.png"
  lockImage <- Gtk.imageNewFromFile $ home ++ "/.config/dwm/my-logout/img/lock.png"
  cancelImage <- Gtk.imageNewFromFile $ home ++ "/.config/dwm/my-logout/img/cancel.png"

  logoutLabel <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup logoutLabel "<b>Logout</b>"


  shutdownLabel <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup shutdownLabel "<b>Shutdown</b>"


  rebootLabel <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup rebootLabel "<b>Reboot</b>"

  lockLabel <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup lockLabel "<b>Screen Lock</b>"

  cancelLabel <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup cancelLabel "<b>Cancel</b>"

  logoutButton <- Gtk.buttonNew 
  Gtk.buttonSetRelief logoutButton Gtk.ReliefStyleNone
  Gtk.buttonSetImage logoutButton $ Just logoutImage
  Gtk.widgetSetHexpand logoutButton False
  on logoutButton #clicked $ do
    putStrLn "user choose cancel"
    callCommand $ "pkill -u" ++ user
    -- Gtk.widgetDestroy win


  shutdownButton <- Gtk.buttonNew 
  Gtk.buttonSetRelief shutdownButton Gtk.ReliefStyleNone
  Gtk.buttonSetImage shutdownButton $ Just shutdownImage
  Gtk.widgetSetHexpand shutdownButton False
  on shutdownButton #clicked $ do
    putStrLn "user choose : Shutdown"
    callCommand "shutdown now"
    -- Gtk.widgetDestroy win

  rebootButton <- Gtk.buttonNew 
  Gtk.buttonSetRelief rebootButton Gtk.ReliefStyleNone
  Gtk.buttonSetImage rebootButton $ Just rebootImage
  Gtk.widgetSetHexpand rebootButton False
  on rebootButton #clicked $ do
    putStrLn "user choose : Reboot"
    callCommand "reboot"
    -- Gtk.widgetDestroy win


  lockButton <- Gtk.buttonNew 
  Gtk.buttonSetRelief lockButton Gtk.ReliefStyleNone
  Gtk.buttonSetImage lockButton $ Just lockImage
  Gtk.widgetSetHexpand lockButton False
  on lockButton #clicked $ do
    putStrLn "user choose Lock"
    callCommand "blurlock"

  cancelButton <- Gtk.buttonNew 
  Gtk.buttonSetRelief cancelButton Gtk.ReliefStyleNone
  Gtk.buttonSetImage cancelButton $ Just cancelImage
  Gtk.widgetSetHexpand cancelButton False
  on cancelButton #clicked $ do
    putStrLn "user choose cancel"
    Gtk.widgetDestroy win

  grid <- Gtk.gridNew
  Gtk.gridSetColumnSpacing grid 10
  Gtk.gridSetRowSpacing grid 10
  Gtk.gridSetColumnHomogeneous grid True

  #attach grid logoutButton 0 0 1 1
  #attach grid logoutLabel 0 1 1 1

  #attach grid shutdownButton 1 0 1 1
  #attach grid shutdownLabel 1 1 1 1

  #attach grid rebootButton 2 0 1 1
  #attach grid rebootLabel 2 1 1 1

  #attach grid lockButton 3 0 1 1
  #attach grid lockLabel 3 1 1 1

  #attach grid cancelButton 4 0 1 1
  #attach grid cancelLabel 4 1 1 1

  #add win grid
  Gtk.onWidgetDestroy win Gtk.mainQuit
  #showAll win
  Gtk.main

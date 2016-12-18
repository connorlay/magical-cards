port module Electron.Ports exposing (..)

type alias FilePath = String
type alias Content = String

port writeFile : (FilePath, Content) -> Cmd msg

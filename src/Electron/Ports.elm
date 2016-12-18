port module Ports exposing (..)

type alias Path = String
type alias Content = String

port writeFile : Path -> Content -> Cmd msg

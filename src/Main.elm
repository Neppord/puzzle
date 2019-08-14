module Main exposing (main)

import Browser exposing (element)
import Html exposing (text)


main =
    element config


config =
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


init () =
    ( (), Cmd.none )


view _ =
    text "Hello World"


update _ model =
    ( model, Cmd.none )


subscriptions _ =
    Sub.none

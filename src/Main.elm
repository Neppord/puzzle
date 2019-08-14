module Main exposing (main)

import Browser exposing (element)
import Color exposing (red)
import Svg.Attributes exposing (id)
import TypedSvg exposing (circle, clipPath, defs, rect, svg, use)
import TypedSvg.Attributes exposing (cx, cy, fill, height, r, width, x, xlinkHref, y)
import TypedSvg.Types exposing (ClipPath(..), Fill(..), num, px)


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
    svg
        [ width <| num 200
        , height <| num 200
        ]
        [ defs
            []
            [ puzzleImage
            , clipPath [ id "piece-0-0" ]
                [ rect [ width <| px 100, height <| px 100 ] []
                ]
            ]
        , use
            [ x <| px 0
            , y <| px 0
            , xlinkHref <| "#puzzle-image"
            , TypedSvg.Attributes.clipPath <| ClipPathFunc "url(#piece-0-0)"
            ]
            []
        ]


puzzleImage =
    circle
        [ id "puzzle-image"
        , cx <| px 100
        , cy <| px 100
        , r <| px 100
        , fill <| Fill red
        ]
        []


update _ model =
    ( model, Cmd.none )


subscriptions _ =
    Sub.none

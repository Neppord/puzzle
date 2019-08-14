module Main exposing (main)

import Browser exposing (element)
import Color exposing (black, red)
import Svg.Attributes exposing (id)
import TypedSvg exposing (circle, clipPath, defs, g, rect, svg, use)
import TypedSvg.Attributes exposing (cx, cy, fill, height, r, stroke, strokeWidth, width, x, xlinkHref, y)
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
        [ width <| num 800
        , height <| num 600
        ]
        [ defs
            []
            [ puzzleImage
            , pieceClipPath 0 0
            , pieceClipPath 1 0
            , pieceClipPath 0 1
            , pieceClipPath 1 1
            ]
        , piece 0 0
        , piece 1 0
        , piece 0 1
        , piece 1 1
        ]


piece x y =
    g []
        [ use
            [ TypedSvg.Attributes.x <| px <| toFloat x
            , TypedSvg.Attributes.y <| px <| toFloat y
            , xlinkHref <| "#puzzle-image"
            , TypedSvg.Attributes.clipPath <| clipPathRef x y
            ]
            []
        , use
            [ TypedSvg.Attributes.x <| px <| toFloat x
            , TypedSvg.Attributes.y <| px <| toFloat y
            , xlinkHref <| "#" ++ pieceOutlineId x y
            , fill FillNone
            , stroke <| black
            , strokeWidth <| px 3
            ]
            []
        ]


clipPathRef x y =
    ClipPathFunc <| "url(#" ++ pieceClipId x y ++ ")"


pieceClipPath x y =
    clipPath [ id <| pieceClipId x y ]
        [ rect
            [ id <| pieceOutlineId x y
            , width <| px 100
            , height <| px 100
            , TypedSvg.Attributes.x <| px <| toFloat <| x * 100
            , TypedSvg.Attributes.y <| px <| toFloat <| y * 100
            ]
            []
        ]


pieceClipId x y =
    "piece-" ++ String.fromInt x ++ "-" ++ String.fromInt y ++ "-clip"


pieceOutlineId x y =
    "piece-" ++ String.fromInt x ++ "-" ++ String.fromInt y ++ "-outline"


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

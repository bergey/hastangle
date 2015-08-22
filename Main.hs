{-# LANGUAGE NoMonomorphismRestriction #-}

module Main where

import Hastangle
import Paradox
import Diagrams.Prelude hiding (Point, fromVertices)
import Diagrams.Backend.SVG
import Diagrams.Backend.SVG.CmdLine

import qualified Examples.Heart   as H
import qualified Examples.Square  as S
import qualified Examples.Complex as C

--main = defaultMain $ toDiagram $ ((iterate (paradox 0.1) (fromShape $ (regPoly 12 2))) !! 3000)
--main = defaultMain $ colorize [black, green] $ figure $ (iterations (paradox 0.1) (fromShape $ regPoly 12 4)) !! 100
--main = defaultMain $ colorize [red, green, blue] $ figure $ fromShape $ square 1


main = defaultMain $ colorizeSymmetric [black, red] $ (iterations (paradox 0.08) (C.tangle)) !! 100

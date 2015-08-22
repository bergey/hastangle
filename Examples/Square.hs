{-# LANGUAGE NoMonomorphismRestriction #-}

module Examples.Square where

import Hastangle
import Paradox
import Diagrams.Prelude hiding (Point, fromVertices)
import Diagrams.Backend.SVG
import Diagrams.Backend.SVG.CmdLine
import Utils


square1 = [((1,1), (2,1)),((2,1), (2,2)),((2,2), (1,2)),((1,2), (1,1))]
square2 = [((2,1), (3,1)),((3,1), (3,2)),((3,2), (2,2)),((2,2), (2,1))]
square3 = [((1,2), (2,2)),((2,2), (2,3)),((2,3), (1,3)),((1,3), (1,2))]
square4 = [((2,2), (3,2)),((3,2), (3,3)),((3,3), (2,3)),((2,3), (2,2))]

fig = square1 ++ square2 ++ square3 ++ square4

tangle = Hastangle ini ini focs
    where ini  = map (\(a, b) -> (p2 a, p2 b)) fig
          focs = groupIn 4 ini

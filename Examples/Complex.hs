{-# LANGUAGE NoMonomorphismRestriction #-}

module Examples.Complex where

import Hastangle
import Paradox
import Diagrams.Prelude hiding (Point, fromVertices)
import Diagrams.Backend.SVG
import Diagrams.Backend.SVG.CmdLine
import Utils

-- 10 : 20
triangle1 = [((3,3),(0,1.5)),((0, 1.5),(3,0)), ((3,0),(3,3))]
triangle2 = [((3,3),(6, 1.5)),((6,1.5),(3,0)), ((3,0),(3,3))]
triangle3 = [((3,3),(0,4.5)),((0,4.5),(0,1.5)),((0,1.5),(3,3))]
triangle4 = [((3,3),(6,4.5)),((6,4.5),(6,1.5)),((6,1.5),(3,3))]
triangle5 = [((3,3),(3,6)),((3,6),(0,4.5)),((0,4.5),(3,3))]
triangle6 = [((3,3),(3,6)),((3,6),(6,4.5)),((6,4.5),(3,3))]

fig = triangle1 ++ triangle2 ++ triangle3 ++ triangle4 ++ triangle5 ++ triangle6

tangle = Hastangle ini ini focs
    where ini  = map (\(a, b) -> (p2 a, p2 b)) fig
          focs = groupIn 3 ini

{-# LANGUAGE NoMonomorphismRestriction #-}

module Examples.Heart where

import Hastangle
import Paradox
import Diagrams.Prelude hiding (Point, fromVertices)
import Diagrams.Backend.SVG
import Diagrams.Backend.SVG.CmdLine

import Utils

fig = [((8,10),(5,4)), ((5,4),(6,2)), ((6,2),(8,4)), ((8,4),(8,10)), ((8,10),(11,4)), ((11,4),(10,2)), ((10,2),(8,4)), ((8,4),(8,10))]
tangle = Hastangle ini ini focs
    where ini  = map (\(a, b) -> (p2 a, p2 b)) fig
          focs = groupIn 4 ini

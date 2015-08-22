{-# LANGUAGE NoMonomorphismRestriction #-}

module Hastangle where

import Diagrams.Prelude hiding (Point)
import Diagrams.Backend.SVG
import Data.Typeable
import Utils (every)

type Point  = P2 Double
type Vector = V2 Double
type Shape  = Located (Trail V2 Double)
type Figure = [(Point, Point)]

type Morphism a = (a -> a)
type Hasphism = Morphism Hastangle

-- definition of a Hastangle
data Hastangle = Hastangle
               {
                 frame  :: Figure
               , figure :: Figure
               , focus  :: [Figure]
               }


fromShape :: Shape -> Hastangle
fromShape shape = Hastangle ps ps [ps]
    where (v:vs) = vertices shape
          ps     = zip (v:vs) (vs ++ [v])

fromFigure :: Figure -> [Figure] -> Hastangle
fromFigure fig focs = Hastangle fig fig focs

fromVertices :: [Point] -> Hastangle
fromVertices (p:ps) = Hastangle vert vert [vert]
    where vert = zip (p:ps) (ps ++ [p])

toVertices :: Hastangle -> [Point]
toVertices (Hastangle frame _ _) = map fst frame

vertices :: Shape -> [Point]
vertices = trailVertices' 0.05



draw :: Figure -> Diagram B
draw fig = mconcat $ map (\(p1, p2) -> p1 ~~ p2) fig

drawFrame :: Hastangle -> Diagram B
drawFrame (Hastangle frame _ _) = draw frame

drawFigure :: Hastangle -> Diagram B
drawFigure (Hastangle _ fig _) = draw fig

drawFocus :: Hastangle -> Diagram B
drawFocus (Hastangle _ _ focs) = mconcat $ map draw focs



colorize :: [Colour Double] -> Figure -> Diagram B
colorize cs fig  = mconcat $ map (\(c, (p1, p2)) -> lc c (p1 ~~ p2)) cfig
    where n      = length fig
          colors = cycle $ take n (cycle cs)
          cfig   = zip colors fig

colorizeSymmetric :: [Colour Double] -> Hastangle -> Diagram B
colorizeSymmetric cs (Hastangle _ fig focs) = colorize (concat $ map (replicate (length focs)) cs) fig



morphisms  :: Hasphism -> Hastangle -> [Hastangle]
morphisms = iterate

iterations :: Hasphism -> Hastangle -> [Hastangle]
iterations f tangle@(Hastangle frame fig _) = every (length frame) (morphisms f tangle)

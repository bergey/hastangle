{-# LANGUAGE NoMonomorphismRestriction #-}

module Paradox where

import Diagrams.Prelude hiding (Point)
import Hastangle
import Utils (every)

paradox1 :: Double -> (Figure, Figure) -> ((Point, Point), Figure)
paradox1 sc (fig, foc) = (new, foc')
    where
          fst' = (fst. head) foc
          vec  = scale sc (snd (foc !! 1) .-. fst (foc !! 1))
          snd' = translate vec ((snd. head) foc)
          new  = ((snd . last) foc, snd')
          foc' = tail foc ++ [new]

-- paradox function from Zentangle
paradox :: Double -> Hastangle -> Hastangle
paradox sc (Hastangle frame fig focs) = Hastangle frame fig' focs'
    where
          a     = map (paradox1 sc) (zip (repeat fig) focs)
          focs' = map snd a
          fig' = fig ++ map fst a

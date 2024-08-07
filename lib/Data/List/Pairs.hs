{-# OPTIONS_GHC -Wno-x-partial -Wno-unrecognised-warning-flags #-}

module Data.List.Pairs where

import Data.Bifoldable
import Data.List.Unique

-- listToPairs
-- also known as pairs

-- numeric-prelude Number.Positional sliceVertPair
-- hgeometry Data.Geometry.Arrangement.Internal allPairs
-- topograph Topograph pairs
toPairs ∷ [a] → [(a,a)]
toPairs a = zip a $ tail a

-- pairsToList
fromPairs ∷ (Ord a) ⇒ [(a, a)] → [a]
fromPairs = uniq . concatMap biList

module Data.Map.Indexed where

import           Data.Map as M

-- Used to be called listToMap
-- Unique?
fromList ∷ Integral i ⇒ [a] → Map i a
fromList = M.fromList . zip [0 ..]

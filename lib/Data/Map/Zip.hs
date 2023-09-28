module Data.Map.Zip where

import Data.Map   (Map, fromList)
import Prelude    qualified as P
import StdPrelude

-- unique?
zip ∷ P.Ord a ⇒ [a] → [b] → Map a b
zip as bs = fromList $ P.zip as bs

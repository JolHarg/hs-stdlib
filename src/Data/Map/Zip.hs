{-# LANGUAGE UnicodeSyntax #-}
module Data.Map.Zip where

import StdPrelude
import qualified Prelude as P
import Data.Map (Map, fromList)

-- unique?
zip ∷ P.Ord a ⇒ [a] → [b] → Map a b
zip as bs = fromList $ P.zip as bs

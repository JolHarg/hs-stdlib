module Data.List.Unique where

import Data.Set qualified as S

uniq ∷ Ord a ⇒ [a] → [a]
uniq = S.toList . S.fromList

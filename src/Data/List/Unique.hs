module Data.List.Unique where

import qualified Data.Set as S

uniq ∷ Ord a ⇒ [a] → [a]
uniq = S.toList . S.fromList

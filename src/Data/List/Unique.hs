{-# LANGUAGE UnicodeSyntax #-}
uniq ∷ Ord a ⇒ [a] → [a]
uniq = S.toList . S.fromList

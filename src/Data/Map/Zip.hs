-- unique?
zip ∷ P.Ord a ⇒ [a] → [b] → Map a b
zip as bs = fromList $ P.zip as bs

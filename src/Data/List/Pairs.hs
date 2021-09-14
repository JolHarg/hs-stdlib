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
module Data.List.Zip where

-- extra Data.Tuple.Extra Extra dupe
-- utility-ht Data.Tuple.HT double
-- relude Relude.Extra.Tuple dup
dup ∷ a → (a, a)
dup x = (x, x)

-- like Graphics.Gnuplot.Plot.ThreeDimensional.functionToGraph
-- relude Relude.Extra.Tuple fmapToSnd
zipFn ∷ (a → b) → [a] → [(a, b)]
zipFn f = fmap (\x -> (x, f x))
-- zipFn f = fmap (fmap f . dup)
-- zipFn f = fmap $ fmap fmap fmap f dup

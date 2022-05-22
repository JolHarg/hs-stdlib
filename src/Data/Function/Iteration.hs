
module Data.Function.Iteration where

-- similar to utility-ht's nest, or applyN, nTimes, etc
iter ∷ Int → (a → a) → a → a
iter 0 _ x = x
iter 1 f x = f x
iter i f x = iter (i - 1) f x

-- utility-ht's Control.Monad.HT's nest
iterA ∷ Applicative f ⇒ Int → (a → f a) → a → f a
iterA 0 _ x = pure x
iterA 1 f x = f x
iterA i f x = iterA (i - 1) f x

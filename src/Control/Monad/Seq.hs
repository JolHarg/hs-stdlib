{-# LANGUAGE UnicodeSyntax #-}
module Lib.Seq where

-- liquid-fixpoint Language.Fixpoint.Misc (=>>)
(>>>=) ∷ Monad m ⇒ m b → (b → m a) → m b
a >>>= f = a >>= (\b -> f b >> pure b)

-- unique?
(>>>) :: Monad m => m b -> m a -> m b
a >>> f = a >> (f >> a)

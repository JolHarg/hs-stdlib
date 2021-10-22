{-# LANGUAGE UnicodeSyntax #-}
module Data.Bifunctor.Both where

import Data.Bifunctor

-- relude Relude.Extra.Bifunctor
bimapBoth ∷ Bifunctor f ⇒ (a → b) -> f a a -> f b b
bimapBoth f = bimap f f

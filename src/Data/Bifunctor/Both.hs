{-# LANGUAGE UnicodeSyntax #-}
-- relude Relude.Extra.Bifunctor
bimapBoth ∷ Bifunctor f ⇒ (a → b) -> f a a -> f b b
bimapBoth f = bimap f f

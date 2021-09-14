{-# LANGUAGE UnicodeSyntax #-}
module Language.Haskell.TH.Extra where

import           Language.Haskell.TH
import           Language.Haskell.TH.Syntax

infoToExp ∷ Info → ExpQ
infoToExp (VarI _ t _)     = stringE . show $ t
infoToExp (ClassOpI _ t _) = stringE . show $ t
infoToExp _                = error "Unsupported"

infoToType ∷ Info → Type
infoToType (VarI _ k _) = k
infoToType _            = error "Unsupported"

forallToPlain ∷ Type → Type
forallToPlain (ForallT _ _ t) = t
forallToPlain _               = error "Unsupported"

foldQ ∷ [Q [a]] → Q [a]
foldQ = fmap concat . sequenceQ

-- extra Control.Monad.Extra Extra, intro Intro concatMapM
-- protolude Protolude.Monad, language-c Language.C.Analysis.TravMonad concatMapM
-- ghc MonadUtils, ghc-lib-parser GHC.Utils.Monad concatMapM
concatMapQ ∷ (a → Q [b]) → [a] → Q [b]
concatMapQ x = foldQ . fmap x
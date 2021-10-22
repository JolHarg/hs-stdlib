{-# LANGUAGE UnicodeSyntax #-}
module System.Environment.Lifted where

import StdPrelude
import Control.Monad.IO.Class
import Data.String
import qualified System.Environment as P

getEnv ∷ (IsString s, Show s, MonadIO m) ⇒ s → m s
getEnv s = io $ fromString <$> P.getEnv (toString s)

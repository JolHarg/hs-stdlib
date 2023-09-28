module System.Environment.Lifted where

import Control.Monad.IO.Class
import Data.String
import StdPrelude
import System.Environment     qualified as P

getEnv ∷ (IsString s, Show s, MonadIO m) ⇒ s → m s
getEnv s = io $ fromString <$> P.getEnv (toString s)

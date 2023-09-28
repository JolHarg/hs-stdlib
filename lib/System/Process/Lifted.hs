module System.Process.Lifted where

import Control.Monad.IO.Class
import StdPrelude
import System.Process         qualified as P

spawnCommand ∷ (MonadIO m, Show s) ⇒ s → m P.ProcessHandle
spawnCommand = io . P.spawnCommand . toString

module System.Process.Lifted where

import           Control.Monad.IO.Class
import           Data.String
import           StdPrelude
import qualified System.Process         as P

spawnCommand ∷ (MonadIO m, IsString s, Show s) ⇒ s → m P.ProcessHandle
spawnCommand = io . P.spawnCommand . toString

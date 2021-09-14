

import qualified System.Process         as P

spawnCommand ∷ (MonadIO m, IsString s, Show s) ⇒ s → m P.ProcessHandle
spawnCommand = io . P.spawnCommand . toString

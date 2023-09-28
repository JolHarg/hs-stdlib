module Data.IORef.Lifted where

import Control.Monad.IO.Class
import Data.IORef             qualified as P
import StdPrelude

-- unliftio UnliftIO.IORef
-- relude Relude.Lifted.IORef
-- stack Stack.Prelude
-- universum Universum.Lifted.IORef

newIORef ∷ MonadIO m ⇒ a → m (P.IORef a)
newIORef = io . P.newIORef

readIORef ∷ MonadIO m ⇒ P.IORef a → m a
readIORef = io . P.readIORef

writeIORef ∷ MonadIO m ⇒ P.IORef a → a → m ()
writeIORef i a = io $ P.writeIORef i a

modifyIORef ∷ MonadIO m ⇒ P.IORef a → (a → a) → m ()
modifyIORef i f = io $ P.modifyIORef i f

{-# LANGUAGE UnicodeSyntax #-}
import qualified System.Environment as P

getEnv ∷ (IsString s, Show s, MonadIO m) ⇒ s → m s
getEnv s = io $ fromString <$> P.getEnv (toString s)

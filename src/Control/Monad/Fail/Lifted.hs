{-# LANGUAGE UnicodeSyntax #-}

fail ∷ (MonadFail m, MonadIO m, IsString s, Show s) ⇒ s → m a
fail = io . P.fail . toString

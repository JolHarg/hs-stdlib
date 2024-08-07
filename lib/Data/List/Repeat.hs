{-# OPTIONS_GHC -Wno-x-partial -Wno-unrecognised-warning-flags #-}

module Data.List.Repeat (takeUntilRepeat) where

takeUntilRepeat ∷ Eq a ⇒ [a] → [a]
takeUntilRepeat xs = ((++) <$> fmap fst <*> pure . snd . last) .
    takeWhile (uncurry (/=)) $
    zip xs (tail xs)

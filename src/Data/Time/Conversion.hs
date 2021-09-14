{-# LANGUAGE UnicodeSyntax #-}
module Data.Time.Conversion (daysToSeconds, yearsToSeconds) where

import           Data.Time.Constants (secondsInDay, secondsInYear)

daysToSeconds, yearsToSeconds ∷ Double → Integer
daysToSeconds d = round (d * fromInteger secondsInDay)
yearsToSeconds d = round (d * fromInteger secondsInYear)

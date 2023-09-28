module Data.Time.Conversion (daysToSeconds, yearsToSeconds) where

import Data.Time.Constants (secondsInYear)
import Number.SI.Unit      (secondsPerDay)

daysToSeconds, yearsToSeconds ∷ Double → Integer
daysToSeconds d = round (d * secondsPerDay)
yearsToSeconds d = round (d * fromInteger secondsInYear)

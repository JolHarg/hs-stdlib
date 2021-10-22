{-# LANGUAGE UnicodeSyntax #-}
module Data.Time.Utils where

import           Control.Applicative      ((<|>))
import           Data.Functor
import           Data.Maybe               (fromJust)
import           Data.Time                (UTCTime, ZonedTime, Day, toGregorian,
                                           utctDay, zonedTimeToUTC, diffDays, getCurrentTime)
import           Data.Time.Format.ISO8601 (iso8601ParseM)
import           Data.Tuple.Extra

stringToTime ∷ String → UTCTime
stringToTime s = fromJust (
    (zonedTimeToUTC <$> (iso8601ParseM s :: Maybe ZonedTime)) <|>
    iso8601ParseM s
    )

year ∷ UTCTime → Integer
year = fst3 . toGregorian . utctDay

month ∷ UTCTime → Int
month = snd3 . toGregorian . utctDay

today ∷ IO Day
today = utctDay <$> getCurrentTime

diffYears ∷ Day → Day → Integer
diffYears to from = diffDays from to `div` 365

yearsAgo ∷ Day → IO Integer
yearsAgo from = today Data.Functor.<&> diffYears from

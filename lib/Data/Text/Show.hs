module Data.Text.Show where

import Data.Text

-- http-api-data Web.HttpApiData Web.Internal.HttpApiData showTextData
-- http-api-data Web.Internal.HttpApiData showt
-- pandoc Text.Pandoc.Shared, rio RIO.Prelude, classy-prelude ClassyPrelude, stack Stack.Prelude, ginger Text.Ginger.Run.Builtins, yesod-paginator Yesod.Paginator.Prelude, experimenter Experimenter.Util, hw-xml HaskellWorks.Data.Xml.Internal.Show, tonalude Tonalude tshow
tshow ∷ (Show a) ⇒ a → Text
tshow = pack . show

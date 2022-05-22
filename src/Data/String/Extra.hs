module Data.String.Extra where

import           Data.String

nl ∷ String
nl = "\n"

-- Similar to:
-- turtle Turtle.Format repr
-- basic-prelude BasicPrelude fromShow
-- relude Relude.String.Conversion show
-- universum Universum.String.Conversion show
-- configuration-tools Configuration.Utils.Internal sshow
-- string-combinators Data.String.Combinators fromShow
toString ∷ (IsString s, Show s) ⇒ s → String
toString = read . show

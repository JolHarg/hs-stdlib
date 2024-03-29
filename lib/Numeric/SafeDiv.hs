module Numeric.SafeDiv (
    safeDiv
) where

-- unique-logic-tf UniqueLogic.ST.TF.ZeroFractional divideDefault
safeDiv ∷ (Fractional a, Eq a) ⇒ a → a → Maybe a
safeDiv x y = if y == 0 then Nothing else Just (x / y)

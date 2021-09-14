-- composition Data.Composition (.:)
-- util Util (∘∘) 
(.:) :: (c -> d) -> (a -> b -> c) -> a -> b -> d
(.:) = (.) (.) (.)

(...) ∷ (b → c) → (a1 → a2 → b) → a1 → a2 → c
(...) = (.) . (.)

-- yjtools Data.Function.Tools apply2way
apply2way :: (a -> b -> c) -> (d -> a) -> (d -> b) -> d -> c
apply2way f g h = uncurry f . (g &&& h)

infixr 9 ...

-- original
(>...>) ∷ (a1 → a2 → b) → (b → c) → a1 → a2 → c
(>...>) = flip (...)
infixr 9 >...>

-- composition Data.Composition (.::) / (.***) / compose4
-- opaleye Opaleye.Internal.Helpers (.::)
-- wrap Data.Function.Wrap wrap4
(.---.) ∷ (b → c) → (a4 → a5 → a6 → a7 → b) → a4 → a5 → a6 → a7 → c
(.---.) = (...) . (...)
infixr 9 .---.

-- original
(>---) ∷ (a4 → a5 → a6 → a7 → b) → (b → c) → a4 → a5 → a6 → a7 → c
(>---) = flip (.---.)
infixr 9 >---

-- Black magic combinator
combineCont ∷ (d → e → f) → ((d → a) → b) → ((e → c) → a) → (f → c) → b
combineCont k f1 f2 a = f1 $ f2 . a ... k
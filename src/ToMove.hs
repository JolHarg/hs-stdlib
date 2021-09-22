{-# LANGUAGE UnicodeSyntax #-}

-- extra: Data.List.Extra
(!?) ∷ [a] → Int -> Maybe a
xs !? i = if length xs > i then Just (xs !! i) else Nothing

-- Stolen from utility-ht
inRange ∷ Ord a ⇒ (a, a) → a -> Bool
inRange (from, to) = apply2way (&&) (>= from) (<= to)

-- todo replace with calls to ilist?
replaceListElement ∷ Int → a -> [a] -> [a]
replaceListElement n x xs = take n xs <> ([x] <> drop (n + 1) xs)

-- similar to utility-ht's nest, or applyN, nTimes, etc
iter ∷ Int → (a -> a) -> a -> a
iter 0 _ x = x
iter 1 f x = f x
iter i f x = iter (i - 1) f x

-- utility-ht's Control.Monad.HT's nest
iterA ∷ Applicative f ⇒ Int → (a -> f a) -> a -> f a
iterA 0 _ x = pure x
iterA 1 f x = f x
iterA i f x = iterA (i - 1) f x


avg ∷ [Int] → Double
avg xs = fromIntegral (sum xs) / fromIntegral (length xs)

{-
-- Retrieve the conXYZ-ascending-index pairs from a list
-- and pure them in another list
-- e.g. [1,2,3] -> [(1, 2), (2, 3)]
-}

freq ∷ (Eq a, Ord a) ⇒ [a] → Map a Integer
freq xs = fromListWith (+) [(c, 1) | c <- xs]

-- base-unicode-symbols Prelude.Unicode (∤)
notdiv ∷ Integral a ⇒ a → a → Bool
notdiv x y = y `mod` x /= 0

-- https://wiki.haskell.org/Random_shuffle

instance {-# OVERLAPPABLE #-} (Bounded a, Enum a) => Random a where
    random = randomR (minBound, maxBound)
    randomR (from, to) gen =
        let (rndInt, nxtGen) = randomR (fromEnum from, fromEnum to) gen
        in (toEnum rndInt, nxtGen)





-- adj
-- Ranged-sets Data.Ranged.Boundaries enumAdjacent
isAdjacent ∷ (Enum a) ⇒ a → a → Bool
isAdjacent a b = 1 == abs (fromEnum a - fromEnum b)

-- (\\) ?
filterOutList ∷ (Eq a) ⇒ [a] → [a] → [a]
filterOutList bads = filter (not . flip elem bads) -- todo reduce

-- extra Data.Either.Extra Extra fromEither
fromEither ∷ Either a a → a
fromEither (Left x)  = x
fromEither (Right y) = y

step ∷ Integer → Integer
step = product . fmap (read . (: [])) . show

-- flip of utility-ht Data.Maybe.HT toMaybe
toMaybe ∷ a → Bool → Maybe a
toMaybe l b =
    if b
    then Just l
    else Nothing


integerToDigits ∷ Integer → [Integer]
integerToDigits n = (\y -> read [y] :: Integer) <$> show n



takeWhileOneMore ∷ (a → Bool) → [a] → [a]
takeWhileOneMore p = foldr (\y ys -> if p y then y:ys else [y]) []

intsToPrintList ∷ [Integer] → String
intsToPrintList xs = intercalate  ", " (fmap show xs)

-- should go in Text.Parsec.xx
number ∷ Parsec String u Int
number = read <$> many digit


(%) ∷ ((String → a) → b) → ((String → c) → a) → (String → c) → b
(%) = combineCont (++)

waitSecs ∷ Int → IO ()
waitSecs x = threadDelay (x * 1000000)

exitWith ∷ MonadIO m ⇒ (() → IO a) → m a
exitWith aExit = liftIO . aExit $ ()

-- Decision to use . or $ based on output type?

{-# LANGUAGE NoImplicitPrelude #-}

module StdPrelude (
    toString,
    putStrLn,
    print,
    putStrLnError,
    printError,
    Eq(..),
    Show(..),
    IO(),
    ($),
    (<>),
    (.),
    error,
    mempty,
    (&&),
    getLine,
    sshow,
    read,
    fromIntegral,
    return,
    Applicative(..),
    const,
    (<$>),
    Maybe(..),
    Bool(..),
    io
) where

import Control.Monad.IO.Class
import Data.String
import Prelude                hiding (error, getLine, print, putStrLn)
import Prelude                qualified as P (error, getLine, print, putStrLn)
import System.IO              hiding (getLine, print, putStrLn)

io ∷ (MonadIO m) ⇒ IO a → m a
io = liftIO

putStrLn ∷ (MonadIO m, Show s) ⇒ s → m ()
putStrLn = liftIO . P.putStrLn . toString

-- protolude Protolude print
print ∷ (MonadIO m, Show s) ⇒ s → m ()
print = liftIO . P.print

-- basic-prelude BasicPrelude fromShow
toString ∷ (Show s) ⇒ s → String
toString = read . show

getLine ∷ (MonadIO m, IsString s) ⇒ m s
getLine = liftIO $ fromString <$> P.getLine

putStrLnError ∷ (MonadIO m, Show s) ⇒ s → m ()
putStrLnError = liftIO . hPutStrLn stderr . toString

printError ∷ (MonadIO m, Show s) ⇒ s → m ()
printError = liftIO . hPrint stderr

sshow ∷ (Show s, Read st) ⇒ s → st
sshow = read . show

error ∷ (Show s) ⇒ s → a
error = P.error . toString

{-}
-- unliftio
putStrLnL ∷ MonadIO m ⇒ String → m ()
putStrLnL = liftIO . putStrLn

getCharL ∷ MonadIO m ⇒ m Char
getCharL = liftIO getChar

getLineL ∷ MonadIO m ⇒ m String
getLineL = liftIO getLine

-- showit
showCharL ∷ MonadIO m ⇒ Char → m ()
showCharL = putStrLnL . (: [])
-}

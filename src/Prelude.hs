{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE UnicodeSyntax     #-}

module Lib.Prelude (
    toString,
    putStrLn,
    print,
    putStrLnError,
    printError,
    Eq(..),
    Show(..),
    IO(..),
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
    Bool(..)
) where

import           Control.Monad.IO.Class
import qualified Data.IORef             as P
import           Data.Map.Strict
import           Data.String
import           Prelude                (IO, MonadFail, Show, read, show, ($),
                                         (.), (<$>)) hiding (error, getLine, print, putStrLn)
import qualified Prelude                as P (error, getLine, print, putStrLn)
import qualified System.Environment     as P
import           System.IO              hiding (error, getLine, print, putStrLn)

putStrLn ∷ (MonadIO m, IsString s, Show s) ⇒ s → m ()
putStrLn = liftIO . P.putStrLn . toString

-- protolude Protolude print
print ∷ (MonadIO m, Show s) ⇒ s → m ()
print = liftIO . P.print

-- basic-prelude BasicPrelude fromShow
toString ∷ (IsString s, Show s) ⇒ s → String
toString = read . show

getLine ∷ (MonadIO m, IsString s, Show s) ⇒ m s
getLine = liftIO $ fromString <$> P.getLine

putStrLnError ∷ (MonadIO m, IsString s, Show s) ⇒ s → m ()
putStrLnError = liftIO . hPutStrLn stderr . toString

printError ∷ (MonadIO m, Show s) ⇒ s → m ()
printError = liftIO . hPrint stderr

sshow ∷ (Show s, Read s, IsString st, Read st) ⇒ s → st
sshow = read . show

error ∷ (IsString s, Show s) ⇒ s → a
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
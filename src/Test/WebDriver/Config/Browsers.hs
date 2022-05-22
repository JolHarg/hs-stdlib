{-# OPTIONS_GHC -Wno-incomplete-record-updates #-}
-- Above is for chrome {..} etc

module Test.WebDriver.Config.Browsers where

import           Test.WebDriver

firefoxConfig ∷ WDConfig
firefoxConfig = defaultConfig {-{
    wdCapabilities = defaultCaps {
        additionalCaps = [
            ("moz:firefoxOptions", object [
                ("args", Array (fromList [String "--headless"]))
            ])
        ]
    }
}-}

chromeConfig ∷ WDConfig
chromeConfig = defaultConfig {
    wdCapabilities = defaultCaps {
        browser = chrome {
            chromeOptions = ["--headless"]
        }
    }
}

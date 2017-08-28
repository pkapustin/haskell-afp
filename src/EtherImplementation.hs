{-#LANGUAGE FlexibleContexts#-}

module EtherImplementation
    ( printEtherComputation,
    ) where

import Ether.Reader
import DataTypes

computation :: 
    MonadReader' Humidity m =>
    MonadReader' Temperature m =>
    m(Humidity, Temperature)

computation = do
    humidity <- ask'
    temperature <- ask'
    pure (humidity, temperature)

printEtherComputation :: IO()
printEtherComputation = 
    let typedComputation = computation :: ReaderT' Humidity (Reader' Temperature) (Humidity, Temperature)
        humidity = Humidity 50 
        temperature = Temperature 25
        result = runReader (runReaderT typedComputation humidity) temperature
    in print result
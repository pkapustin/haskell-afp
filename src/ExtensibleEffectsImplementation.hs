{-#LANGUAGE FlexibleContexts#-}

module ExtensibleEffectsImplementation
    ( printExtensibleEffectsComputation,
    ) where

import Control.Eff
import Control.Eff.Reader.Lazy
import DataTypes

computation :: 
    Member (Reader Humidity) r =>
    Member (Reader Temperature) r =>
    Eff r (Humidity, Temperature)

computation = do
    humidity <- ask
    temperature <- ask
    pure (humidity, temperature)

printExtensibleEffectsComputation :: IO()
printExtensibleEffectsComputation = 
    let humidity = Humidity 50 
        temperature = Temperature 25
        result = run $ runReader (runReader computation humidity) temperature
    in print result
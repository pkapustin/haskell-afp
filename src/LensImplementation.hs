{-#LANGUAGE FlexibleContexts#-}

module LensImplementation
    ( printLensComputation,
    ) where

import Control.Monad.Reader
import Control.Lens
import DataTypes

localComputation :: MonadReader Humidity m => m Humidity
localComputation = do
    humidity <- ask
    pure humidity

globalComputation :: 
    MonadReader (Humidity, Temperature) m =>
    Magnify n m Humidity (Humidity, Temperature) =>
    Functor (Magnified m Humidity) =>
    m Humidity

globalComputation = do
    humidity <- magnify _1 localComputation
    pure humidity

printLensComputation :: IO ()
printLensComputation =
    let typedComputation = globalComputation :: Reader (Humidity, Temperature) Humidity
        humidity = Humidity 50 
        temperature = Temperature 25
        result = runReader typedComputation (humidity, temperature)
    in print result
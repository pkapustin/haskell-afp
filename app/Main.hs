module Main where

import ExtensibleEffectsImplementation
import EtherImplementation
import LensImplementation

main :: IO ()
main = do
    printExtensibleEffectsComputation
    printEtherComputation
    printLensComputation
    
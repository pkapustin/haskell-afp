module DataTypes
    ( Humidity (..),
      Temperature (..)
    ) where

newtype Humidity = Humidity Int deriving (Show)
newtype Temperature = Temperature Int deriving (Show)
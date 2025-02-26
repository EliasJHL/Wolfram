{-
-- Main.hs for B-FUN-400-MPL-4-1-bswolfram-elias-josue.hajjar-llauquen in /home/elias/Documents/Epitech/Wolfram/B-FUN-400-MPL-4-1-bswolfram-elias-josue.hajjar-llauquen
--
-- Made by Elias Josué HAJJAR LLAUQUEN
-- Login   <elias-josue.hajjar-llauquen@epitech.eu>
--
-- Started on  Mon Feb 17 09:21:57 2025 Elias Josué HAJJAR LLAUQUEN
-- Last update Thu Feb 26 15:19:14 2025 Elias Josué HAJJAR LLAUQUEN
-}

import System.Environment(getArgs)
import Data.List()
import Data.Maybe(fromJust)

data Conf = Conf {
    rule::Int,
    start::Int,
    numLines::Int,
    window::Int,
    move::Int
} deriving (Show)

defaultConf::Conf
defaultConf = Conf {
    rule = -99,
    start = 0,
    numLines = -99,
    window = 80,
    move = 0
}

rule30::Bool -> Bool -> Bool -> Bool
rule30 True True True = False
rule30 True True False = False
rule30 True False True = False
rule30 True False False = True
rule30 False True True = True
rule30 False True False = True
rule30 False False True = True
rule30 False False False = False

rule90::Bool -> Bool -> Bool -> Bool
rule90 True True True = False
rule90 True True False = True
rule90 True False True = False
rule90 True False False = True
rule90 False True True = True
rule90 False True False = False
rule90 False False True = True
rule90 False False False = False

rule110::Bool -> Bool -> Bool -> Bool
rule110 True True True = False
rule110 True True False = True
rule110 True False True = True
rule110 True False False = False
rule110 False True True = True
rule110 False True False = True
rule110 False False True = True
rule110 False False False = False

applyRule :: Int -> Bool -> Bool -> Bool -> Bool
applyRule 30 = rule30
applyRule 90 = rule90
applyRule 110 = rule110

applyToRow :: (Bool -> Bool -> Bool -> Bool) -> [Bool] -> [Bool]
applyToRow rule cells = zipWith3 rule (False:init cells) cells (tail cells ++ [False])

boolToChar::Bool -> String
boolToChar True = "*"
boolToChar False = " "

display::Maybe Conf -> IO()
display Nothing = return()
display (Just conf) = do
    let window_size = window conf
    let init = replicate (window_size `div` 2) False ++ [True] ++ replicate (window_size `div` 2) False
    loop init (numLines conf) (applyRule (rule conf)) (move conf) (start conf)

printRow::[Bool] -> Int -> IO()
printRow row move = do
    let line = concat (map boolToChar row)
    if (move >= 0) then 
        putStrLn (replicate move ' ' ++ line)
    else do
        putStrLn (line ++ replicate (-move) ' ')

loop::[Bool] -> Int -> (Bool -> Bool -> Bool -> Bool) -> Int -> Int -> IO()
loop _ 0 _ _ _ = return()
loop row i rule move start = do
    printRow row move
    loop (applyToRow rule row) (i - 1) rule move start

getOpts::Conf -> [String] -> Maybe Conf
getOpts conf args = Just (conf {
    rule = getValue "--rule" args (rule defaultConf),
    start = getValue "--start" args (start defaultConf),
    numLines = getValue "--lines" args (numLines defaultConf),
    window = getValue "--window" args (window defaultConf),
    move = getValue "--move" args (move defaultConf)
})

getValue::String -> [String] -> Int -> Int
getValue flag args def_val = case dropWhile (/= flag) args of
    (_:value:_) -> read value
    _ -> def_val

main = do
    args <- getArgs
    let config = defaultConf
    let maybeConfig = getOpts config args
    display maybeConfig

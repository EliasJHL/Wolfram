{-
-- EPITECH PROJECT, 2025
-- PDG
-- File description:
-- PDG
-}

module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

-- display::Maybe Conf -> [[Bool]]
-- display Nothing = []
-- display (Just conf)
--     | move conf < 0 = let init = replicate (((window conf) `div` 2) - (-move conf)) False ++ [True] ++ 
--                             replicate (((window conf) `div` 2) - (-move conf)) False 
--             in loop init (numLines conf) (applyRule (rule conf))
--                 (move conf) (start conf)
--     | move conf >= 0 = let init = replicate (((window conf) `div` 2) + (move conf)) False ++ [True] ++ 
--                             replicate (((window conf) `div` 2) - (move conf)) False 
--             in loop init (numLines conf) (applyRule (rule conf))
--                 (move conf) (start conf)
--     -- let init = replicate ((window conf) `div` 2) False ++ [True] ++ 
--     --            replicate ((window conf) `div` 2) False 
--     -- in loop init (numLines conf) (applyRule (rule conf))
--     --     (move conf) (start conf)
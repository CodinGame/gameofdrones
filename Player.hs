module Player where

import System.IO

type State = (Int, Int, Int, [Point])
data Point = Point Int Int deriving (Show)


main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    -- Read init information from standard input, if any
    pidz <- getLine
    let [p, i, d, z] = readList' pidz 
    zones <- getPoints z
    loop (p, i, d, zones)

loop :: State -> IO ()
loop state@(p, i, d, zones) = do
    -- Read information from standard input
    owners <- sequence [readLn | _ <- [1..(length zones)]] ::IO [Int]
    coordinates <- getPoints (p * d)
    
    -- Compute logic here
    
    -- hPutStrLn stderr "Debug messages..."
    
    -- Write action to standard output
    putStrLn "3999 1799"
    
    loop state
    
readList' :: (Read a) => String -> [a]
readList' str = [ read w | w <- ws]
       where ws = words str
       
getPoints :: Int -> IO [Point]
getPoints n = sequence [ getLine >>= \s -> return (readPoint s) | _ <- [1..n]] 

readPoint :: String -> Point
readPoint s = Point x y
    where [x, y] = readList' s


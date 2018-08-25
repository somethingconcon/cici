module Main where

import Lib

import Options.Applicative
import Data.Bool
import Data.ByteString hiding (putStrLn)
import Data.Semigroup ((<>))

data Command =
  Project
  { 
    cmd :: String
    , project :: String
    , mode :: String
    , options :: String
    , dry :: Bool
  } | Learn

parser :: Parser Command

parser = Command 
--   <$> argument 
--     ( str <> metavar "Command")
--   <*> strOption 
--     ( long "project" <> short 'p' <> metavar "Name" <> help "A project for which configuration has been generated or requested")
--   <*> strOption 
--     ( long "mode" <> short 'm' <> help "salt")
--   <*> strOption 
--     ( long "options" <> short 'o' <> help "options which are applicable to the in scope Project")
--   <*> switch 
--     ( long "dry" <> help "Dry run will allow for actions (which would be applied) to be displayed")


-- parser cli opts
-- parser syntax for the command portion of a command structure ie data Command
cmdSyntax :: Parser String
cmdSyntax = let viewOpts = "Commandnd options " ++ ""
            in strOption (long "command" <> short 'c' <> help (showCmdOptions("Commandnd options ")))

showCmdOptions :: String -> String
showCmdOptions s = s ++ "app commands with app, serivce commands with serv."

prjSyntax :: Parser String
prjSyntax = strOption ( long "project" <> short 'p' <> help "Project name for which the action applies" )

builtCommandParser :: ParserInfo Command
builtCommandParser = 
  info (cmdParser <**> helper)
  ( fullDesc 
    <> progDesc "Manage configuration"
    <> header "Cici - Configuration Control a.k.a. corn's configie a test for optparse-applicative" )

doCommand :: Command -> IO ()
doCommand (Command c p m o d) = putStrLn $ "poooooo"

main :: IO ()
main = do 
  doCommand =<< execParser builtCommandParser
  case doCommand of
    (Project name cmd) -> 
    (Configuration file cmd) ->
    (Browser) -> 
    (Calendar) ->




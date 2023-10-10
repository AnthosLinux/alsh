import System.IO
import System.Process
import System.Exit
import System.Directory (setCurrentDirectory, getCurrentDirectory)
import qualified Data.Text as T
import Data.Text.IO as TIO

main :: IO ()
main = do
    System.IO.putStrLn "Simple Haskell Shell"
    System.IO.putStrLn "Type 'exit' to quit"

    shellLoop

shellLoop :: IO ()
shellLoop = do

    let red = "\x1b[31m"
        bold = "\x1b[1m"
        reset = "\x1b[0m"

    currentDir <- getCurrentDirectory
    System.IO.putStr (bold ++ red ++ currentDir ++ reset ++ " > ")
    hFlush stdout

    input <- T.strip <$> TIO.getLine

    case T.unpack input of
        "xexit"  -> exitShell
        "xehello" -> greetUser
        "xehelp"  -> helpUser
        "xesystem" -> systemInfo
        "xenotes" -> notesCmd
        "cd"    -> changeDirectory
        _       -> executeCommand (T.unpack input)

    shellLoop

exitShell :: IO ()
exitShell = do
    System.IO.putStrLn "Goodbye!"
    exitSuccess

greetUser :: IO ()
greetUser = do
    System.IO.putStrLn "Hello, user!"

helpUser :: IO ()
helpUser = do
    let red = "\x1b[31m"
        bold = "\x1b[1m"
        reset = "\x1b[0m"

    System.IO.putStrLn ("\n" ++ bold ++ red ++ "help" ++ reset ++ " - terminal shell manual\n")

systemInfo :: IO ()
systemInfo = do
    let red = "\x1b[31m"
        bold = "\x1b[1m"
        reset = "\x1b[0m"

    System.IO.putStrLn("\n" ++ bold ++ "Eden Linux" ++ reset ++ " - is a Ukrainian GNU/Linux distribution focused on security, speed, and freedom, with love for its users\n")

    System.IO.putStrLn(bold ++ "To report bugs and request new tools, message us on Telegram, Matrix, or Email us\n" ++ reset)

    System.IO.putStrLn(
        "Website: " ++ bold ++ "soon" ++ reset ++ 
        "\nCodeberg:" ++ bold ++ " https://codeberg.org/EdenLinux" ++ reset ++ 
        "\nTelegram: " ++ bold ++ "https://t.me/edenlinux\n" ++ reset
        )

notesCmd :: IO ()
notesCmd = do
    System.IO.putStrLn("Enter your text: ")
    notesCreate <- System.IO.getLine
    System.IO.putStrLn(notesCreate)

executeCommand :: String -> IO ()
executeCommand cmd = do
    exitCode <- system cmd

    case exitCode of
        ExitSuccess   -> System.IO.putStrLn "Command executed successfully"
        ExitFailure _ -> System.IO.putStrLn "Command failed"

changeDirectory :: IO ()
changeDirectory = do
    test <- System.IO.getLine
    System.IO.putStr ("Enter directory path: " ++ test)
    hFlush stdout
    dirPath <- T.strip <$> TIO.getLine
    setCurrentDirectory (T.unpack dirPath)


module Main where
--Zug: Anzahl Sitzpl�tze Gesamt, Anzahl Sitzpl�tze Reserviert, Strecke, Anzahl Waggone  
type Zug = String

--Waggon: Waggon ID, Geh�rtzuZug
type Waggon = (Int, String)

--Reservierung:
type Reservierung = String

--Station:
type Station = String

--Strecke:
type Strecke = [Station]

--Streckennetz:
type Streckennetz = [Strecke]

main :: IO ()
main = do
  zug <- readZug "zug.dat"
  print zug
  putStrLn "addng new zug" 
  writeZug "zug.dat" "\"Zug3\"\n"
  zug <- readZug "zug.dat"
  print zug

  strecken <- readStrecke "streckennetz.dat"

  let strecke1 = strecken !! 0
  let strecke2 = strecken !! 1

  mapM_ print strecke1
  mapM_ print strecke2


foo :: String -> IO String
foo str = do
	readFile str

--liest alle Z�ge einer Strecke aus einer Datei
readZug :: FilePath -> IO Zug
readZug path = do
  alldata <- readFile path
  return (alldata)

--liest alle Strecken aus einer Datei
readStrecke :: FilePath -> IO Streckennetz
readStrecke path = do
  alldata <- readFile path
  return (read alldata)

--schreibt in die Zug Datei
writeZug :: FilePath -> String -> IO ()
writeZug path zugname = do
  appendFile path zugname
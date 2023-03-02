--Show DataBase
SELECT*
FROM Spotify.StreamingHistory1 

--Top 10 Artists
SELECT ArtistName, COUNT(*) AS Total
FROM Spotify.StreamingHistory1
GROUP BY ArtistName
ORDER BY COUNT(*) DESC
LIMIT 10;

--Delete Songs With Less Than 10000 msPlaved Values 

DELETE FROM Spotify.StreamingHistory1 
WHERE msPlayed < 10000
;

--Delete Duplicates trackNames

DELETE FROM Spotify.StreamingHistory1 
WHERE ROWID NOT IN (
SELECT MIN(ROWID)
FROM Spotify.StreamingHistory1 
GROUP BY trackName);

--To count the total number of rows in the table:

SELECT COUNT(*) 
FROM Spotify.StreamingHistory1 

--To find the top 10 most played artists:


SELECT artistName, COUNT(*) as plays
FROM Spotify.StreamingHistory1 
GROUP BY artistName
ORDER BY plays DESC
LIMIT 10;

--To find the top 10 most played tracks:

SELECT trackName, COUNT(*) as plays
FROM Spotify.StreamingHistory1 
GROUP BY trackName
ORDER BY plays DESC
LIMIT 10;

--To find the total time listened in minutes:

SELECT SUM(msPlayed) / 60000 as time_in_minutes
FROM Spotify.StreamingHistory1 



--To find the top 10 genres based on total time listened:

SELECT trackGenre, SUM(msPlayed) / 60000 as time_in_minutes
FROM  Spotify.StreamingHistory1 
GROUP BY trackGenre
ORDER BY time_in_minutes DESC
LIMIT 10;


--To find the total time listened in minutes:

SELECT SUM(msPlayed) / 60000 as time_in_minutes
FROM Spotify.StreamingHistory1

--Total Genre
 SELECT distinct  trackGenre, COUNT(*)  AS Total_genre
 FROM Spotify.StreamingHistory1
GROUP BY trackName;

--How Many Songs has from  genre Bachata?
SELECT COUNT(*)
FROM Spotify.StreamingHistory1
WHERE TrackGenre = 'Bachata'
--By genre reggaeton

SELECT COUNT(*)
FROM Spotify.StreamingHistory1
WHERE TrackGenre = 'Reggaeton'
--By R&B

SELECT COUNT(*)
FROM Spotify.StreamingHistory1
WHERE TrackGenre = 'R&B/Pop'

--Songs with a value great than 200000
SELECT*
FROM Spotify.StreamingHistory1
WHERE msPlayed > 20000;


--WILDCARDS Selects all artist name  staring with "as"

SELECT*
FROM Spotify.StreamingHistory1
WHERE artistName LIKE 'as%'

--Track Names  containing the patter "in", "ach" and "so"
SELECT*
FROM Spotify.StreamingHistory1
WHERE artistName LIKE '%ach%'
OR artistName LIKE '%in%'
OR artistName LIKE  '%so%';


-- 1. Query all the entries in the Genre table
SELECT Label
FROM Genre

-- 2. Query all the entries in the Artist table and order by Artist Name
SELECT ArtistName
FROM Artist
ORDER BY ArtistName

-- 3. Get song Title with artist name
SELECT a.ArtistName, s.Title as SongTitle, s.Id as SongId 
FROM Song s
JOIN Artist a ON s.ArtistId = a.Id;

-- 4. Write a select query that lists all the artists that have a pop album
SELECT a.ArtistName, r.Title
FROM Album r
JOIN Artist a ON r.ArtistId = a.Id
WHERE r.GenreId = 7;


-- 5. Get all artists with rock or jazz albums
SELECT a.ArtistName, r.Title
FROM Album r
JOIN Artist a ON r.ArtistId = a.Id
WHERE r.GenreId = 4 OR r.GenreId = 2

-- 6. Get all albums with no songs
SELECT Album.Title
FROM Album 
LEFT JOIN Song s ON Album.Id = s.AlbumId 
WHERE s.AlbumId IS NULL

-- 7. add an artist to the artist table
-- INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Ed Sheeran', 2008)


-- 8. add one or more albums from that artist to the alumn table
-- INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Add', '11/20/2019', 3151, 'Warner Bros', 28, 7)

-- 9. add one or more songs to the album and artist created
-- INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Wake Me Up', 229, '11/20/2019', 7, 28, 23)

-- 10. write a query that provides song titles, ablum title and artist name for all of the data i just entered
SELECT r.Title AS AlbumTitle, s.Title AS SongTitle, a.ArtistName
FROM Album r
LEFT JOIN Song s ON s.AlbumId = r.Id
LEFT JOIN Artist a ON s.ArtistId = a.Id

-- 11. write a select statement to display how many songs exist for each album
SELECT count (s.Title) as SongCount, a.Title as AlbumTitle
FROM Song s
JOIN Album a ON s.AlbumId = a.Id
GROUP BY a.Title

-- 12. write a select statement to display how many songs exist for each artist
SELECT count (s.Title) as SongCount, a.ArtistName as ArtistName
FROM Song s
JOIN Artist a ON s.ArtistId = a.Id
GROUP BY a.ArtistName

-- 13. write a select statement to display how many songs exist for each genre
SELECT COUNT (s.Title) as SongCount, g.Label as Genre
FROM Song s
JOIN Genre g ON s.GenreId = g.Id
GROUP BY g.Label



-- 14. write a select query that lists the artists that have put out records on more than one record label
SELECT COUNT (DISTINCT a.Label), Artist.ArtistName
FROM Album a
JOIN Artist ON a.ArtistId = Artist.Id
GROUP BY Artist.ArtistName
HAVING COUNT (DISTINCT a.Label) > 1;

-- 15. using MAX() function write a select statememt to find the album with the longest duration
SELECT AlbumLength, Title
FROM Album
WHERE AlbumLength = (
SELECT MAX(AlbumLength)
FROM Album);


-- 16. using Max() function wirte a select stmnt that that finds the song with the longest duration.
SELECT SongLength, title
FROM Song
WHERE SongLength = (
SELECT MAX(SongLength)
FROM Song);


-- 17. modify the previous query to also display the title of the album. 
SELECT s.SongLength, s.Title AS SongTitle, a.Title AS AlbumTitle
FROM Song s
JOIN Album a ON s.AlbumId = a.Id
WHERE SongLength = (
SELECT MAX(SongLength)
FROM Song);



SELECT p.Title,a.Name FROM Photographs AS p
JOIN AlbumsPhotographs AS ap ON ap.PhotographId = p.Id
JOIN Albums AS a ON a.Id = ap.AlbumId
ORDER BY a.Name,p.Title DESC
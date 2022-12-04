// Displays results in fields ‘AuthorFirstName’, ‘AuthorLastName’, and ‘NumberofGenresPerAuthor’ 
SELECT AuthorFirstName, AuthorLastName, GenresPerAuthor.NumberofGenresPerAuthor
// Counts number of different genres written per author 
FROM Author
INNER JOIN(
   	SELECT BookAuthor, COUNT(Genre) as NumberofGenresPerAuthor
   	FROM Book
   	GROUP BY BookAuthor)
AS GenresPerAuthor
ON Author.AuthorID = GenresPerAuthor.BookAuthor 
// Only displays authors that have written more than one type of genre  
WHERE NumberofGenresPerAuthor > 1
// Displays results by alphabetical order of author’s last name 
ORDER BY AuthorLastName;

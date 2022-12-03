// Displays results in fields ‘Genre’ and ‘TimesBorrowed’ (number of times each genre is borrowed)
SELECT Genre, COUNT(Genre) AS TimesBorrowed
FROM Book
INNER JOIN(
SELECT Borrower.BookID
   	FROM Borrower
   	WHERE ClientID IN(
// Displays results borrowed by clients born in 1970 through 1980 
   		 SELECT ClientID
   		 FROM Client
   		 WHERE ClientDoB BETWEEN 1970 AND 1980))
AS BorrowedDoB70to80
ON Book.BookID = BorrowedDoB70to80.BookID
// Displays only the top 5 borrowed genres, in descending order 
GROUP BY Genre
ORDER BY TimesBorrowed DESC LIMIT 5;

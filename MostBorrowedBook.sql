// Displays results in field ‘BookTitle’ 
SELECT Book.BookTitle
FROM Book
WHERE Book.BookID IN(
SELECT Borrower.BookID
FROM Borrower
INNER JOIN(
// Counts the number of times each book was borrowed per year 
SELECT Borrower.BookID, YEAR(BorrowDate) AS YearBorrowed, COUNT(Borrower.BookID) AS TimesBorrowed
           	FROM Borrower
// Displays the single most borrowed book during 2015 through 2017 
           	WHERE YEAR(BorrowDate) >= 2015 AND YEAR(BorrowDate) <= 2017
           	GROUP BY Borrower.BookID
           	ORDER BY TimesBorrowed DESC LIMIT 1)
AS MostBorrowedBook
ON Book.BookID = MostBorrowedBook.BookID);

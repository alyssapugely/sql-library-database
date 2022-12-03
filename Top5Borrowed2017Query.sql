// Displays results in fields ‘AuthorFirstName’, ‘AuthorLastName’
SELECT AuthorFirstName, AuthorLastName
FROM Author
WHERE AuthorID IN(
SELECT BookAuthor
FROM Book
INNER JOIN(
// Counts number of times each book borrowed is per year 
SELECT BookID, YEAR(BorrowDate) AS YearBorrowed, COUNT(BookID)       AS TimesBorrowed
   		FROM Borrower
// Displays only books borrowed in 2017	
   		WHERE YEAR(BorrowDate) = 2017
   		GROUP BY BookID
// Displays only the top 5 books borrowed, in descending order
   		ORDER BY TimesBorrowed DESC LIMIT 5)
   	 AS Top5BooksBorrowed
   	 ON Book.BookID = Top5BooksBorrowed.BookID);

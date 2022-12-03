// Displays results in field ‘AuthorNationality’ 
SELECT AuthorNationality
FROM Author
WHERE AuthorID IN(
SELECT BookAuthor
FROM Book
INNER JOIN(
// Counts number of times each book is borrowed per year 
SELECT BookID, YEAR(BorrowDate) AS YearBorrowed, COUNT(BookID)   	AS TimesBorrowed
       		FROM Borrower
// Displays only the least 5 books borrowed, in ascending order 
       		WHERE YEAR(BorrowDate) >= 2015 AND YEAR(BorrowDate) <= 2017
       		GROUP BY BookID
       		ORDER BY TimesBorrowed ASC LIMIT 5)
    	AS Least5BooksBorrowed
    	ON Book.BookID = Least5BooksBorrowed.BookID);

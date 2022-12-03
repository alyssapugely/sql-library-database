// Creates view of query, titled ‘AtLeast20PercentofClientsBorrowed’ 
CREATE VIEW AtLeast20PercentofClientsBorrowed AS
/* Displays results in fields ‘BookTitle’ and ‘PercentageofClientsthatBorrowed’ (percentage of clients that borrowed each book) */
SELECT BookTitle, PercentageofClientsThatBorrowed
FROM(
/* Divides total times each book was borrowed by total clients (80) to calculate the percentage of clients that borrowed each book */
SELECT BookTitle, TimesBorrowed/80 AS PercentageofClientsThatBorrowed
   	FROM(
// Counts the total times each book was borrowed 
SELECT BookTitle, BooksBorrowed.Bookid, count(BooksBorrowed.BookID) AS TimesBorrowed
   		FROM Book
   			INNER JOIN(
   			SELECT BookID, ClientID
   			FROM Borrower) AS BooksBorrowed
   			ON Book.BookID = BooksBorrowed.BookID
   			GROUP BY BookTitle) AS TotalTimesBorrowed)
// Displays only books that were borrowed by at least 20% of clients 
AS AtLeast20PercentofClientsBorrowed
WHERE PercentageofClientsThatBorrowed>= 0.20;

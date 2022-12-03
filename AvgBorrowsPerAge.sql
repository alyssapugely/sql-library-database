/* Displays results in fields ‘Age’ (calculated by subtracting the integer data from field ‘ClientDoB’ from current year 2022) and ‘AverageBooksBorrowed’ (average of ‘TotalBooksBorrowed’ by age) */ 
SELECT 2022 - ClientDoB AS Age, AVG(TotalBooksBorrowed) AS AverageBooksBorrowed
FROM Client
INNER JOIN(

// Counts total books borrowed per client 
SELECT BooksBorrowed.ClientID, BooksBorrowed.BookID, COUNT(BooksBorrowed.ClientID) AS TotalBooksBorrowed
   	FROM Client
INNER JOIN (
   		SELECT ClientID, BookID
   		FROM Borrower)
AS BooksBorrowed
   	ON Client.ClientID = BooksBorrowed.ClientID
   	GROUP BY BooksBorrowed.ClientID)
// Sorts average of books borrowed per age by field ‘Age’ 
AS AverageBorrowsPerAge
ON Client.ClientID = AverageBorrowsPerAge.ClientID
GROUP BY Age;

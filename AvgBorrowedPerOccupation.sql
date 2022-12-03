// Displays results in fields ‘Occupation’ and ‘AverageBooksBorrowed’ (average books borrowed per occupation 
SELECT Client.Occupation, AVG(TotalBooksBorrowed) AS AverageBooksBorrowed
FROM Client
INNER JOIN(
// Displays total books borrowed per client 
SELECT BooksBorrowed.ClientID, BooksBorrowed.BookID,    COUNT(BooksBorrowed.ClientID) AS TotalBooksBorrowed
   	FROM Client
   	INNER JOIN (
SELECT ClientID, BookID
   		FROM Borrower)
AS BooksBorrowed
   	ON Client.ClientID = BooksBorrowed.ClientID
   	GROUP BY BooksBorrowed.ClientID)
    AS OccupationAverageBorrows
    ON Client.Clientid = OccupationAverageBorrows.ClientID
// Displays results by occupation 
    GROUP BY Occupation;

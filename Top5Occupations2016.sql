// Displays results in fields ‘Occupation’ and ‘TimesBorrowed’ (number of times each occupation borrows any book 
SELECT Occupation, COUNT(Occupation) AS TimesBorrowed
FROM Client
INNER JOIN(
// Displays results borrowed by clients in 2016 
SELECT Borrower.ClientID
FROM Borrower
WHERE BorrowDate LIKE '2016-%')
AS OccupationsBorrowed
ON Client.ClientID = OccupationsBorrowed.ClientID
// Displays the top 5 occupations that borrowed the most books, in descending order 
GROUP BY Occupation
ORDER BY TimesBorrowed DESC LIMIT 5;

// Combines values from ‘Client’ and ‘Borrower’ tables on shared ‘ClientID’ field 
SELECT Client.ClientID, Client.ClientFirstName, Client.ClientLastName
FROM Client
INNER JOIN Borrower
WHERE Client.ClientID = Borrower.ClientID
// Filters field ‘BorrowDate’ by dates in March 2018 
AND BorrowDate LIKE '2018-03-%'
// Organizes results by clients’ first and last names
GROUP BY Client.ClientFirstName, Client.ClientLastName;

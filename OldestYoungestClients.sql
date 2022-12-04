/* Displays fields ‘OldestClient’ and ‘YoungestClient’, with records depicting their age. Age calculated by subtracting the min and max birth years from 2022, the current year */
SELECT MAX(2022 - ClientDoB) AS OldestClient, MIN(2022 - ClientDoB) AS YoungestClient
FROM Client
INNER JOIN Borrower
ON Borrower.ClientId = Client.ClientId;

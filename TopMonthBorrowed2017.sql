/* Displays fields ‘TopMonth’ (Month of BorrowDate) and ‘BooksBorrowedPerMonth (count of how many books borrowed in each month) */
SELECT MONTH(BorrowDate) AS TopMonth, COUNT(MONTH(BorrowDate)) AS BooksBorrowedPerMonth
FROM Borrower
// Only shows results from books borrowed in 2017 
WHERE YEAR(BorrowDate) = 2017
// Results grouped by the month books were borrowed in 
GROUP BY MONTH(BorrowDate)
/* Question asks for the top month of borrows in 2017. 3 months all tied for top with 10 books borrowed per month, so all 3 months are displayed */
ORDER BY BooksBorrowedPerMonth DESC LIMIT 3;

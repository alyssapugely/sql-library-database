/* Age is calculated by subtracting integer data from the ‘ClientDoB’ field from the integer 2022, the current year. AS displays the results of the subtraction in the new field ‘Age’. */
SELECT ClientFirstName, ClientLastName, Occupation, 2022 - ClientDoB AS Age FROM Client;

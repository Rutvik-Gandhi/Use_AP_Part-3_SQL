# Use_AP_Part-3_SQL

This README.md file provides a detailed overview of the SQL script `ex4_RG.sql`, including its purpose, revision history, contents, and usage instructions.

## Revision History

The `ex4_RG.sql` script was created by Rutvik Gandhi for Section 3 on March 20, 2023. It has been modified since its creation.

## Script Overview

The script contains SQL queries and transactions designed to perform various operations on the AP (Accounts Payable) database. Each question corresponds to a specific task related to data manipulation, table creation, insertion, updating, and deletion.

## Contents of the Script

The script consists of the following questions and corresponding SQL queries/transactions:

### Question 1
Create a copy of the Vendors table named VendorCopyRG and display the number of rows in the new table.

### Question 2
Create a new table named InvoiceBalancesRG containing invoices with non-zero balances and display the number of rows in the new table.

### Question 3
Insert a new invoice record into InvoiceBalancesRG for a specific vendor.

### Question 4
Insert a new invoice record into InvoiceBalancesRG for another vendor.

### Question 5
Update the CreditTotal of a specific invoice in InvoiceBalancesRG.

### Question 6
Update the CreditTotal of the top 5 invoices in InvoiceBalancesRG where the balance due is greater than $900.

### Question 7
Delete a specific invoice from InvoiceBalancesRG.

### Question 8
Delete records from VendorCopyRG where the VendorID does not exist in InvoiceBalancesRG.

### Question 9
Attempt to delete invoices for a specific vendor from InvoiceBalancesRG within a transaction and handle potential errors.

### Question 10
Attempt to insert a new invoice into the Invoices table along with corresponding line items, using transactions to ensure data integrity.

## How to Use the Script

1. Open your preferred SQL client or environment.

2. Load the AP database.

3. Copy and paste the SQL queries and transactions from `ex4_RG.sql` into your SQL client.

4. Execute the queries and transactions one by one to perform the desired operations on the database.

## Contributors

- Rutvik Gandhi

## License

This script is provided under the MIT License. See the [LICENSE](LICENSE) file for details.

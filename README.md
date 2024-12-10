Loan Application Analysis Project
This project involves analyzing a loan application dataset by importing it into a PostgreSQL database, performing data analysis through SQL queries, and visualizing key insights using Power BI.

Table of Contents
Overview
Dataset Structure
SQL Analysis
Visualizations in Power BI
How to Use
Key Insights
Contributing
License
Overview
The goal of this project is to provide stakeholders with a detailed analysis of loan applications. Using SQL and Power BI, we analyze trends in loan approval and applicant characteristics over time to identify risk factors and patterns.

Dataset Structure
The dataset contains the following columns:

Column Name	Data Type	Description
ApplicationDate	DATE	Date of loan application.
Age	INT	Age of the applicant.
AnnualIncome	INT	Annual income of the applicant.
CreditScore	INT	Credit score of the applicant.
EmploymentStatus	VARCHAR(50)	Employment status of the applicant (e.g., Employed, Unemployed).
EducationLevel	VARCHAR(50)	Educational qualification of the applicant.
Experience	INT	Total work experience in years.
LoanAmount	INT	Loan amount requested.
LoanDuration	INT	Loan duration in months.
MaritalStatus	VARCHAR(50)	Marital status of the applicant (e.g., Married, Single).
NumberOfDependents	INT	Number of dependents.
HomeOwnershipStatus	VARCHAR(50)	Homeownership status (e.g., Own, Rent).
MonthlyDebtPayments	INT	Total monthly debt payments.
CreditCardUtilizationRate	FLOAT	Utilization rate of credit cards.
NumberOfOpenCreditLines	INT	Number of open credit lines.
NumberOfCreditInquiries	INT	Number of credit inquiries.
DebtToIncomeRatio	FLOAT	Ratio of debt to income.
BankruptcyHistory	INT	Binary flag indicating bankruptcy history.
LoanPurpose	VARCHAR(50)	Purpose of the loan.
PreviousLoanDefaults	INT	Number of previous loan defaults.
PaymentHistory	INT	Payment history score.
LengthOfCreditHistory	INT	Length of credit history in years.
SavingsAccountBalance	INT	Total savings account balance.
CheckingAccountBalance	INT	Total checking account balance.
TotalAssets	INT	Total assets owned.
TotalLiabilities	INT	Total liabilities.
MonthlyIncome	FLOAT	Total monthly income.
UtilityBillsPaymentHistory	FLOAT	Utility bills payment history score.
JobTenure	INT	Job tenure in years.
NetWorth	INT	Net worth (Total Assets - Total Liabilities).
BaseInterestRate	FLOAT	Base interest rate applicable.
InterestRate	FLOAT	Interest rate for the loan.
MonthlyLoanPayment	FLOAT	Monthly loan payment.
TotalDebtToIncomeRatio	FLOAT	Total debt-to-income ratio.
LoanApproved	BOOLEAN	Whether the loan was approved (TRUE) or declined (FALSE).
RiskScore	FLOAT	Risk score for the applicant.
SQL Analysis
We imported the dataset into a PostgreSQL database and analyzed it with SQL queries.

Key Query:
sql
Copy code
SELECT 
    TO_CHAR(ApplicationDate, 'YYYY') AS Year,
    CASE
        WHEN LoanApproved = TRUE THEN 'Approved'
        ELSE 'Declined'
    END AS application_status,
    COUNT(*) AS Tol_applicants,
    ROUND(AVG(Age), 2) AS avg_age,
    ROUND(AVG(AnnualIncome), 2) AS avg_income,
    ROUND(AVG(TotalAssets), 2) AS avg_assets,
    ROUND(AVG(TotalLiabilities), 2) AS Tol_liabilities,
    ROUND(AVG(SavingsAccountBalance), 2) AS avg_savings_bal,
    ROUND(AVG(JobTenure), 2) AS job_tenture,
    ROUND(AVG(TotalDebtToIncomeRatio)::NUMERIC, 2) AS avg_debtratio
FROM Loan 
GROUP BY 1, 2
ORDER BY 1;
Purpose of the Query:
This query:

Summarizes the loan application trends by year and approval status.
Provides average values for key metrics like age, income, savings, assets, liabilities, and debt-to-income ratio.
Visualizations in Power BI
We exported the query results to Power BI to create the following dashboards:

Total Applicants by Year and Application Status: Displays trends in total loan applicants and approval rates over time.
Average Age by Year and Application Status: Highlights the age profiles of approved vs. declined applicants.
Debt-to-Income Ratio by Year and Application Status: Shows financial risk trends among applicants over time.
How to Use
Clone this repository:
bash
Copy code
git clone https://github.com/your-username/loan-analysis.git
Import the dataset into your PostgreSQL database using the provided CREATE TABLE script.
Run the SQL queries to analyze the data.
Use Power BI to create visualizations with the provided SQL outputs.
Key Insights
Loan approvals are influenced by factors such as age, annual income, and debt-to-income ratio.
Trends in liabilities and assets can indicate financial risk patterns.
Visualizations provide actionable insights for stakeholders to make data-driven decisions.

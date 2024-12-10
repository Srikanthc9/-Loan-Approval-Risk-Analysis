# Loan Application Analysis Project

This project analyzes a loan application dataset to gain insights into loan approval trends and applicant characteristics.

**Table of Contents**

* **Overview**
* **Dataset Structure**
* **SQL Analysis**
* **Visualizations in Power BI**
* **Key Insights**

**Overview**

This project aims to provide stakeholders with a comprehensive analysis of loan applications. By leveraging SQL and Power BI, we analyze trends in loan approval rates and identify key factors influencing loan decisions.

**Dataset Structure**

The dataset contains information on various applicant attributes, including:

* **ApplicationDate:** Date of loan application.
* **Age:** Age of the applicant.
* **AnnualIncome:** Annual income of the applicant.
* **CreditScore:** Credit score of the applicant.
* **EmploymentStatus:** Employment status of the applicant.
* **EducationLevel:** Educational qualification of the applicant.
* **Experience:** Total work experience in years.
* **LoanAmount:** Loan amount requested.
* **LoanDuration:** Loan duration in months.
* **MaritalStatus:** Marital status of the applicant.
* **NumberOfDependents:** Number of dependents.
* **HomeOwnershipStatus:** Homeownership status.
* **MonthlyDebtPayments:** Total monthly debt payments.
* **CreditCardUtilizationRate:** Utilization rate of credit cards.
* **NumberOfOpenCreditLines:** Number of open credit lines.
* **NumberOfCreditInquiries:** Number of credit inquiries.
* **DebtToIncomeRatio:** Ratio of debt to income.
* **BankruptcyHistory:** Bankruptcy history flag.
* **LoanPurpose:** Purpose of the loan.
* **PreviousLoanDefaults:** Number of previous loan defaults.
* **PaymentHistory:** Payment history score.
* **LengthOfCreditHistory:** Length of credit history in years.
* **SavingsAccountBalance:** Total savings account balance.
* **CheckingAccountBalance:** Total checking account balance.
* **TotalAssets:** Total assets owned.
* **TotalLiabilities:** Total liabilities.
* **MonthlyIncome:** Total monthly income.
* **UtilityBillsPaymentHistory:** Utility bills payment history score.
* **JobTenure:** Job tenure in years.
* **NetWorth:** Net worth (Total Assets - Total Liabilities).
* **BaseInterestRate:** Base interest rate applicable.
* **InterestRate:** Interest rate for the loan.
* **MonthlyLoanPayment:** Monthly loan payment.
* **TotalDebtToIncomeRatio:** Total debt-to-income ratio.
* **LoanApproved:** Whether the loan was approved (TRUE) or declined (FALSE).
* **RiskScore:** Risk score for the applicant.

**SQL Analysis**

The dataset is imported into a PostgreSQL database, and key SQL queries are used to analyze trends in loan applications. 

**Key Query:**

~~~sql
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
~~~
This query summarizes loan application trends by year and approval status, providing average values for key metrics.

 **Visualizations in Power BI**

* **Total Applicants by Year and Application Status:** Displays trends in total loan applicants and approval rates over time.
* **Average Age by Year and Application Status:** Highlights the age profiles of approved vs. declined applicants.
* **Debt-to-Income Ratio by Year and Application Status:** Shows financial risk trends among applicants over time.

**Key Insights**

* Loan approvals are influenced by factors such as age, annual income, and debt-to-income ratio.
* Trends in liabilities and assets can indicate financial risk patterns.
* Visualizations provide actionable insights for stakeholders to make data-driven decisions.

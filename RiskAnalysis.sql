CREATE TABLE loan (
    ApplicationDate DATE,
    Age INT,
    AnnualIncome INT,
    CreditScore INT,
    EmploymentStatus VARCHAR(50),
    EducationLevel VARCHAR(50),
    Experience INT,
    LoanAmount INT,
    LoanDuration INT,
    MaritalStatus VARCHAR(50),
    NumberOfDependents INT,
    HomeOwnershipStatus VARCHAR(50),
    MonthlyDebtPayments INT,
    CreditCardUtilizationRate FLOAT,
    NumberOfOpenCreditLines INT,
    NumberOfCreditInquiries INT,
    DebtToIncomeRatio FLOAT,
    BankruptcyHistory INT,
    LoanPurpose VARCHAR(50),
    PreviousLoanDefaults INT,
    PaymentHistory INT,
    LengthOfCreditHistory INT,
    SavingsAccountBalance INT,
    CheckingAccountBalance INT,
    TotalAssets INT,
    TotalLiabilities INT,
    MonthlyIncome FLOAT,
    UtilityBillsPaymentHistory FLOAT,
    JobTenure INT,
    NetWorth INT,
    BaseInterestRate FLOAT,
    InterestRate FLOAT,
    MonthlyLoanPayment FLOAT,
    TotalDebtToIncomeRatio FLOAT,
    LoanApproved BOOLEAN,
    RiskScore FLOAT
);
select * from Loan;
/*Purpose of the Query:
This query is designed to provide stakeholders with a clear summary
of loan application trends and applicant characteristics over time. */

select TO_CHAR(ApplicationDate,'YYYY') as Year,
case
 	when LoanApproved = True then 'Approved'
	else 'Declined'
	end as application_status,
	count(*) as Tol_applicants,
	round(avg(Age),2) as avg_age,
	round(avg(AnnualIncome),2) as avg_income,
	round(avg(TotalAssets),2) as avg_assets,
	round(avg(TotalLiabilities),2) as Tol_liabilities,
	round(avg(SavingsAccountBalance),2) as avg_savings_bal,
	round(avg(JobTenure),2) as job_tenture,
	round(avg(TotalDebtToIncomeRatio)::numeric, 2) as avg_debtratio
	from Loan group by 1,2
	order by 1;

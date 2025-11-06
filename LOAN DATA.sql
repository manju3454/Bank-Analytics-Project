SELECT * FROM classicmodels.loan_data;
SET SQL_SAFE_UPDATES = 0;

select * from loan_data;

ALTER TABLE loan_data
ADD COLUMN temp_b_date DATE;

UPDATE loan_data
SET temp_b_date = STR_TO_DATE(Date_of_birth , '%d-%m-%y');

SELECT temp_b_date
FROM loan_data
WHERE temp_b_date = '' OR temp_b_date IS NULL;

UPDATE loan_data
SET temp_b_date = NULL
WHERE temp_b_date = '';

UPDATE loan_data
SET temp_b_date = STR_TO_DATE(temp_b_date, '%Y-%m-%d');

SELECT temp_b_date, `Dateof Birth`
FROM loan_data
WHERE temp_b_date IS NULL;

ALTER TABLE loan_data DROP COLUMN `Dateof Birth`;
ALTER TABLE loan_data CHANGE COLUMN temp_b_date `Birth Date` DATE;

Desc loan_data;

set sql_safe_updates=1;

alter table loan_data
change column `State Abbr` state_abbr text;
alter table loan_data
change column `Account id` Accnt_id text;
alter table loan_data
change column `BH Name` BH_name text;
alter table loan_data
change column `Bank Name` Bank_name text;
alter table loan_data
change column `Branch Name` Branch_name text;
alter table loan_data
change column `Center id` Center_id text;
alter table loan_data
change column `client id` client_id text;
alter table loan_data
change column `Close client` close_client text;
alter table loan_data
change column `closed date` closed_date text;
alter table loan_data
change column `Credif Officer Name` credit_officer_name text;
alter table loan_data
change column `Dateof Birth` Date_of_birth text;
alter table loan_data
change column `Disb By` Disb_by text;
alter table loan_data
change column `Disbursement Date` Disbursement_date text;
alter table loan_data
change column `Disbursement Date (Years)` Disbursement_Date_years text;
alter table loan_data
change column `Gender ID` Gender_id text;
alter table loan_data
change column `Home Ownership` Home_ownership text;
alter table loan_data
change column `Loan Transferdate` Loan_transferdate text;
alter table loan_data
change column `NextMeetingDate` Next_Meeting_Date text;
alter table loan_data
change column `Product Code` Product_Code text;
alter table loan_data
change column `Sub Grade` sub_grade text;
alter table loan_data
change column `Product Id` product_id text;
alter table loan_data
drop column MyUnknownColumn;
alter table loan_data
change column `Purpose Category` purpose_category text;
alter table loan_data
change column `Region Name` Region_Name text;
alter table loan_data
change column `Verification Status` Verification_Status text;
alter table loan_data
change column `State Name` State_Name text;
alter table loan_data
change column `Tranfer Logic` Tranfer_Logic text;
alter table loan_data
change column `Is Delinquent Loan` Is_Delinquent_Loan text;
alter table loan_data
change column `Is Default Loan` Is_Default_Loan text;
alter table loan_data
change column `Delinq 2 Yrs` Delinq_2_Yrs text;
alter table loan_data
change column `Application Type` Application_Type text;
alter table loan_data
change column `Loan Amount` Loan_Amount double;
alter table loan_data
change column `Funded Amount` Funded_Amount double;
alter table loan_data
change column `Funded Amount Inv` Funded_Amount_Inv int;
alter table loan_data
change column `Int Rate` int_rate text;
alter table loan_data
change column `Total Pymnt` Total_Pymnt double;
alter table loan_data
change column `Total Pymnt inv` Total_Pymnt_inv double;
alter table loan_data
change column `Total Rec Prncp` Total_Rec_Prncp double;
alter table loan_data
change column `Total Fees` Total_Fees double;
alter table loan_data
change column `Total Rrec int` Total_Rrec_int double;
alter table loan_data
change column `Total Rec Late fee` Total_Rec_Late_fee double;
alter table loan_data
change column `Collection Recovery fee` Collection_Recovery_fee double;


select Sum(Funded_Amount) from loan_data group by funded_Amount;

select count(Accnt_id) as total_no_of_loans from loan_data;

select Branch_name, sum(Funded_Amount) as total_funded ,
sum(total_rec_prncp) as total_recovered from loan_data
 group by branch_name;
 
 select state_name,sum(distinct Funded_Amount) as funded from loan_data group  by state_name;
 
 SELECT Religion, SUM(Funded_Amount) as amount FROM loan_data GROUP BY Religion;
 
 SELECT purpose_category, SUM(Funded_Amount) as amount FROM loan_data GROUP BY purpose_category;
 
 SELECT Grrade, SUM(Funded_Amount) FROM loan_data GROUP BY Grrade;
 
 SELECT COUNT(*) as Default_Loan_count FROM loan_data where Is_Default_Loan ="Y";
 
  SELECT COUNT(*) as Delinq_Loan_count FROM loan_data where Is_Delinquent_Loan="Y";
  
  SELECT ROUND(COUNT(CASE WHEN  is_delinquent_loan = 'Y' THEN 1 END) * 100.0 / COUNT(*), 2) AS DelinquentLoanRate FROM loan_data;
  
   SELECT ROUND(COUNT(CASE WHEN  is_Default_loan = 'Y' THEN 1 END) * 100.0 / COUNT(*), 2) AS Default_LoanRate FROM loan_data;
   

   
  
  
 
 
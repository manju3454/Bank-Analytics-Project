Use classicmodeels;
Alter table credit_debit change column `customer id` customer_id text;
alter table credit_debit change column `customer name` customer_name text;
alter table credit_debit change column `Account Number` Account_number text;
alter table credit_debit change column `Transaction Date` Transaction_date text;
alter table credit_debit change column `Transaction Type` Transaction_Type text;
alter table credit_debit change column `Transaction Method` Transaction_Method text;
select*from credit_debit;
select sum(amount) as total_creditamount from credit_debit where transaction_type="Credit";
select sum(amount) as total_debitamount from credit_debit where transaction_type="debit";
select sum(case when transaction_type="credit" then amount else 0 end)/nullif(sum(case when transaction_type="debit" then amount else 0 end),0)
as credit_debitratio from credit_debit;
select sum(case when transaction_type="credit" then amount when Transaction_Type="debit" then -Amount else 0 end)
as Net_transaction from credit_debit;
select customer_id, count(customer_id)*1.0/avg(balance) as acct_actvty_ratio from credit_debit group by customer_id;

select year(transaction_date) as year,month(transaction_date) as month_number,count(*) as total_transactions 
from credit_debit group by year(Transaction_date),month(Transaction_date) order by Year,Month_number;

use exam01;
1.SELECT C.CUSTEMOR_ID,C.GRADE FROM CUSTOMER C INNER JOIN ORDERS O ON C.CUSTEMOR_ID = O.CUSTEMOR_ID ORDER BY C.GRADE


2.CREATE VIEW VIEW2 AS (SELECT O.ORD_NO,O.PURCH_AMT,O.ORD_DATE,O.CUSTOMER_ID,S.SALESMAN_ID,S.COMMISION FROM ORDERS O INNER JOIN SALESMAN S ON O.SALESMAN_ID = S.SALESMAN_ID)

SELECT * FROM VIEW2

SELECT * FROM VIEW2 WHERE COMMISION = (SELECT MAX(COMMISION) FROM VIEW2)

3.SELECT O.ORD_NO,O.PURCH_AMT,O.ORD_DATE,S.SALESMAN_ID,S.CITY FROM ORDERS O INNER JOIN SALESMAN S ON O.SALESMAN_ID = S.SALESMAN_ID WHERE S.CITY = 'NAGPUR'

4.with result as(select max(ord_date) 'Order_Date',sum(purch_amt)'Total_Purchase_amount' from orders
group by ord_date)
select * into Output6 from result where 1=1
alter table output6 add Total_commision float

update Output6
set total_commision = Total_Purchase_amount * 0.15

select top 1 * from output6
order by order_date desc

5.WITH RESULT AS
(SELECT PURCH_AMT,DENSE_RANK()OVER(ORDER BY PURCH_AMT DESC)'RANK' FROM ORDERS) SELECT * INTO TABLE2 FROM RESULT WHERE RANK = 5
SELECT * FROM TABLE2

6.SELECT L.CUSTOMER_ID,L.ACCOUNT_NUMBER,L.ACCOUNT_TYPE,L.BALANCE_AMOUNT,R.TRANSACTION_AMOUNT,R.TRANSACTION_DATE FROM BANK_ACCOUNT_DETAILS L,BANK_ACCOUNT_TRANSACTION R WHERE MONTH(TRANSACTION_DATE) IN (3,4) ORDER BY MONTH(TRANSACTION_DATE)

7.An entity can be place, person, object, event or a concept, which stores data in the database.It can be real-world object. It is a collection of related attributes or properties. The characteristics of entities are must have an attribute, and a unique key. Every entity is made up of some 'attributes' which represent that entity.
Examples of entities:Person:�Employee, Student, Patient
                      Place:�Store, Building

Attributes is a single-valued property of either an entity-type or a relationship-type.
Cardinality defines the numerical attributes of the relationship between two entities or entity sets.

8.update bank_account_details set account_type=('credit card') where balance_amount like 0

9.SELECT BAD.CUSTOMER_ID,BAD.ACCOUNT_NUMBER,BAD.BALANCE_AMOUNT,BAT.TRANSACTION_AMOUNT,BAT.TRANSACTION_DATE
FROM BANK_ACCOUNT_DETAILS BAD INNER JOIN BANK_ACCOUNT_TRANSACTION BAT ON BAD.ACCOUNT_NUMBER = BAT.ACCOUNT_NUMBER WHERE MONTH(TRANSACTION_DATE) IN (3,4)

10. select d.customer_id,d.account_number, d.balance_amount, t.transaction_amount
    from Bank_Account_Details d join BANK_ACCOUNT_TRANSACTION t
    on d.Account_Number = t.Account_Number
    where month(transaction_date) <> 3


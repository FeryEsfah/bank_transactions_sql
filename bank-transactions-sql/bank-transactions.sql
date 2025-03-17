create database bank1


create table UserLogins
(UserLoginID smallint not null,
UserLogin char(15) not null,
UserPassword varchar(20) not null
constraint pk_UserLogins_id primary key (UserLoginID))

insert into UserLogins values
(1, 'fery', '123qw'),
(2, 'mery', 'ww34'),
(3, 'moheb', 'er_55'),
(4, 'nadi', '6ty'),
(5, 'abi', '4343gg')

select *
from UserLogins
--***********************************************************

create table AccountType
(AccountTypeID tinyint not null,
 AccountTypeDescription varchar(30) not null
 constraint pk_AccountType_ID primary key (AccountTypeID))

 insert into AccountType values
 (1, 'saving'),
 (2, 'chequing'),
 (3, 'line_of_credit'),
 (4, 'RRSP'),
 (5, 'TFSP')

 select *
 from AccountType 

 --******************************************************************

  create table UserSecurityQuestions
 (UserSecurityQuestionID tinyint not null,
 UserSEcurityQuestion varchar(50)
 constraint pk_UserSecurityQuestions_UserSecurityQuestionID primary key (UserSecurityQuestionID))

 insert into UserSecurityQuestions values
 (1, 'your name'),
 (2, 'eye colour'),
 (3, 'birthday'),
 (4, 'social number'),
 (5, 'email address')

 select *
 from UserSecurityQuestions
 --**************************************************************

 create table SavingInterestRates
 (InterestSavingsRateID tinyint,
 InterestRateValue numeric(9,9),
 InterestRateDescription varchar(20)
 constraint pk_SavingInterestRates_InterestSavingsRateID primary key (InterestSavingsRateID))


 insert into SavingInterestRates values
 (1, 0.222222222, 'yearly'),
 (2, 0.444444444, 'montly'),
 (3, 0.111111111, 'yearly'),
 (4, 0.333333333, 'seasonal'),
 (5, 0.222222222, 'bi weekly')

 select *
 from SavingInterestRates

 --***************************************************************************

  create table FailedTransactionErrorType
 (FailedTransactionErrorTypeID tinyint not null,
 FailedTransactionDescription varchar(50) not null
 constraint pk_FailedTransactionErrorType_FailedTransactionErrorTypeID primary key (FailedTransactionErrorTypeID))

 insert into FailedTransactionErrorType values
 (1, 'not enough money'),
 (2, 'failed'),
 (3, 'wrong password'),
 (4, 'try again'),
 (5, 'call your bank')

 select *
 from FailedTransactionErrorType
 --******************************************************************************

 create table LoginErrorLog
(ErrorLoginID int primary key, errorTime datetime not null, FailedTransactionXML xml);

Insert into LoginErrorLog
Values ('1','2019-07-01 10:10:10','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>3</UserLoginID>
										<Code>1</Code>
										<Description>Insufficient Funds </Description>
										<Message> You do not have sufficient funds in your account. </Message>
									</Error>'),
       ('2','2019-07-01 15:10:10','<?xml version="1.0" encoding="utf-8"?>
									<Error>
									    <UserLoginID>1</UserLoginID>
										<Code>1</Code>
										<Description>Insufficient Funds </Description>
										<Message> You do not have sufficient funds in your account. </Message>
									</Error>'),
       ('3','2019-07-01 20:10:10','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>3</UserLoginID>
										<Code>1</Code>
										<Description>Insufficient Funds </Description>
										<Message> You do not have sufficient funds in your account. </Message>
									</Error>'),
       ('4','2019-07-03 15:10:10','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>3</UserLoginID>
										<Code>8</Code>
										<Description>Expired Card </Description>
										<Message> Your card has expired. Apply for a new one. </Message>
									</Error>');

select *
from LoginErrorLog

--*********************************************************************************************

create table Employee
 (EmployeeID int not null,
 EmployeeFirstName varchar(25) not null,
 EmployeeMiddleInitial char(1) not null,
 EmployeeLastName varchar(25) not null,
 EmployeeIsManager bit not null,
 constraint pk_Employee_EmployeeID primary key (EmployeeID))

 insert into Employee values
 (1, 'fery', 'e', 'shaf', 'true'),
 (2, 'mery', 'm', 'salehi', 'false'),
 (3, 'bety', 'b', 'anari', 'false'),
 (4, 'fana', 'f', 'nasimi', 'true'),
 (5, 'sami', 's', 'mirzaie', 'true')

 select *
 from Employee

 --**************************************************************************************

 create table TransactionType
 (TransactionTypeID tinyint not null,
 TransactionTypeName char(10) not null,
 TransactionTypeDescription varchar(50) not null,
 TransactionFeeAmount smallmoney not null,
 constraint pk_TransactionType_TransactionTypeID primary key (TransactionTypeID))

 --drop table TransactionType

 insert into TransactionType values
 (1, 'credit', 'successful', 2000),
 (2, 'chequing', 'negative balance', 3000),
 (3, 'morgage', 'owned', 1000),
 (4, 'saving', 'enough money', 50000),
 (5, 'RRSP', 'in progress', 10000)

 Select *
 from TransactionType

 --*********************************************************************************

  create table AccountStatusType
 (AccountStatusTypeID tinyint not null,
 AccountStatusTypeDescription varchar(30) not null,
 constraint pk_AccountStatusType_AccountStatusTypeID primary key (AccountStatusTypeID))

 insert into AccountStatusType values
 (1, 'successful'),
 (2, 'negative balance'),
 (3, 'owned'),
 (4, 'enough money'),
 (5, 'in progress')

 select *
 from AccountStatusType
 --*************************************************************************

 
 Create table FailedTransactionLog
(FailedTransactionID int primary key,
 FailedTransactionErrorTypeID tinyint not null foreign key references FailedTransactionErrorType(FailedTransactionErrorTypeID),
 FailedTransactionErrorTime datetime not null,
 FailedTransactionXML xml);


Insert into FailedTransactionLog
Values (10, 1, '2019-07-01','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>3</UserLoginID>
										<Code>1</Code>
										<Description>Insufficient Funds </Description>
										<Message> You do not have sufficient funds in your account. </Message>
									</Error>'),
		(11, 1, '2019-07-01','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>3</UserLoginID>
										<Code>1</Code>
										<Description>Insufficient Funds </Description>
										<Message> You do not have sufficient funds in your account. </Message>
									</Error>'),
		(12, 1, '2019-07-01','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>3</UserLoginID>
										<Code>1</Code>
										<Description>Insufficient Funds </Description>
										<Message> You do not have sufficient funds in your account. </Message>
									</Error>');
select *
from FailedTransactionLog

--*******************************************************************************

create table Account
(AccountID int primary key,
CurrentBalance int not null,
AccountTypeID tinyint references AccountType(AccountTypeID),
AccountStatusTypeID tinyint references AccountStatusType(AccountStatusTypeID),
InterestSavingsRateID tinyint references SavingInterestRates(InterestSavingsRateID))

insert into Account values
(1, 2000.00, 1, 1, 1),
(2, 3000.00, 2, 2, 2),
(3, 4000.00, 3, 3, 3),
(4, 5000.00, 4, 4, 4),
(5, 6000.00, 5, 5, 5)

select *
from Account

--*******************************************************************************

create table Login_Account 
(UserLoginID smallint,
AccountID int not null,
 primary key (UserLoginID, AccountID),
foreign key (UserLoginID) references UserLogins(UserLoginID),
foreign key (AccountID) references Account(AccountID))

insert into Login_Account values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5)

select *
from Login_Account

--**********************************************************************
CREATE TABLE UserSecurityAnswers 
(UserLoginID smallint primary key,
UserSecurityAnswer varchar(25),
UserSecurityQuestionID tinyint,
CONSTRAINT UserSecurityAnswers_UserLoginID FOREIGN KEY (UserLoginID)
        REFERENCES UserLogins(UserLoginID),
CONSTRAINT UserSecurityAnswers_UserSecurityQuestionID FOREIGN KEY (UserSecurityQuestionID)
        REFERENCES UserSecurityQuestions(UserSecurityQuestionID))

INSERT INTO UserSecurityAnswers VALUES
(1, 'Blue', 1),
(2, 'Smith', 2),
(3, 'Rover', 3),
(4, 'Paris', 4),
(5, 'Pizza', 5);

select *
from UserSecurityAnswers

--*******************************************************************************************
create table OverDraftLog  
(AccountID int primary key,
OverDraftDate datetime,
OverDraftAmount money,
OverDraftTransactionXML xml,
constraint OverDraftLog_AccountID foreign key (AccountID) references Account(AccountID))

INSERT INTO OverDraftLog VALUES
(1, '2024-07-01 10:00:00', 50.00, '<Transaction><ID>1</ID><Amount>50.00</Amount></Transaction>'),
(2, '2024-07-02 11:00:00', 75.00, '<Transaction><ID>2</ID><Amount>75.00</Amount></Transaction>'),
(3, '2024-07-03 12:00:00', 100.00, '<Transaction><ID>3</ID><Amount>100.00</Amount></Transaction>'),
(4, '2024-07-04 13:00:00', 25.00, '<Transaction><ID>4</ID><Amount>25.00</Amount></Transaction>'),
(5, '2024-07-05 14:00:00', 60.00, '<Transaction><ID>5</ID><Amount>60.00</Amount></Transaction>');

select *
from OverDraftLog
--***************************************************************************************

create table TransactionLog 
(TransactionID int primary key,
TransactionDate datetime not null,
TransactionTypeID tinyint not null,
TransactionAmount money,
NewBalance money,
AccountID int,
CustomerID int,
EmployeeID int,
UserLoginID smallint)

INSERT INTO TransactionLog VALUES
(1, '2024-07-01 10:00:00', 1, 100.00, 1100.00, 1, 1, 1, 1),
(2, '2024-07-02 11:00:00', 2, 50.00, 1050.00, 2, 2, 2, 2),
(3, '2024-07-03 12:00:00', 1, 200.00, 1200.00, 3, 3, 3, 3),
(4, '2024-07-04 13:00:00', 3, 150.00, 1150.00, 4, 4, 4, 4),
(5, '2024-07-05 14:00:00', 1, 75.00, 1075.00, 5, 5, 5, 5);

select *
from TransactionLog

--***************************************************************************

create table Customer
(CustomerID int primary key,
CustomerAddress1 varchar(30),
CustomerAddress2 varchar(30),
CustomerFirstName varchar(30),
CustomerMiddleInitial char(1),
CustomerLastName varchar(30),
City varchar(20),
State char(2),
ZipCode char(10),
EmailAddress varchar(40),
HomePhone char(10),
CellPhone char(10),
WorkPhone char(10),
SSN char(9),
UserLoginID smallint,
constraint Customer_UserLoginID foreign key (UserLoginID) references UserLogins(UserLoginID))

INSERT INTO Customer VALUES
(1, '123 Main St', 'Apt 1', 'John', 'A', 'Doe', 'New York', 'NY', '10001', 'john.doe@example.com', '2125550101', '9175550101', '2125550102', '123456789', 1),
(2, '456 Elm St', 'Apt 2', 'Jane', 'B', 'Smith', 'Los Angeles', 'CA', '90001', 'jane.smith@example.com', '3105550202', '3235550202', '3105550203', '987654321', 2),
(3, '789 Oak St', 'Apt 3', 'Michael', 'C', 'Brown', 'Chicago', 'IL', '60601', 'michael.brown@example.com', '3125550303', '7735550303', '3125550304', '123123123', 3),
(4, '101 Pine St', 'Apt 4', 'Emily', 'D', 'Davis', 'Houston', 'TX', '77001', 'emily.davis@example.com', '7135550404', '8325550404', '7135550405', '321321321', 4),
(5, '202 Maple St', 'Apt 5', 'David', 'E', 'Johnson', 'Phoenix', 'AZ', '85001', 'david.johnson@example.com', '6025550505', '4805550505', '6025550506', '456456456', 5);

select *
from Customer;

--***********************************************************************************

create table Customer_Account 
(AccountID int,
CustomerID int,
constraint Customer_Account_AccountID foreign key (AccountID) references Account(AccountID),
constraint Customer_Account_CustomerID foreign key (CustomerID) references Customer(CustomerID))

insert into Customer_Account values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)

select *
from Customer_Account

--*************************************************************************************

create table TransactionLog 
(TransactionID int primary key,
TransactionDate datetime,
TransactionTypeID tinyint,
TransactionAmount money,
NewBalance money,
AccountID int,
CustomerID int,
EmployeeID int,
UserLOginID smallint,
constraint TransactionLog_TransactionTypeID foreign key (TransactionTypeID) references TransactionType(TransactionTypeID),
constraint TransactionLog_AccountID foreign key (AccountID) references Account(AccountID),
constraint TransactionLog_CustomerID foreign key (CustomerID) references Customer(CustomerID),
constraint TransactionLog_EmployeeID foreign key (EmployeeID) references Employee(EmployeeID),
constraint TransactionLog_UserLoginID foreign key (UserLoginID) references UserLogins(UserLoginID))

drop table TransactionLog


create table TransactionLog 
(TransactionID int primary key,
TransactionDate datetime,
TransactionTypeID tinyint,
TransactionAmount money,
NewBalance money,
AccountID int,
CustomerID int,
EmployeeID int,
UserLOginID smallint,
constraint TransactionLog_TransactionTypeID foreign key (TransactionTypeID) references TransactionType(TransactionTypeID),
constraint TransactionLog_AccountID foreign key (AccountID) references Account(AccountID),
constraint TransactionLog_CustomerID foreign key (CustomerID) references Customer(CustomerID),
constraint TransactionLog_EmployeeID foreign key (EmployeeID) references Employee(EmployeeID),
constraint TransactionLog_UserLoginID foreign key (UserLoginID) references UserLogins(UserLoginID))

INSERT INTO TransactionLog VALUES
(1, '2024-07-01 10:00:00', 1, 100.00, 1100.00, 1, 1, 1, 1),
(2, '2024-07-02 11:00:00', 2, 50.00, 1050.00, 2, 2, 2, 2),
(3, '2024-07-03 12:00:00', 1, 200.00, 1200.00, 3, 3, 3, 3),
(4, '2024-07-04 13:00:00', 3, 150.00, 1150.00, 4, 4, 4, 4),
(5, '2024-07-05 14:00:00', 1, 75.00, 1075.00, 5, 5, 5, 5);

select *
from TransactionLog


--********************************Project_Phase2**********************************************************


-- Q1) Create a view to get all customers with checking account from ON state.

use bank1
create view onchecking1
as

select c.CustomerID, c.CustomerFirstName+ ''+c.CustomerLastName as [full name], c.State, at.AccountTypeDescription
from Customer c
	join Customer_Account ca on c.CustomerID=ca.CustomerID
	join Account a on ca.AccountID=a.AccountID
	join AccountType at on a.AccountTypeID=at.AccountTypeID
	where at.AccountTypeDescription='chequing' and c.State='ON'

select * from onchecking1
select* from Customer


--Q2) create a view to get all customers with total account balance(including interest rate) greater than 5000

create view onbalance7 
as
select c.CustomerID, 
	c.CustomerFirstName, c.CustomerLastName ,
	a.CurrentBalance, sir.InterestRateValue, 
	a.CurrentBalance * (1+ sir.InterestRateValue) as totalbalance
from Customer c
join Customer_Account ca on c.CustomerID=ca.CustomerID
join Account a on ca.AccountID=a.AccountID
join SavingInterestRates sir on a.InterestSavingsRateID=sir.InterestSavingsRateID
where a.CurrentBalance + sir.InterestRateValue > 5000

select * from onbalance7



--Q3) create a view to get counts of chequing and savings accounts by customer.

CREATE VIEW countcustomer12
AS
SELECT 
    COUNT(at.AccountTypeDescription) AS AccountTypeCount,
    c.CustomerID,
    c.CustomerFirstName + ' ' + c.CustomerLastName AS [FullName],
    at.AccountTypeDescription
FROM 
    Customer c
    JOIN Customer_Account ca ON c.CustomerID = ca.CustomerID
    JOIN Account a ON ca.AccountID = a.AccountID
    JOIN AccountType at ON a.AccountTypeID = at.AccountTypeID
WHERE 
    at.AccountTypeDescription IN ('chequing', 'saving')
GROUP BY 
    c.CustomerID, c.CustomerFirstName, c.CustomerLastName, at.AccountTypeDescription;

SELECT * FROM countcustomer12;
SELECT * FROM Customer;


--Q4) create a view to get any paticular user's login and password using AccountID

create view onuserlogin4
as

select a.AccountID, ul.UserLogin, ul.UserPassword
from Account a
join Login_Account la on a.AccountID=la.AccountID
join UserLogins ul on la.UserLoginID=ul.UserLoginID

select * from onuserlogin4
select* from UserLogins
select* from Account



--Q5) create a view to get all customers's overdraft amounts.

create view overdraftamount11
as

select c.CustomerID, c.CustomerFirstName + ' '+ c.CustomerLastName as [full name], odl.OverDraftAmount
from Customer c
join Customer_Account ca on c.CustomerID=ca.CustomerID
join Account a on ca.AccountID=a.AccountID
join OverDraftLog odl on a.AccountID=odl.AccountID
where a.CurrentBalance < 0;

select * from overdraftamount11
select* from Customer



--Q6) create a stored procedure to add "User_" as a prefix to everyone's login(username).

CREATE PROCEDURE AddPrefixToUserLogins9
AS

BEGIN
    select UserLoginID, 'User_' + UserLogin as username
	from UserLogins

END;

EXEC AddPrefixToUserLogins9;
select * from UserLogins



--Q7) create a stored procedure that accepts AccountID as a parameter and returns customer's full name.

IF EXISTS (SELECT * FROM sys.procedures WHERE NAME='spFullNameFromAccountId')
DROP PROC spFullNameFromAccountId
GO      
--By using output method
create proc spFullNameFromAccountId        
            @AccountID int,                
			                               
			@Fullname nvarchar(100) output 
as
begin
	  if (@AccountID in (select AccountID from CustomerAccount))
		  Begin
				Select @FullName= c.CustomerFirstName+' '+c.CustomerMiddleInitial+' '+c.CustomerLastName
				from Customer c
				join CustomerAccount ca
				on ca.CustomerID=c.CustomerID
				where ca.AccountID=@AccountID;
	     End
	Else 
	    Begin
		   print 'There is no account with AccountID= '+CONVERT(varchar(12),@AccountID)
	    End
End



--Q8) create a stored procedure that takes a deposite as a parameters and updates currentBalance value for that particular account

create proc depositeaccount15 @AccountID int, @DepositAmount decimal(10,2)
as
begin
	update Account
    SET CurrentBalance = CurrentBalance + @DepositAmount
    WHERE AccountID = @AccountID 
END

exec depositeaccount15 @AccountID = 1, @DepositAmount = 750.00
exec depositeaccount15 @AccountID = 2, @DepositAmount = 100.00;
select CurrentBalance from Account
where AccountID=1
select * from Account

--second way:

create proc sp_deposit4 @deposit money, @accountid int
as
if exists(select * from account where accountid=@accountid)
begin
select @accountid as [accountid], currentbalance, currentbalance+@deposit as [updatedbalance]
from account
where accountid=@accountid
end
else
begin
print 'there is no customer with id=' + convert(varchar(12), @accountid)
end

exec sp_deposit4 6000, 345
exec sp_deposit4 6000, 100


--Q9) create a stored procedure that takes a withdrawal amount as a parameter and updates currentBalance value for the particular account

create proc withdrawalamount8 @AccountID int, @WithdrawalAmount decimal(10,2)
as
begin
	update Account
    SET CurrentBalance = CurrentBalance - @WithdrawalAmount
    WHERE AccountID = @AccountID 
END
exec withdrawalamount8 @AccountID = 2, @WithdrawalAmount = 400.00
exec withdrawalamount8 @AccountID = 3, @WithdrawalAmount = 220.00
select * from Account


--Q10) Write a query to remove SSN column from customer table


alter table Customer
drop column SSN
select * from Customer








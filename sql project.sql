create database library;
use library;
create table Branch(Branch_no INT PRIMARY KEY,Manager_Id INT,Branch_address VARCHAR(30),Contact_no VARCHAR(20));
INSERT INTO Branch VALUES(1,101,'121 Main St, Barcelona','8057394702'),
						 (2,102,'314 Beach Rd, Manchester','7593752915'),
						 (3,103,'828 Market Jn, Milan','3618406482'),
						 (4,104,'101 Regent St, Madrid','7241539896'),
						 (5,105,'202 Savile Row, Liverpool','4830423794'),
						 (6,106,'303 Brick Ln, Arsenal','4862012345'),
						 (7,107,'403 Bond St, Newcastle','6589362058'),
						 (8,108,'608 Kings Rd, Arsenal','9470258281');					
select * from branch;
create table employee(Emp_Id INT PRIMARY KEY,Emp_name VARCHAR(20),Position VARCHAR(20),Salary DECIMAL(10, 2),Branch_no INT,FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));
insert into employee values(11,'Alisson','Manager',78000,1),
						   (102,'Neymar','Assistant Manager',60000,2),
						   (13,'BEN Johnson','Clerk',40000,3),
						   (14,'Eric Davis','Manager',42000,4),
						   (15,'Jamei Vardy','Manager',80000,5),
					       (106,'Salah','Assistant Manager',68000,6),
                           (17,'Solanke','Sales Manager',45000,7),
                           (18,'Casillas','Assistant Manager',62000,8);
select * from employee;
create table Books(ISBN VARCHAR(13) PRIMARY KEY,Book_title VARCHAR(30),Category VARCHAR(30),Rental_Price DECIMAL(8, 2),Status VARCHAR(5) CHECK (Status IN ('yes', 'no')),Author VARCHAR(20),Publisher VARCHAR(20));
insert into Books VALUES ('8086234567364','History of Time','History',35.00,'yes','Stephen Hawking','Penguin'),
						 ('8086876543307','Wings Of Fire','Education',25.00,'no','APJ Abdul Kalam','DC Books'),
						 ('8086928374875','Geethanjaly','Biography',30.00,'yes','R.Tagore','Print Pub'),
						 ('8086029384264','Harry Potter','Fantasy',36.00,'yes','J.K Rowling','Bloomsbury'),
						 ('8086647382907','World War II','History',28.00,'no','Chris Evans','Penguin'),
						 ('8086372837359','Hamlet','History',22.50,'yes','Shakespeare','Random House'),
						 ('8086902834895','War And Peace','History',22.00,'no','Leo Tolstoy','penguin'),
						 ('8086110837571','Lord Of Rings','History',24.50,'yes','Tolkine', 'sourone');
select * from books;
create table customer(Customer_Id INT PRIMARY KEY,Customer_name VARCHAR(25),Customer_address VARCHAR(35),Reg_date DATE);
insert into customer values(111,'Jurggen Klopp','Elplazzo,Mumbai','2021-11-15'),
						   (112,'Paul Scholes','Sunny side,Chennai','2023-05-10'),
						   (113, 'Joe Root','Le meridian,Kochi','2022-08-20'),
						   (114,'Delite','Dutt villa,Delhi','2020-02-17'),
						   (115,'Steven Gerrard','Galaxy apartments,Thrissur','2019-07-30'),
                           (116,'Andre Iniesta','Miittai theruvu,Calicut','2023-03-25'),
                           (117,'Andy Robertson','Raj classic,Banglore','2023-03-28'),
                           (118,'Aaron Ramsdale','Sunteck Signature,Kolkata','2023-03-22');
select * from customer;
create table issue_Status(Issue_Id INT PRIMARY KEY,Issued_cust INT,Issued_book_name VARCHAR(20),Issue_date DATE,Isbn_book VARCHAR(20),FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));
insert into issue_Status values (201,111,'History of Time','2023-06-10','8086234567364'),
							   (202,112,'Wings Of Fire','2023-06-15','8086876543307'),
							   (203,113,'Geethanjaly','2023-05-20','8086928374875'),
							   (204,114,'Harry Potter','2022-12-01','8086029384264'),					
							   (206,116,'Hamlet','2020-06-25','8086372837359'),
                               (207,117,'War And Peace','2023-06-19','8086902834895'),
                               (208,118,'Lord Of Rings','2023-05-01','8086110837571');
select * from issue_status;
create table returnStatus(Return_Id INT PRIMARY KEY,Return_cust INT,Return_book_name VARCHAR(255),Return_date DATE,Isbn_book2 VARCHAR(20),FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_id),FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));
insert into returnStatus values (301,111,'History of Time','2023-07-05','8086234567364'),
								(302,112,'Wings Of Fire','2023-07-09','8086876543307'),
								(303,113,'Geethanjaly','2023-06-10','8086928374875'),
								(304,114,'Harry Potter','2023-01-10','8086029384264'),
								(305,115,'World War II','2020-09-01','8086647382907'),
								(306,116,'Hamlet', '2020-07-15','8086372837359'),
                                (307,117,'War And Peace','2023-07-01','8086902834895'),
                                (308,118,'Lord Of Rings','2023-06-01','8086110837571');
select * from returnStatus;
select Book_title, Category, Rental_Price from Books where Status = 'yes';
select Emp_name, Salary from Employee order by Salary desc;
select B.Book_title, C.Customer_name from Issue_Status I JOIN Books B on I.Isbn_book = B.ISBN join Customer C on I.Issued_cust = C.Customer_Id;
select Category, COUNT(*) as Total_Books from Books group by Category;
select Emp_name, Position from Employee where Salary>50000;
select Customer_name from Customer where Reg_date < '2022-01-01' and Customer_Id not in (select Issued_cust from Issue_Status);
select Branch_no, COUNT(*) as Total_Employees from Employee group by Branch_no;
select distinct C.Customer_name from Issue_Status I join Customer C on I.Issued_cust = C.Customer_Id where Issue_date between '2023-06-01' and '2023-06-30';
select Book_title from Books where Category like '%History%';
select Branch_no, COUNT(*) as Employee_Count from Employee group by Branch_no having COUNT(*) > 5;
select E.Emp_name, B.Branch_address from Employee E join Branch B on E.Emp_Id = B.Manager_Id;
select distinct C.Customer_name from Issue_Status I join Books B on I.Isbn_book = B.ISBN join Customer C on I.Issued_cust = C.Customer_Id where B.Rental_Price > 25;


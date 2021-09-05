
drop database INVENTORY;
create database INVENTORY;

use INVENTORY;  


-- SUPPLIER TABLE CREATION
create table SUPPLIER
(SID char(5),
 SNAME varchar(30),
 SADD varchar(30),
 SCITY varchar(20),
 SPHONE char(15), 
 EMAIL varchar(40));




-- PRODUCT TABLE CREATION
create table PRODUCT
(PID char(5),
PDESC varchar(40),
PRICE float,
CATEGORY CHAR(2),
SID char (5));




-- CUSTOMER TABLE CREATION
create table CUST
(CID char(5),
 CNAME varchar(30),
 ADDRESS varchar(30),
 CITY varchar(20),
 PHONE char(15),
 EMAIL varchar(40),
 DOB date);  


 -- ORDERS TABLE CREATION
 create table ORDERS
 (OID char(5),
 ODATE date,
 CID char(5),
 PID char(5),
 OQTY int);


 -- STOCK TABLE CREATION
create table STOCK
(PID char(5),
SQTY int,
ROL int,
MOQ int);



-- ******CONSTRAINTS ON SUPPLIER TABLE*******

-- ***********************************************************

-- primary key constraint on SID   
alter table SUPPLIER
add constraint pksid primary key(sid);

alter table SUPPLIER
alter column SID char(5) not null;




-- not null constraint on SNAME
alter table SUPPLIER
alter column SNAME varchar(30) not null;


-- not null constraint on SADD
alter table SUPPLIER
alter column SADD varchar(30) not null;


-- default constraint on SCITY
alter table SUPPLIER
add constraint decity default 'DELHI' for SCITY;



-- unique constraint on SPHONE
alter table SUPPLIER
add constraint unph unique (SPHONE);


-- no constraint on email

-- ***********************************************************






-- ******CONSTRAINTS ON PRODUCT TABLE*******

-- ***********************************************************

-- primary key constraint on PID  -- it is yet to run because it is null 
alter table PRODUCT
add constraint pkpid primary key(PID);

alter table PRODUCT
alter column PID char(5) not null;


-- not null constraint on PDESC
alter table PRODUCT
alter column PDESC varchar(40) not null;



-- check constraint on PRICE
alter table PRODUCT
add constraint ckprice check (PRICE >0);



-- check constraint on CATEGORY
alter table PRODUCT
add constraint ckcategory check (CATEGORY in ('IT','HA','HC'));



-- foreign key constraint on SID  
alter table PRODUCT                           -- SHOULD BE RUN AFTER ENTERING DATA INTO BOTH THE TABLES I.E SUPPLIER AND PRODUCT
add constraint fksid foreign key (SID) references SUPPLIER(SID);


-- ***********************************************************







-- ******CONSTRAINTS ON CUSTOMER TABLE*******

-- ***********************************************************

-- primary key constraint on CID  -- it is yet to run because it is null 
alter table CUST
add constraint pkcid primary key(CID);

alter table CUST
alter column CID char(5) not null;



-- not null constraint on CNAME
alter table CUST
alter column CNAME varchar(30) not null;



-- not null constraint on ADDRESS
alter table CUST
alter column ADDRESS varchar(30) not null;


-- not null constraint on CITY
alter table CUST
alter column CITY varchar(20) not null;



-- not null constraint on PHONE
alter table CUST
alter column PHONE char(15) not null;


-- not null constraint on EMAIL
alter table CUST
alter column EMAIL varchar(40) not null;



-- check constraint on DOB
alter table CUST
add constraint ckdob check (dob <'2000-01-01');



-- ***********************************************************









-- ******CONSTRAINTS ON ORDERS TABLE*******

-- ***********************************************************

-- primary key constraint on OID  -- it is yet to run because it is null 
alter table ORDERS
add constraint pkoid primary key(OID);

alter table ORDERS
alter column OID char(5) not null;

-- no constraint on ODATE



-- foreign key constraint on CID  
alter table ORDERS                         -- SHOULD BE RUN AFTER ENTERING DATA INTO BOTH THE TABLES I.E ORDERS AND CUSTOMER
add constraint fkcid foreign key (CID) references CUST(CID);





-- foreign key constraint on PID  
alter table ORDERS                         -- SHOULD BE RUN AFTER ENTERING DATA INTO BOTH THE TABLES I.E ORDERS AND PRODUCT
add constraint fkpid foreign key (PID) references PRODUCT(PID);



-- check constraint on OQTY
alter table ORDERS
add constraint ckoqty check (OQTY >=1);


-- ***********************************************************






-- ******CONSTRAINTS ON STOCK TABLE*******

-- ***********************************************************



-- foreign key constraint on PID  
alter table STOCK                         -- SHOULD BE RUN AFTER ENTERING DATA INTO BOTH THE TABLES I.E ORDERS AND CUSTOMER
add constraint fkpidstock foreign key (PID) references PRODUCT(PID);

alter table STOCK
alter column PID char(5) not null;

-- check constraint on SQTY
alter table STOCK
add constraint cksqty check (SQTY >=0);



-- check constraint on ROL
alter table STOCK
add constraint ckrol check (ROL >0);



-- check constraint on MOQ
alter table STOCK
add constraint ckmoq check (MOQ >=5);



-- ***********************************************************



-- ******* INSERTING 10 RECORDS INTO SUPPLIER TABLE*******



insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0001','jiteshbhai','varacha surat','surat','+917651237890','jiteshpla@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0002','rohanbhai','sadhuwasvani rajkot','rajkot','+917651237891','rohanddpla@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0003','nilamben','akota bridge vadodara','Vadodara','+917651237892','nilampla@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SPHONE,EMAIL)
values ('S0004','dharmeshkumar','civil lines','+917651237893','dharmeshshpla@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0005','nirmalbhai','udhna surat','surat','+917651237894','nirmal1pla@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0006','reshmiben','MES gate jorhat','Jorhat','+917651237895','reshmichetri@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0007','yashbhai','bhatiya wankaner','wankaner','+917651237896','prajapatiyash3@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0008','rameshbhai','sector11 noida','noida','+917651237897','rameshkumar3@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0009','naitiakben','sg highway ahmedabad','ahmedabad','+917651237898','naitika3@gmail.com');


insert into SUPPLIER (SID,SNAME,SADD,SCITY,SPHONE,EMAIL)
values ('S0010','dhruvbhai','belandur bangalore','bangalore','+918849960342','dhruvvv@gmail.com');



-- ******* INSERTING 20 RECORDS INTO PRODUCT TABLE*******


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0001','hp keyboard',1400,'IT','S0001');

insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0002','legion lenovo game laptop',80000,'IT','S0002');

insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0003','dell mouse',200,'IT','S0003');

insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0004','Samsung Oven',7000,'HA','S0004');

insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0005','Onida invertor AC',30000,'HA','S0005');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0006','Prestige Cooker',1400,'HA','S0006');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0007','Powermax Treadmill',13000,'HC','S0007');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0008','BP machine',2000,'HC','S0008');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0009','vandelay pulse oximeter',1500,'HC','S0009');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0010','acupressure',600,'HC','S0010');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0011','apple macbook',119900,'IT','S0001');

insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0012','boat airdopes',1000,'IT','S0002');

insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0013','sony headphones',1500,'IT','S0003');

insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0014','Samsung 55 inch 4kuhd smarttv',54000,'HA','S0004');

insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0015','Tata Dishtv',1500,'HA','S0005');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0016','bajaj fan',1325.40,'HA','S0006');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0017','paracetomal tablets 10 strips',200,'HC','S0007');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0018','dandrof shampoo',400,'HC','S0008');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0019','cough syrup',150,'HC','S0009');


insert into PRODUCT (PID,PDESC,PRICE,CATEGORY,SID)
values ('P0020','protien X',1000,'HC','S0010');



-- ******* INSERTING 10 RECORDS INTO CUSTOMER TABLE*******


insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0001','Aditi Musunur','lokhandwala','Mumbai','+918849923456','uncle@sbcglobal.net','1995-11-01' );



insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0002','Alagesan Poduri','M.B. ROAD, SAKET','Delhi','+918849923451','hakim@optonline.net','1990-05-11');


insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0003','Asvathama Ponnada','Agara','Bangalore','+918849923452','horrocks@gmail.com','1989-01-21');


insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0004','Barsati Sandipa','keshogiri','Hyderabad','+918849923453','ukludge@icloud.com','1978-01-13');


insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0005','Debasis Sundhararajan','athwalines','Surat','+918849923454','gamma@msn.com','1978-01-06');


insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0006','Devasru Subramanyan','Ktc complex','Panaji goa','+918849923455','demmel@msn.com','1996-11-13');



insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0007','Dhritiman Salim','dhiba','Chennai','+918849923457','sakusha@yahoo.ca','1970-08-05');


insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0008','Gopa Trilochana','MES gate','Jorhat','+918849923458','mjewell@comcast.net','1960-09-15');


insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0009','Hardeep Suksma','rotang road','Manali','+918849923459','gfxguy@comcast.net','1950-12-05');


insert into CUST (CID,CNAME,ADDRESS,CITY,PHONE,EMAIL,DOB)
values ('C0010','Vijai Sritharan','dombivali','Mumbai','+918849923450','codex@optonline.net','1999-01-01');




-- ******* INSERTING 5 RECORDS INTO ORDERS TABLE*******

insert into ORDERS (OID,ODATE,CID,PID,OQTY)
values('O0001','2021-08-15','C0005','P0013',3);


insert into ORDERS (OID,ODATE,CID,PID,OQTY)
values('O0002','2020-11-13','C0010','P0018',10);


insert into ORDERS (OID,ODATE,CID,PID,OQTY)
values('O0003','2021-07-01','C0008','P0017',50);



insert into ORDERS (OID,ODATE,CID,PID,OQTY)
values('O0004','2021-01-22','C0003','P0003',20);


insert into ORDERS (OID,ODATE,CID,PID,OQTY)
values('O0005','2019-12-05','C0009','P0015',5);




-- ******* INSERTING 10 RECORDS INTO STOCK TABLE*******

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0001',50,10,8);

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0003',100,30,15);

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0006',20,8,5);

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0007',10,3,6);

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0009',500,200,100);


insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0011',30,10,10);

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0013',800,300,200);

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0015',100,20,10);

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0017',1000,400,200);

insert into STOCK (PID,SQTY,ROL,MOQ)
values('P0019',2000,500,300);


-- To view all records are inserted in there respective tables
select * from SUPPLIER;
select * from PRODUCT;
select * from CUST;
select * from ORDERS;
select * from STOCK;






-- Use of procedure to add new data into respective tables

-- 1) ADDSUPPLIER – ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE
--                  DETAILS OF THE NEW SUPPLIER ADDED, WITHOUT AUTOMATIC ID GENERATION

drop procedure ADDSUPPLIER_NAID;

create procedure ADDSUPPLIER_NAID @i as char(5) , @N AS varchar(30) , @a as varchar(30),@c as varchar(30),@ph as varchar(30),@em as varchar(30)
as
begin
     set nocount on;     -- number of records affected message will not be displayed  to the users
     insert into SUPPLIER
     values(@i,@N ,@a,@c,@ph,@em);

	 select * from SUPPLIER where sid=@i;
end;


-- 2) ADDPRO – SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE
--             DETAILS OF THE NEW PRODUCT ADDED.

drop procedure ADDPRO_NAID;

create procedure ADDPRO_NAID @i as char(5) , @pd AS varchar(30) , @pr as float ,@ca as char(2),@sid as char(5)
as
begin
     set nocount on;     -- number of records affected message will not be displayed because fof this
     insert into PRODUCT
     values(@i,@pd ,@pr,@ca,@sid);

	 select * from PRODUCT where pid=@i;
end;


-- 3) ADDCUST – SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE
--              DETAILS OF THE NEW CUSTOMER ADDED.


drop procedure ADDCUST_NAID;

create procedure ADDCUST_NAID @i as char(5) , @N AS varchar(30) , @a as varchar(30),@c as varchar(30),@ph as varchar(30),@em as varchar(30),@db as date
as
begin
     set nocount on;     -- number of records affected message will not be displayed because fof this
     insert into CUST
     values(@i,@N ,@a,@c,@ph,@em,@db);

	 select * from CUST where cid=@i;
end;




-- 4) ADDORDER – SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS
--               OF THE ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME
--               AUTOMATICALLY.

drop procedure ADDORDER_NAID;

create procedure ADDORDER_NAID @i as char(5),@cid as char(5), @pid as char(5), @q as int
as
begin
      set nocount on;
	  insert into ORDERS
	  values(@i,format(getdate(),'d'),@cid,@pid,@q);

	  select * from ORDERS where oid=@i;
end;



-- 5) ADDSTOCK – SHOULD ADD THE STOCK IN THE STOCK TABLE AND DISPLAY THE DETAILS
--               OF THE NEWLY ADDED STOCK.

drop procedure ADDSTOCK_NAID;

create procedure ADDSTOCK_NAID @pid as char(5),@sqty as int, @rol as int, @moq as int
as
begin
      set nocount on;
	  insert into STOCK
	  values(@pid,@sqty,@rol,@moq);

	  select * from STOCK where pid = @pid;
end;




-- Use of sequence to generate an int value.

-- 1) Supplier table Sequence
drop sequence myseq_suppliers;

create sequence myseq_suppliers
as int
start with 11                     -- starting with 11 because 1 enteries are already available
increment by 1;

-- Do not execute below code 
select next value for myseq_suppliers;


-- 2) products table  sequence
drop sequence myseq_products;

create sequence myseq_products
as int
start with 21
increment by 1;

-- Do not execute below code 
select next value for myseq_products;


-- 3) customer table  sequence
drop sequence myseq_customers;

create sequence myseq_customers
as int
start with 11
increment by 1;

-- Do not execute below code 
select next value for myseq_customers;


-- 4) orders table sequence
drop sequence myseq_orders;

create sequence myseq_orders
as int
start with 6
increment by 1;

-- Do not execute below code 
select next value for myseq_orders;




-- Use of function to generate IDs of all table automatically

drop function genid;

create function genid (@c as char(1), @x as int)    -- @c is a char we will give according to the table requirements
returns char(5)
as
begin
   

        declare @id as char(5);
		select @id = case
		                 when @x < 10 then concat(@c,'000',@x)
						 when @x < 100 then concat(@c,'00',@x)
						 when @x < 1000 then concat(@c,'0',@x)
						 when @x < 10000 then concat(@c,@x)
						 else
						  'null'
		end;
		return @id;
end;


-- 1) Creating procedure  to  automatic generate ID for supplier table and adding required datas into a table

drop procedure ADDSUPPLIER;

create procedure ADDSUPPLIER @N AS varchar(30) , @a as varchar(30),@c as varchar(30),@ph as varchar(30),@em as varchar(30)
as
begin
     set nocount on;     -- number of records affected message will not be displayed because fof this

	 declare @i as int;
	 declare @no as char(5);

	 set @i = (next value for myseq_suppliers);    -- It will generate next value according to the starting value
	 set @no = dbo.genid('S',@i);                  -- calling genid function here into the procedure to give respective input values

     insert into SUPPLIER
     values(@no,@N ,@a,@c,@ph,@em);

	 select * from SUPPLIER where sid=@no;        -- It will show newly added records into the table
end;




-- 2) Creating procedure  to  automatic generate ID for product table and adding required datas into a table

drop procedure ADDPRO;

create procedure ADDPRO  @pd AS varchar(30) , @pr as float ,@ca as char(2),@sid as char(5)
as
begin
     set nocount on;     -- number of records affected message will not be displayed because fof this

	 declare @i as int;
	 declare @no as char(5);

	 set @i = (next value for myseq_products);
	 set @no = dbo.genid('P',@i);


     insert into PRODUCT
     values(@no,@pd ,@pr,@ca,@sid);

	 select * from PRODUCT where pid=@no;
end;


-- 3) Creating procedure  to  automatic generate ID for customer table and adding required datas into a table

drop procedure ADDCUST;

create procedure ADDCUST  @N AS varchar(30) , @a as varchar(30),@c as varchar(30),@ph as varchar(30),@em as varchar(30),@db as date
as
begin
     set nocount on;     -- number of records affected message will not be displayed because fof this

	 declare @i as int;
	 declare @no as char(5);

	 set @i = (next value for myseq_customers);
	 set @no = dbo.genid('C',@i);


     insert into CUST
     values(@no,@N ,@a,@c,@ph,@em,@db);

	 select * from CUST where cid=@no;
end;


--4) Creating procedure  to  automatic generate ID for Order table and adding required datas into a table with a feature of getting date generated automatically
drop procedure ADDORDER;

create procedure ADDORDER @cid as char(5), @pid as char(5), @q as int
as
begin
      set nocount on;
	  
	 declare @i as int;
	 declare @no as char(5);

	 set @i = (next value for myseq_orders);
	 set @no = dbo.genid('O',@i);

	  insert into ORDERS
	  values(@no,format(getdate(),'d'),@cid,@pid,@q);

	  select * from ORDERS where oid=@no;
end;




-- TRIGGERS are used here in order and stock table.

-- When order is placed we need to do changes in stock table too because of changes in order table's quantity 

drop trigger tr_inst_ord;

create trigger tr_inst_ord
on orders
for insert
as
begin
           set nocount on;
		   declare @qr as int, @qs as int;
		   set @qr = (select oqty from inserted);      -- when we insert new record into the order table it will first go into the inserted table
		   set @qs = (select sqty from stock where pid = (select pid from inserted));  -- it will match a pid with a newly added order into inserted table with a stock table and take a sqty value into a define variable
		   
		   if @qs >=@qr                                  -- checking if stock is available or not of the respective order
		      begin

                  update stock
		          set sqty = sqty - @qr 
		          where pid = (select pid from inserted);

				  commit;                                              -- changes is permanent 
				  print('ORDER ACCEPTED');
			  end;

			else 
			  begin
			      print('INSUFFICIENT QUANTITY : ORDER REJECTED');
				
			      rollback;  -- undo previous value will not insert new quantity in order because trigger will only fire when order is inserted so thats why rollback is needed to come to previous value
			  end;
			
end;


-- to check the insert trigger is working or not

addorder 'C0008','P0009',100;




-- It will update the old value in order table with a new value in accordance with a stock quantity

drop trigger tr_up_stk;


create trigger tr_up_stk
on orders
for update
as
begin

     set nocount on;
	 declare @qr as int, @qs as int;
	 set @qr = (select oqty from inserted);
	 set @qs = (select sqty from stock where pid = (select pid from inserted));

	 if @qs >=@qr 
		      begin
                   declare @nq as int;
	               declare @oq as int;

	               set @nq = (select oqty from  inserted);
	               set @oq = (select oqty from deleted);         -- previous value of order quantity which was deleted is in the deleted table

	               update stock set sqty = sqty + @oq - @nq
	               where pid = (select pid from inserted);

				   commit;                                              -- changes is permanent 
				   print('ORDER UPDATION IS ACCEPTED');
			  end;

		else 
			  begin
			      print('INSUFFICIENT QUANTITY : ORDER REJECTED');
				  
			      rollback;  -- undo previous value will not insert new quantity in order because trigger will only fire when order is inserted so thats why rollback is needed to come to previous value
			  end;
			

end;

-- Checking update trigger is working or not

update orders set oqty = 100
where pid = 'P0013';

select * from ORDERS;
select * from STOCK;



-- WILL BE RELEASED IN THE NEXT VERSION -- CONFLICT  OF FOREIGN KEY IS OCCURING

-- delete trigger

-- create trigger tr_dell_pro
-- on product
-- for delete

--as
--begin

         --set nocount on;
		-- delete  from STOCK
		 --where pid = (select pid from deleted);

--end

--delete from PRODUCT
--where PID in  ('P0019');


-- checking remaining procedures
-- to add new product into the stock table
addstock_naid 'P0016',1000,200,100;

-- to add new customer into the cust table
addcust 'Rahul chettri','london gate','jorhat','+918845567326','prajapatiyash3@gmail.com','1998-05-13';


-- to add new product into the product table
addpro 'apple charger','500','IT','S0002';      



select * from SUPPLIER;
select * from PRODUCT;
select * from STOCK;
select * from CUST;
select * from ORDERS;




-- Use of joins to view according to our needs

-- 1) PID, PDESC, CATEGORY, SNAME, SCITY DISPLAY 

select PRODUCT.PID,PDESC,CATEGORY,SNAME,SCITY
from PRODUCT
inner join SUPPLIER
on PRODUCT.SID=SUPPLIER.SID;

--2) ) DISPLAY OID , ODATE , CNAME, CADDRESS, CPHONE, PDESC, PRICE,OQTY, AMT       


select PRODUCT.PDESC,PRICE,OID,ODATE,CNAME,CUST.ADDRESS,CUST.PHONE,OQTY
from PRODUCT
inner join ORDERS
on PRODUCT.PID=ORDERS.PID 
inner join CUST
on CUST.CID=ORDERS.CID;




-- Use of VIEW to create a bill for a user

drop view BILL;
create view BILL
as
   select ORDERS.OID,ODATE,CNAME,CUST.ADDRESS,CUST.PHONE,PDESC,PRICE,OQTY,PRICE*OQTY as 'AMOUNT'
   from PRODUCT
   inner join ORDERS
   on PRODUCT.PID=ORDERS.PID 
   inner join CUST
   on CUST.CID=ORDERS.CID;


select * from BILL;





-- NOTE:
-- there is a flaw which i am going ot solve it which is regarding procedure and sequence,
-- While executing procedure when there is some conflict sequence will get a next value irrespective of conflict so next id value generate will be not in sequence.





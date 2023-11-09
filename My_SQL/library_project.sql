drop database if exists library;

create database library;

use library;

create table publisher(
	publishername varchar(80) PRIMARY KEY,
    publisheraddress varchar(80) default null,
    publisherphone int );
    
insert into publisher (publishername, publisheraddress, publisherphone)
values
("DAW Books","375 Hudson Street, New York, NY 10014",	212-366-2000),
("Viking","375 Hudson Street, New York, NY 10014",	212-366-2000),
("Signet Books","375 Hudson Street, New York, NY 10014", 212-366-2000),
("Chilton Books", null, null),
("George Allen & Unwin","83 Alexander Ln, Crows Nest NSW 2065, Australia",	-8466),
("Alfred A. Knopf",	"The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019",	212-940-7390),
("Bloomsbury",	"Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018",	212-419-5300),
("Shinchosa",	"Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan", -12006),
("Harper and Row",	"HarperCollins Publishers, 195 Broadway, New York, NY 10007",	212-207-7000),
("Pan Books",	"175 Fifth Avenue, New York, NY 10010",	646-307-5745),
("Chalto & Windus",	"375 Hudson Street, New York, NY 10014",	212-366-2000),
("Harcourt Brace Jovanovich",	"3 Park Ave, New York, NY 10016",	212-420-5800),
("W.W. Norton",	"W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110",	212-354-5500),
("Scholastic",	"557 Broadway, New York, NY 10012",	800-724-6527),
("Bantam",	"375 Hudson Street, New York, NY 10014",	212-366-2000),
("Picador USA",	"175 Fifth Avenue, New York, NY 10010",	646-307-5745);



create table library_branch(
	library_branch_branchid int primary key auto_increment,
    library_branch_branchname varchar (80),
    library_branch_branchaddress varchar (80));
    

insert into library_branch(library_branch_branchid, library_branch_branchname, library_branch_branchaddress)
values
(1, "Sharpstown",	"32 Corner Road"),
(2, "Central",	"491 3rd Street"),
(3, "Saline",	"40 State Street"),
(4, "Ann Arbor",	"101 South University");



create table borrower(
	borrower_cardno int primary key,
    borrower_name varchar (80),
    borrowe_address varchar (80),
    borrower_phone int );
    
    
insert into borrower(borrower_cardno, borrower_name, borrowe_address, borrower_phone)
values
(100,	"Joe Smith",	"1321 4th Street, New York, NY 10014",	212-312-1234),
(101,	"Jane Smith",	"1321 4th Street, New York, NY 10014",	212-931-412),
(102,	"Tom Li",	"981 Main Street, Ann Arbor, MI 48104",	734-902-7455),
(103,	"Angela Thompson",	"2212 Green Avenue, Ann Arbor, MI 48104",313-591-2122),
(104,	"Harry Emnace",	"121 Park Drive, Ann Arbor, MI 48104",	412-512-5522),
(105,	"Tom Haverford",	"23 75th Street, New York, NY 10014",	212-631-3418),
(106,	"Haley Jackson",	"231 52nd Avenue New York, NY 10014",	212-419-9935),
(107,	"Michael Horford",	"653 Glen Avenue, Ann Arbor, MI 48104",	734-998-1513);



create table book_k(
	book_bookid INT PRIMARY KEY AUTO_INCREMENT,
    book_title varchar (70),
    book_publishername varchar (80),
	FOREIGN KEY (book_publishername)
    references publisher (publishername));
    
insert into book_k(book_bookid, book_title, book_publishername)
values
(1,	"The Name of the Wind", "DAW Books"),
(2,	"It", "Viking"),
(3,	"The Green Mile", "Signet Books"),
(4,	"Dune", "Chilton Books"),
(5,	"The Hobbit", "George Allen & Unwin"),
(6,	"Eragon", "Alfred A. Knopf"),
(7,	"A Wise Mans Fear", "DAW Books"),
(8,	"Harry Potter and the Philosophers Stone", "Bloomsbury"),
(9,	"Hard Boiled Wonderland and The End of the World", "Shinchosa"),
(10, "The Giving Tree", "Harper and Row"),
(11, "The Hitchhikers Guide to the Galaxy", "Pan Books"),
(12, "Brave New World", "Chalto & Windus"),
(13, "The Princess Bride", "Harcourt Brace Jovanovich"),
(14, "Fight Club", "W.W. Norton"),
(15, "Holes", "Scholastic"),
(16, "Harry Potter and the Chamber of Secrets", "Bloomsbury"),
(17, "Harry Potter and the Prisoner of Azkaban", "Bloomsbury"),
(18, "The Fellowship of the Ring", "George Allen & Unwin"),
(19, "A Game of Thrones", "Bantam"),
(20, "The Lost Tribe", "Picador USA");


create table authors_s ( 
	book_authors_authorID INT PRIMARY KEY AUTO_INCREMENT,
    book_authors_bookID INT,
    FOREIGN KEY (book_authors_bookID)
    references book_k (book_bookID), 
    book_authors_authorname varchar (70));
    
insert into authors_s(book_authors_authorID, book_authors_bookID, book_authors_authorname)
values 
(1, 1, "Patrick Rothfuss"),
(2, 2, "Stephen King"),
(3, 3, "Stephen King"),
(4, 4, "Frank Herbert"),
(5, 5, "J.R.R. Tolkien"),
(6, 6, "Christopher Paolini"),
(7, 6,	"Patrick Rothfuss"),
(8, 8,	"J.K. Rowling"),
(9, 9,	"Haruki Murakami"),
(10, 10,"Shel Silverstein"),
(11, 11, "Douglas Adams"),
(12, 12, "Aldous Huxley"),
(13,13,	"William Goldman"),
(14, 14, "Chuck Palahniuk"),
(15, 15, "Louis Sachar"),
(16, 16, "J.K. Rowling"),
(17,17,	"J.K. Rowling"),
(18,18,	"J.R.R. Tolkien"),
(19,19,	"George R.R. Martin"),
(20,20,	"Mark Lee");



create table book_copies(
	book_copiesid int primary key AUTO_INCREMENT,
    book_copies_bookid int,
    foreign key (book_copies_bookid)
    references book_k (book_bookid),
    book_copies_branchid int,
    foreign key (book_copies_branchid)
    references library_branch (library_branch_branchid),
    book_copies_no_of_copies int);

insert into book_copies (book_copiesid, book_copies_bookid, book_copies_branchid, book_copies_no_of_copies)
values 
(1,	1,	1,	5),
(2,	2,	1,	5),
(3,	3,	1,	5),
(4,	4,	1,	5),
(5,	5,	1,	5),
(6,	6,	1,	5),
(7,	7,	1,	5),
(8,	8,	1,	5),
(9,	9,	1,	5),
(10,10,	1,	5),
(11,11,	1,	5),
(12,12,	1,	5),
(13, 13,1,	5),
(14,14,	1,	5),
(15,15, 1,	5),
(16,16,	1,	5),
(17,17,	1,	5),
(18,18,	1,	5),
(19,19,	1,	5),
(20,20,	1,	5),
(21,1,	2,	5),
(22,2,	2,	5),
(23,3,	2,	5),
(24,4,	2,	5),
(25, 5,2,	5),
(26,6,	2,	5),
(27,7,	2,	5),
(28,8,	2,	5),
(29,9,	2,	5),
(30,10,	2,	5),
(31,11,	2,	5),
(32,12,	2,	5),
(33,13,	2,	50),
(34,14,	2,	5),
(35,15,	2,	5),
(36,16,	2,	5),
(37,17,	2,	5),
(38,18,	2,	5),
(39,19,	2,	5),
(40,20,	2,	5),
(41,1,	3,	5),
(42,2,	3,	5),
(43,3,	3,	5),
(44,4,	3,	5),
(45,5,	3,	5),
(46,6,	3,	5),
(47,7,	3,	5),
(48,8,	3,	5),
(49,9,	3,	5),
(50,10,	3,	5),
(51,11,	3,	5),
(52,12,	3,	5),
(53,13,	3,	5),
(54,14,	3,	5),
(55,15,	3,	5),
(56,16,	3,	5),
(57,17,	3,	5),
(58,18,	3,	5),
(59,19,	3,	5),
(60,20,	3,	5),
(61,1,	4,	5),
(62,2,	4,	5),
(63,3,	4,	5),
(64,4,	4,	5),
(65,5,	4,	5),
(66,6,	4,	5),
(67,7,	4,	5),
(68,8,	4,	5),
(69,9,	4,	5),
(70,10,	4,	5),
(71,11,	4,	5),
(72,12,	4,	5),
(73,13,	4,	5),
(74,14,	4,	5),
(75,15,	4,	5),
(76,16,	4,	5),
(77,17,	4,	5),
(78,18,	4,	5),
(79,19,	4,	5),
(80,20,	4,	5);



create table book_loans(
	book_loans_loansid int primary key AUTO_INCREMENT,
    book_loans_bookid int,
    foreign key (book_loans_bookid)
    references book_k (book_bookid),
    book_loans_branchid int,
    foreign key (book_loans_branchid)
    references library_branch(library_branch_branchid),
    book_loans_cardno int,
    foreign key (book_loans_cardno)
    references borrower (borrower_cardno),
    book_loans_dateout date,
    book_loans_duedate date);
insert into book_loans(book_loans_loansid, book_loans_bookid, book_loans_branchid, book_loans_cardno, 
book_loans_dateout, book_loans_duedate)
values 
(1,	1,	1,	100,'2018-01-01',	'2018-02-02'),
(2, 2,	1,	100	,'2018-01-01',	'2018-02-02'),
(3,	3,	1,	100	,'2018-01-01',	'2018-02-02'),
(4,	4,	1,	100	,'2018-01-01',	'2018-02-02'),
(5,	5,	1,	102	,'2018-03-01',	'2018-03-02'),
(6,	6,	1,	102	,'2018-03-01',	'2018-03-02'),
(7,	7,	1,	102	,'2018-03-01',	'2018-03-02'),
(8,	8,	1,	102	,'2018-03-01',	'2018-03-02'),
(9,	9,	1,	102	,'2018-03-01',	'2018-03-02'),
(10,11,	1,	102,   '2018-03-01', '2018-03-02'),
(11,	12,	2,	105	,'2017-12-12',	'2018-12-01'),
(12,	10,	2,	105	,'2017-12-12',	'2017-12-01'),
(13,	20,	2,	105	,'2018-03-02',	'2018-03-03'),
(14,	18,	2,	105	,'2018-05-01',	'2018-05-02'),
(15,	19,	2,	105	,'2018-05-01',	'2018-05-02'),
(16,	19,	2,	100	,'2018-03-01',	'2018-03-02'),
(17,	11,	2,	106	,'2018-07-01',	'2018-07-02'),
(18,	1,	2,	106	,'2018-07-01',	'2018-07-02'),
(19,	2,	2,	100	,'2018-07-01',	'2018-07-02'),
(20,	3,	2,	100	,'2018-07-01',	'2018-07-02'),
(21,	5,	2,	105	,'2017-12-12',	'2018-12-01'),
(22,	4,	3,	103	,'2018-09-01',	'2018-09-02'),
(23,	7,	3,	102	,'2018-03-01','	2018-03-02'),
(24,	17,	3,	102	,'2018-03-01','	2018-03-02'),
(25,	16,	3,	104	,'2018-03-01','	2018-03-02'),
(26,	15, 3,	104	,'2018-03-01','	2018-03-02'),
(27,	15,	3,	107	,'2018-03-01','	2018-03-02'),
(28,	14,	3,	104	,'2018-03-01','	2018-03-02'),
(29,	13,	3,	107	,'2018-03-01','	2018-03-02'),
(30,	13,	3,	102	,'2018-03-01','	2018-03-02'),
(31,	19,	3,	102	,'2017-12-12','	2018-12-01'),
(32,    20,	4,	103	,'2018-03-01','	2018-03-02'),
(33,	1,	4,	102	,'2018-12-01','	2018-12-02'),
(34,	3,	4,	107	,'2018-03-01','	2018-03-02'),
(35,	18,	4,	107	,'2018-03-02','	2018-03-03'),
(36,	12,	4,	102	,'2018-03-03','	2018-03-04'),
(37,	11,	4,	103	,'2018-03-04','	2018-03-05'),
(38,	9,	4,	103	,'2018-03-05','	2018-03-06'),
(39,	7,	4,	107	,'2018-03-06','	2018-03-07'),
(40,	4,	4,	103	,'2018-03-07','	2018-03-08'),
(41,	1,	4,	103	,'2018-03-08','	2018-03-09'),
(42,	20,	4,	103	,'2018-03-09','	2018-03-10'),
(43,	1,	4,	102	,'2018-03-10','	2018-03-11'),
(44,	3,	4,	107	,'2018-03-11','	2018-03-12'),
(45,	18,	4,	107	,'2018-03-12','	2018-03-13'),
(46,	12,	4,	102	,'2018-03-13','	2018-03-14'),
(47,	11,	4,	103	,'2018-03-14','	2018-03-15'),
(48,	9,	4,	103	,'2018-03-15','	2018-03-16'),
(49,	7,	4,	107	,'2018-03-16','	2018-03-17'),
(50,	4,	4,	103	,'2018-03-17','	2018-03-18'),
(51,	1,	4,	103	,'2018-03-18','	2018-03-19');



use library;

select * from authors_s;

select * from book_copies;

select * from book_k;

select * from book_loans;

select * from borrower;

select * from library_branch;

select * from publisher;



-- 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

select bc.book_copies_no_of_copies as no_of_copies, bk.book_title, lb.library_branch_branchname
from library_branch as lb
join book_copies as bc
on lb.library_branch_branchid = bc.book_copies_branchid
join book_k as bk
on bk.book_bookid = bc.book_copies_bookid
where (lb.library_branch_branchname = 'Sharpstown' AND bk.book_title = 'The Lost Tribe');


-- 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?

select bc.book_copies_no_of_copies, bk.book_title, lb.library_branch_branchname
from book_copies as bc
join library_branch as lb
on bc.book_copies_branchid = lb.library_branch_branchid
join book_k as bk
on bk.book_bookid = bc.book_copies_bookid
where bk.book_title = "The Lost Tribe";


-- 3. Retrieve the names of all borrowers who do not have any books checked out.

select * from borrower;


select borrower_name
from borrower
where borrower_cardno not in (select book_loans_cardno from book_loans);


-- 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, 
-- the borrower's name, and the borrower's address. 


select bk.book_title, b.borrower_name, b.borrowe_address, bl.book_loans_duedate, lb.library_branch_branchname
from book_k as bk
join book_loans as bl
on bk.book_bookid = bl.book_loans_bookid
join borrower as b
on bl.book_loans_cardno = b.borrower_cardno
join library_branch as lb
on library_branch_branchid = book_loans_branchid
where (book_loans_duedate = '2018-03-02' and library_branch_branchname = 'Sharpstown');


-- 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

select lb.library_branch_branchname, count(*) as total_no_of_books
from library_branch as lb
join book_loans as bl
on library_branch_branchid = book_loans_branchid
group by lb.library_branch_branchname;



-- 6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.

select b.borrower_name, b.borrowe_address,count(*) as no_of_books
from borrower as b 
join book_loans as bl
on b.borrower_cardno = bl.book_loans_cardno
group by b.borrower_cardno
having no_of_books > 5;


-- 7. For each book authored by "Stephen King", retrieve the title and the number of copies owned by 
-- the library branch whose name is "Central".


select a.book_authors_authorname, bk.book_title, bc.book_copies_no_of_copies, lb.library_branch_branchname
from book_k as bk
join book_copies as bc
on bk.book_bookid = bc.book_copies_bookid
join library_branch as lb
on bc.book_copies_branchid = lb.library_branch_branchid
join authors_s as a
on bk.book_bookid = a.book_authors_bookID
where (a.book_authors_authorname = "Stephen King" and lb.library_branch_branchname = "Central");







use test;  #使用test這個database 使用後若沒指定資料庫 將直接使用目前資料庫
drop table Students; #刪除students這個表格
drop table Book;
create table Students (  #新建表格
SID int(10),
Name varchar(10),
Grade int(10),
buy int(10),
primary key (SID) #主鍵
);

create table Book (  #新建表格
code int(10),#書代碼
Name varchar(10), #書名
price int(10), #價格
primary key (code) #主鍵
);

insert into Students value(1, 'Clay', 100, 1000),(2,'cla',50, 2000),(3,'hello',30, 1540),(4,'gg',30, 3500),(5,'gg',70, 9000);
insert into Book value(999, 'book1', 2000),(777,'book2',1540),(666,'book3',3500),(223,'book4',1000),(555,'book5',5400);

select P.* from (select S.SID,s.name as StudentName,b.name as BookName from Students as s, Book as b where b.price = s.buy) as P; 
#from後面如果有多個的話 好像會先做卡迪森乘積 通常搭配where做使用
#這裡我用兩筆資料 一筆是書的資料 一筆是學生資料跟購買一本書所花的錢
#比對出他們購買了哪本書

(select name from Students) union (select name from book); 
#union 為聯集的結果 需要注意的是 取的欄位名稱必須相同
#union all 為不刪除重複項 其他兩個的all也是
#except 差集 用法跟上面一樣 a 差集 b
#intersect 交集 用法與union相同 a 交集 b
#(select name from Students) except (select name from book); 
#(select name from Students) intersect (select name from book); 
#我不知道到底是出了甚麼事 為什麼我不能用

select SID from students where exists 4;
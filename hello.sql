use test;  #使用test這個database 使用後若沒指定資料庫 將直接使用目前資料庫
drop table Students; #刪除students這個表格
create table Students (  #新建表格
SID int(10),
Name varchar(10),
Grade int(10),
primary key (SID) #主鍵
);
#外來鍵寫法: foreign key (("Column name" ) references " table name" ("Column name" )
insert into Students value(1, 'Clay', 100),(2,'cla',50),(3,'hello',30),(4,'gg',30),(5,'gg',70); #新增資料

select AVG (Grade) from Students;         #求Grade平均數 從Students
select count(distinct(Grade)) from students;       #求有幾筆資料 從Students，distinct為取出不同資料
#同樣做法的還有SUM,MAX,MIN 還有以下這些數值function
#ABS(絕對值)
#CEIL(無條件進位到整數)
#floor(無條件取到整數)
#round(欄位,a) 四捨五入至小數點後第a位
#truncate(欄位,a) 無條件捨去至小數點第a位
#power(欄位,a) 求值的a次方
#mod(欄位,a) 求值mod a的值
#sign(欄位) 判定正負 正為1 負為-1
#sqrt(欄位) 開根號，也可以用power 所以我不知道他的意義在哪裡

select grade,sqrt(grade) from Students;
#-----------------------------------------------------------------------------


select Grade from Students where Grade having Grade>40; #having 用來去除不符合條件的值

select * , max(Grade) from Students group by Name; #將返還的值以Name進行分組

select * from Students where grade >20 order by grade desc limit 2; #limit 用於限制返還資料的數量 像這裡就是只返還最大的兩筆


#------------------------where的用法有點類似其他語言的if---------------------
select Grade,SID from (students) 
	where Grade>20 and SID >2 #找出Grade>40 跟 SID>3的值
	order by SID desc;  #排序 SID 從大到小
    
select Grade,SID from (students) 
	where SID in (2,3,5);   #取出SID有2,3,5的表

select Grade,SID from (Students)
	where Grade between 20 and 500  #取出介於20和500間的值
    order by SID ASC;   #從小到大排序 默認也是這個

select Name, SID from (Students)
	where Name like '%cl%' #在SQL中 %:代表不限長度 _代表限定一個字元長度 所以這裡就是 左右不設限取出含有cl的值
    order by SID;

select Avg(Grade) from (Students) 
	where Grade between 20 and 70; #平均介於20~70間的Grade
#----------------------------------------------------------------------------------


delete from Students where SID = 200; #刪除資料
select * from students; #選擇 從Students *代表全部 會直接回傳表格

alter table students drop Name;
select * from Students; 

alter table students add home varchar(20); #添加資料 改變表格students 添加 home
select * from students;



update students set home = 'Taipei' where SID = 1; #更新資料 where從SID = 1那條去改
select * from students; 

alter table students drop home; #刪除表格
select * from students; 


查询

查询所有数据库

show databases;

# DDL

查询所有数据库

> show databases；

查询当前数据库

> select database();

创建

> create database [if not exists] 数据库名 [default charset 字符集] [collate 排序规则];
>
> if not exists :如果数据库不存在则创建

删除

> drop database [if exists] 数据库名;

使用

> use 数据库名;

查询当前数据库所有表

> show tables;

查询表结构

> desc 表名;

查询指定表的建表语句

> show create table 表名;



图形化界面

![image-20230103213132978](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032131062.png)

# DQL

介绍：DQL是用来查询数据库中表的记录

关键字：==select==

语法：

```sql
select 
	字段列表
from
	表名列表
where
	条件列表
group by
	分组字段列表
having
	分组后条件列表
order by
	排序字段列表
limit
	分页参数
```

![image-20230103232214978](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032322061.png)

- 基本查询
- 条件查询（where）
- 聚合函数（count、max、min、avg、sum）
- 分组查询（gruop by）
- 排序查询（order by）
- 分页查询（limit）



## 基本查询

**查询多个字段**

```sql
select 字段1，字段2.... from 表名;

select * from 表名;
```

**设置别名**

列的别名只能在order by 中使用，不能在where中使用

```sql
select 字段1[as 别名1], 字段2[as 别名2]....  from 表名;
```

**去重复记录**

```sql
select distinct 字段列表 from 表名;
```



使用order by 对查询到的数据进行排序操作

升序：asc （默认）

降序：desc 

也可以使用列的别名，进行排序



+号的作用：

java：

- 运算符
- 连接符

mysql：

- 运算符 



concat函数：

concat拼接函数

```sql
SELECT CONCAT(`name`,author) AS "结果" from book;
```

![image-20221225164400767](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202212251644915.png)



ifnull函数：

ifnull（name，0）：如果name为null，那么name就等于0



## 条件查询

语法：

```sql
select 
	查询列表
from
	表名
where
	筛选条件;
```

分类 ：

- 按条件表达式筛选

  - 简单 条件运算符：< 	>	 =	 !=	 <> 	>= 	<=

- 按逻辑表达式筛选

  - java：&&    ||    ！
  - mysql：and	or	not

- 模糊查询

  - like

    - like不支持in的操作
    - 一般和通配符配合使用

    通配符：

    %  ：任意多个字符，包含了0个字符

    _    :  任意的单个字符

  - between   and 
  - in ：
    - 用于去判断某字段的值是否属于in列表中的某一项
    - 使用in提高语句的简洁度
    - in列表的值类型必须一致或兼容 
  - is null
    - sql语句中不能直接使用`= null`,而是要使用`is null`
    - = 或者 <> 不能用于判断null值

==is null **VS** <=>==

is null:

仅可以判断null值，可读性较高，建议使用

<=>:

既可以判断null值，又可以判断普通的数值，可读性较低

escape：在mysql中可以指定转义字符

![image-20230103213856564](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032138632.png)

![image-20230103215857927](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032158987.png)

## 聚合函数

**介绍**

将一列数据作为一个整体，进行纵向计算

**常见的聚合函数**

| 函数  | 功能     |
| ----- | -------- |
| count | 统计数量 |
| max   | 最大值   |
| min   | 最小值   |
| avg   | 平均值   |
| sum   | 求和     |

**语法**

> select 聚合函数(字段列表) from 表名

![image-20230103221527015](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032215118.png)

所有的null值不参与计算

## 分组查询

**语法**

> select 字段列表 form [where 条件] group by 分组字段名  [having 分组后过滤条件]

**where 和 having区别**

- 执行时机不同：where是分组之前进行过滤，不满足where条件，不参与分组；而having是分组之后对结果进行过滤
- 判断条件不同：where不能对聚合函数进行判断，而having可以



![image-20230103222240777](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032222836.png)

![image-20230103222256170](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032222214.png)



![image-20230103222418823](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032224894.png)



![image-20230103222740159](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032227244.png)

==注意：==

- 执行顺序：where>聚合函数>having
- 分组之后，查询的字段一般为聚合函数和分组字段，查询其他字段无任何意义

## 排序查询

语法：

> select 字段列表 from 表名 order by 字段名 [asc/desc]

升序：asc （默认）

降序：desc

## 分页查询

**语法**

> select 字段列表 from 表名 limit 起始索引，查询记录数;



==注意：==

- 起始索引从0开始，起始索引 = （查询页码-1）*每页显示记录数
- 分页查询是数据库的方言，不同的数据库有不同的实现，mysql中是 limit
- 如果查询的是第一页数据，起始索引可以省略，直接简写为 limit 10



# DCL

DCL（数据控制语言），用来管理数据库 用户、控制数据库访问权限

## 管理用户

![image-20230105164629283](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301051646592.png)

```sql
#创建用户itcast，只能够在当前主机localhost访问，密码123456；
create user 'itcast'@'localhost' identified  by '123456';
#创建用户heima，可以在任意主机访问该数据库，密码123456；
create user 'heima'@'%' identified by '123456';
#修改用户heima 的访问密码为1234；
alter user 'heima'@'%' identified with mysql_native_password by '1234';
#删除itcast@localhost用户
drop user 'itcast'@'localhost';
```



# 函数

概念：是指一段可以直接被另一段程序调用的程序或代码

例如：![image-20230105215033600](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301052150833.png)

## 字符串函数

如下是常用的几个：

| 函数                     | 功能                                                      |
| ------------------------ | --------------------------------------------------------- |
| concat(s1,s2,...,sn)     | 字符串拼接                                                |
| lower（str）             | 将字符串全部转为小写                                      |
| upper（str）             | 将字符串全部转为大写                                      |
| lpad（str,n,pad）        | 左填充，用字符串pad对str的左边进行填充，达到n个字符串长度 |
| rpad（str,n,pad）        | 右填充，用字符串pad对str的右边进行填充，达到n个字符串长度 |
| trim(str)                | 去掉字符串头部和尾部的空格                                |
| substring(str,start,len) | 返回从字符串str从start位置起的len个长度的字符串           |

```sql
-- 字符串拼接
SELECT CONCAT('hello-','world!');

-- 全部转为大写
SELECT LOWER('HELLo');

-- 左填充
SELECT LPAD('01',5,'-');

-- 右填充
SELECT RPAD('01',5,'-');

-- 去除空格
SELECT TRIM(' hello world! ')

-- 字符串截取
SELECT SUBSTRING('hello world',1,5);

```

```sql
-- 练习：
-- 员工号显示五位数
UPDATE emp set workno=LPAD(workno,5,0);
```



## 数值函数

常见的数值函数

| 函数       | 功能                               |
| ---------- | ---------------------------------- |
| ceil(x)    | 向上取整                           |
| floor(x)   | 向下取整                           |
| mod(x,y)   | 返回x/y的模                        |
| rand()     | 返回0~1内的随机数                  |
| round(x,y) | 求参数x的四舍五入的值，保留y位小数 |

```sql
-- 向上取整
SELECT CEIL(1.5);

-- 向下取整
SELECT FLOOR(1.5);

-- 返回x/y的模,相当于x除以y取余
SELECT MOD(5,4);

-- 返回0~1内的随机数
SELECT rand();

-- 求参数x的四舍五入的值，保留y位小数
SELECT ROUND(1.423223,2);
```

```	sql
-- 练习：
-- 通过数据库的函数，生成一个六位数的随机验证码
SELECT LPAD(ROUND(rand()*1000000,0),6,'0');
-- 解析：
-- rand()：生成一个随机数
-- ROUND：四舍五入，保留0位小数
-- LPAD：向左填充补齐六位数字
```

## 日期函数

| 函数                              | 功能                                              |
| --------------------------------- | ------------------------------------------------- |
| curdate()                         | 返回当前日期                                      |
| curtime()                         | 返回当前时间                                      |
| now()                             | 返回当前日期和时间                                |
| year(date)                        | 获取指定date的年份                                |
| month(date)                       | 获取指定date的月份                                |
| day(date)                         | 获取指定date日期                                  |
| date_add(date,interval expr type) | 返回一个日期/时间值加上一个时间间隔expr后的时间值 |
| datediff(date1,date2)             | 返回起始时间date1和结束时间date2之间的天数        |

```sql
-- 返回当前日期
SELECT CURDATE();

-- 返回当前时间
SELECT CURTIME();

-- 返回当前日期和时间
SELECT NOW();

-- YEAR(),MONTH(),DAY()
SELECT YEAR(NOW());
SELECT month(NOW());
SELECT day(NOW());

-- date_add(date,interval expr type)返回一个日期/时间值加上一个时间间隔expr后的时间值
SELECT DATE_ADD(NOW(),INTERVAL 70 DAY);

-- DATEDIFF 返回起始时间date1和结束时间date2之间的天数
SELECT DATEDIFF(NOW(),'2024-01-05');

```

```sql
-- 练习：
-- 查询所有员工的入职天数，并根据入职天数倒序排序
SELECT `name`,DATEDIFF(CURDATE(),entrydate) 'entrydates'
FROM emp
ORDER BY entrydates desc;
```



## 流程控制函数

流程控制函数也是很常用的一类函数，可以在sql语句中实现条件筛选，从而提高语句的效率

| 函数                                                       | 功能                                                     |
| ---------------------------------------------------------- | -------------------------------------------------------- |
| if(value,t,f)                                              | 如果value的值true，则返回t，否则返回f                    |
| ifnull(value1,value2)                                      | 如果value1不为空，返回value1，否则返回value2             |
| case when [val1] then [res1] ... else [default] end        | 如果val1位true，返回res1，...否则返回default默认值       |
| case [expr] when [val1] then [res1] ... else [defalut] end | 如果expr的值等于val1，返回res1，...否则返回defalut默认值 |

```sql
-- if(value,t,f)如果value的值true，则返回t，否则返回f
SELECT IF(TRUE,'ok','FALSE');

-- ifnull(value1,value2)如果value1不为空，返回value1，否则返回value2
SELECT IFNULL('ok','defalut');
SELECT IFNULL(NULL,'defalut');

```

```sql
-- case when [val1] then [res1] ... else [default] end如果val1位true，返回res1，...否则返回default默认值
-- 需求：查询emp表的员工姓名和工作地址（上海/北京--》一线城市，其他---》二线城市）
SELECT
	name,
	(CASE worksddress
	WHEN '北京' THEN
		'一线城市'	
  WHEN '上海' THEN
		'一线城市'
	ELSE
		'二线城市'
  END) AS '工作地址'
FROM emp;
```

结果如下：

![image-20230105225749978](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301052257080.png)

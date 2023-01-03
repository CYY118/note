

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
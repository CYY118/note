

查询

查询所有数据库

show databases;



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
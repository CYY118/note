# 1、简介

## 1.1什么是Mybatis？

![image-20220721183124155](D:\Typora\pritrue\image-20220721183124155.png)

- MyBatis 是一款优秀的**持久层框架**，
- 它支持自定义 SQL、存储过程以及高级映射。

- MyBatis 免除了几乎所有的 JDBC 代码以及设置参数和获取结果集的工作。

- MyBatis  可以通过简单的 XML 或注解来配置和映射原始类型、接口和 Java POJO（Plain Old        Java Objects，普通老式 Java 对象）为数据库中的记录

- MyBatis本是apache的一个[开源项目](https://baike.baidu.com/item/开源项目/3406069)iBatis，2010年这个[项目](https://baike.baidu.com/item/项目/477803)由apache software foundation迁移到了[google code](https://baike.baidu.com/item/google code/2346604)，并且改名为MyBatis。

- 2013年11月迁移到[Github](https://baike.baidu.com/item/Github/10145341) 

- iBATIS提供的持久层框架包括SQL Maps和Data Access Objects（DAOs）。

  

如何获取Mybatis

- maven仓库

  ```xml
  <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
  <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis</artifactId>
      <version>3.5.6</version>
  </dependency>
  
  ```

  

- Github：https://github.com/mybatis/mybatis-3/tags

- 中文文档：https://mybatis.net.cn/index.html

## 1.2、持久化

数据持久化

- 持久化就是将程序的数据在**持久状态**和**瞬时状态**转化的过程
- 内存：**断电即失**
- 数据库（jdbc），io文件持久化
- 生活中的例子：冷藏，罐头。

**为什么需要持久化？**

- 有一些对象，不能让他丢掉
- 内存太贵了

## 1.3、持久层

Dao层，Service层，Controller层

- 完成持久化工作的代码块
- 层是界限十分明显的

## 1.4、为什么需要Mybatis？

- 帮助程序员将数据存入到数据库中
- 方便
- 传统的JDBC代码太复杂了。简化，框架。自动化。
- 不用Mybatis也可以。更容易上手。小白也可以做。**技术没有高低之分**

**优点**：

- **简单易学**：本身就很小且简单。没有任何第三方依赖，最简单安装只要两个jar文件+配置几个sql映射文件。易于学习，易于使用。通过文档和源代码，可以比较完全的掌握它的设计思路和实现。

- **灵活**：mybatis不会对应用程序或者数据库的现有设计强加任何影响。 sql写在xml里，便于统一管理和优化。通过sql语句可以满足操作数据库的所有需求。

- **解除sql与程序代码的耦合**：通过提供DAO层，将业务逻辑和数据访问逻辑分离，使系统的设计更清晰，更易维护，更易单元测试。sql和代码的分离，提高了可维护性。

- **提供映射标签**，支持对象与数据库的orm字段关系映射。

- **提供对象关系映射标签**，支持对象关系组建维护。

- **提供xml标签**，支持编写动态sql。



**最重要的一点：使用的人多**

Spring、SpringMVC、SpringBoot

# 2、第一个Mybatis程序

思路：搭建环境——》导入Mybatis——》编写代码——》测试！

## 2.1、搭建环境

搭建数据库

```java
create database mybatis;
use mybatis;

create table user(
id int(20) not null primary key,
name varchar(30) default null,
pwd varchar(30) default null
)engine=InnoDB default charset=utf8;

insert into user values
(1,'洋洋','123'),
(2,'张三','123'),
(3,'李四','123');
```

新建项目

1. 新建一个普通的maven项目

2. 导入依赖

   ```java
   <?xml version="1.0" encoding="UTF-8"?>
   <project xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
       <modelVersion>4.0.0</modelVersion>
   <!--    父工程-->
       <groupId>org.example</groupId>
       <artifactId>Mybatis-Study</artifactId>
       <version>1.0-SNAPSHOT</version>
   
       <properties>
           <maven.compiler.source>8</maven.compiler.source>
           <maven.compiler.target>8</maven.compiler.target>
       </properties>
   <!--    导入依赖-->
       <dependencies>
           <!--        mysql驱动-->
           <dependency>
               <groupId>mysql</groupId>
               <artifactId>mysql-connector-java</artifactId>
               <version>8.0.17</version>
           </dependency>
           <!--        mybatis-->
           <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
           <dependency>
               <groupId>org.mybatis</groupId>
               <artifactId>mybatis</artifactId>
               <version>3.5.6</version>
           </dependency>
           <!--        junit-->
           <dependency>
               <groupId>junit</groupId>
               <artifactId>junit</artifactId>
               <version>4.12</version>
           </dependency>
       </dependencies>
   </project>
   ```

   > 123

## 2.2、创建一个模块

- 编写mybatis的核心配置文件（**mybatisConfig.xml**）

  ```java
  <?xml version="1.0" encoding="UTF-8" ?>
  <!DOCTYPE configuration
          PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
          "http://mybatis.org/dtd/mybatis-3-config.dtd">
  <!--核心配置文件-->
  <configuration>
  <!--    环境-->
      <environments default="development">
          <environment id="development">
  <!--            事务-->
              <transactionManager type="JDBC"/>
              <dataSource type="POOLED">
  <!--                属性-->
                  <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
                  <property name="url" value="jdbc:mysql://localhost:3306/mybatis?useSSL=true&amp;useUnicode=true&amp;characterEncoding=utf-8"/>
                  <property name="username" value="root"/>
                  <property name="password" value="0118"/>
              </dataSource>
          </environment>
      </environments>
  
  </configuration>
  ```

- 编写mybatis工具类(**MybatisUtils**)

```java
package com.yang.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisUtils {
    private static SqlSessionFactory sqlSessionFactory;
    static {
        try {
            //使用mybatis的第一步：获取SqlSessionFactory对象
            String resource = "mybatisConfig.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    既然有了 SqlSessionFactory，顾名思义，我们可以从中获得 SqlSession 的实例。SqlSession 提供了在数据库执行 SQL 命令所需的所有方法。
//    你可以通过 SqlSession 实例来直接执行已映射的 SQL 语句
    public static SqlSession getSqlSession(){
        return sqlSessionFactory.openSession();
    }
}

```

## 2.3、编写代码

- 实体类

  ```java
  package com.yang.pojo;
  
  //实体类
  public class User {
      private int id;
      private String name;
      private String pwd;
  
      public User() {
      }
  
      public User(int id, String name, String pwd) {
          this.id = id;
          this.name = name;
          this.pwd = pwd;
      }
  
      public int getId() {
          return id;
      }
  
      public void setId(int id) {
          this.id = id;
      }
  
      public String getName() {
          return name;
      }
  
      public void setName(String name) {
          this.name = name;
      }
  
      public String getPwd() {
          return pwd;
      }
  
      public void setPwd(String pwd) {
          this.pwd = pwd;
      }
  
      @Override
      public String toString() {
          return "User{" +
                  "id=" + id +
                  ", name='" + name + '\'' +
                  ", pwd='" + pwd + '\'' +
                  '}';
      }
  }
  
  ```

  

- Dao接口

  ```java
  package com.yang.dao;
  
  import com.yang.pojo.User;
  
  import java.util.List;
  
  public interface UserDao {
      List<User> getUserList();
  }
  
  ```

  

- 接口实现类由原来的转变为Mapper配置文件

  ```java
  <?xml version="1.0" encoding="UTF-8" ?>
  <!DOCTYPE mapper
          PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
          "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  <!--namespace:绑定一个对应的Dao/Mapper接口-->
  <mapper namespace="com.yang.dao.UserDao">
  <!--    查询语句-->
      <select id="getUserList" resultType="com.yang.pojo.User">
          select * from mybatis.user
      </select>
  </mapper>
  ```




## 2.4、测试

注意：org.apache.ibatis.binding.BindingException: Type interface com.yang.dao.UserDao is not known to the MapperRegistry.

MapperRegistry是什么？

- junit测试

  ```java
  package com.yang.dao;
  
  import com.yang.pojo.User;
  import com.yang.utils.MybatisUtils;
  import org.apache.ibatis.session.SqlSession;
  import org.junit.Test;
  
  import java.util.List;
  
  public class UserDaoTest {
      @Test
      public void test(){
          //第一步：获得SqlSession对象
          SqlSession sqlSession = MybatisUtils.getSqlSession();
          //方式一：执行SQL  getMapper 推荐使用
          UserDao userdao = sqlSession.getMapper(UserDao.class);
          List<User> userList = userdao.getUserListTwo();
          //方式二：不推荐使用
          //List<User> userList = sqlSession.selectList("com.yang.dao.UserDao.getUserList");
          for (User user : userList) {
              System.out.println(user);
          }
  
          //关闭sqlSession
          sqlSession.close();
      }
  }
  
  ```
  
  可能会遇到的问题：
  
  1. 配置文件没有注册
  2. 绑定接口错误
  3. 方法名不对
  4. 返回类型不对
  5. maven导出资源问题

![image-20220722095721027](D:\Typora\pritrue\image-20220722095721027.png)

![image-20220722100142681](D:\Typora\pritrue\image-20220722100142681.png)



# 3、CRUD

## 3.1、namespace

namespace中的包名要和Dao/Mapper接口的包名一致

## 3.2、select

选择、查询语句

- id：就是对应的namespace中的方法名
- resultType：SQL语句执行的返回值
-  parameterType：传入参数的参数类型

1. 编写接口

   ```java
       //根据id查询用户
       User getUserById(int i);
   ```

   

2. 编写对应的mapper中的sql语句

   ```xml
   <!--    根据id查询用户-->
       <select id="getUserById" parameterType="int" resultType="com.yang.pojo.User">
       select * from mybatis.user where id = #{id}
       </select>
   ```

   

3. 测试

   ```java
       //根据id查询用户
       @Test
       public void getUserById(){
           SqlSession sqlSession = MybatisUtils.getSqlSession();
   
           UserMapper mapper = sqlSession.getMapper(UserMapper.class);
           User userById = mapper.getUserById(2);
           System.out.println(userById);
   
           sqlSession.close();
       }
   ```

   

## 3.3、insert

```xml
<!--    插入用户-->
    <insert id="addUser" parameterType="com.yang.pojo.User" >
        insert into mybatis.user values(#{id},#{name},#{pwd})
    </insert>
```



## 3.4、update

```xml
<!--    修改用户-->
    <update id="updateUser" parameterType="com.yang.pojo.User">
        update mybatis.user
        set  name =#{name},pwd=#{pwd}
        where id=#{id};
    </update>
```



## 3.5、delete

```xml
<!--    删除一个用户-->
    <delete id="deleteUser" parameterType="int">
        delete from mybatis.user where id=#{id}
    </delete>
```

**注意点：**

- **增删改需要提交事务**

## 3.6、分析错误

- 标签不要匹配错
- resource绑定mapper，需要使用路径！
- 程序配置文件必须符合规范
- NullPointerException  资源没有加载进来

UserMapper.xml

![image-20220722104742287](D:\Typora\pritrue\image-20220722104742287.png)

此处必须是 “ . ” 不能用 “ / ”

mabatisConfig.xml

![image-20220722104857968](D:\Typora\pritrue\image-20220722104857968.png)

此处必须是 “ / ” 不能用 “ . ”

## 3.7、万能的Map

假设，我们的实体类，或者数据库中的表，字段或者参数过多，我们应当考虑使用Map！

例子：

- 接口

  ```java
  //    万能的Map
      int addUser2(Map<String,Object> map);
  ```

- mapper

  ```xml
  <!--    万能Map  对象中的属性,可以直接取出来,传递map的key-->
      <insert id="addUser2" parameterType="map">
          insert into mybatis.user values(#{userId},#{userName},#{userPwd})
      </insert>
  ```

- 测试

  ```java
  //    用Map增加一个用户
      @Test
      public void addUser2(){
          SqlSession sqlSession = MybatisUtils.getSqlSession();
          UserMapper mapper = sqlSession.getMapper(UserMapper.class);
          HashMap<String, Object> map = new HashMap<>();
          map.put("userId",7);
          map.put("userName","小马");
          map.put("userPwd","123456");
          int i = mapper.addUser2(map);
          System.out.println(i);
          if (i>0) {
              System.out.println("添加成功");
          }else {
              System.out.println("添加失败");
          }
          sqlSession.commit();
          sqlSession.close();
      }
  ```

  

**特点：**

- 灵活多变

例子：

- 接口

  ```java
      User getUser2(Map<String,Object> map);
  ```

- mapper

  ```xml
      <select id="getUser2" parameterType="map" resultType="com.yang.pojo.User">
          select * from user where id=#{id} and name =#{name}
      </select>
  ```

- 测试

  ```java
      @Test
      public void getUser2(){
          SqlSession sqlSession = MybatisUtils.getSqlSession();
          UserMapper mapper = sqlSession.getMapper(UserMapper.class);
          HashMap<String, Object> map = new HashMap<>();
          map.put("id",4);
          map.put("name","小兰");
  
          User user2 = mapper.getUser2(map);
          System.out.println(user2);
  
  
          sqlSession.close();
      }
  ```

- 结果

  ```java
  User{id=4, name='小兰', pwd='1233'}
  ```

  

Map传递参数，直接在sql中取出key即可！			parameterType="map"

对象传递参数，直接在sql中取对象的属性即可！		parameterType="Object"	

只有一个基本类型参数的情况下，可以直接在sql中取到

多个参数用Map，**或者注解**

## 3.8、思考题

### 模糊查询怎么写

1. java代码执行的时候，传递通配符%%

   ```java
       <select id="getUserLike" resultType="com.yang.pojo.User">
           select * from mybatis.user where name like "%"#{value}"%"
       </select>
   ```

   

2. 在sql拼接中使用通配符

   ```java
   List<User> userLike = mapper.getUserLike("%小%");
   ```

   

# 4、配置解析

## 4.1、核心配置文件

- mybatis-config.xml

- MyBatis的配置文件包含了会深深影响Mybatis行为的设置和属性信息

  ```xml
  configuration（配置）
  
      properties（属性）
      settings（设置）
      typeAliases（类型别名）
      typeHandlers（类型处理器）
      objectFactory（对象工厂）
      plugins（插件）
      environments（环境配置）
          environment（环境变量）
              transactionManager（事务管理器）
              dataSource（数据源）
      databaseIdProvider（数据库厂商标识）
      mappers（映射器）
  
  ```

  

![image-20220722150756426](D:\Typora\pritrue\image-20220722150756426.png)

![image-20220722151000642](D:\Typora\pritrue\image-20220722151000642.png)

MyBatis的默认事务管理是JDBC；默认是连接池的实现：POOLED

![image-20220722151205321](D:\Typora\pritrue\image-20220722151205321.png)

学会使用配置多套连接

## 4.2、属性（properties）

我们可以通过properties属性来实现引用配置文件

这些属性可以在外部进行配置，并可以进行动态替换。你既可以在典型的 Java 属性文件中配置这些属性，也可以在 properties 元素的子元素中设置【db.properties】

properties有一定的顺序

编写一个配置文件

db.properties

```properties
driver=com.mysql.cj.jdbc.Driver
url=jdbc:mysql://localhost:3306/mybatis?useSSL=true&amp;useUnicode=true&amp;characterEncoding=utf-8&amp;serverTimezone=GMT
username=root
password=0118
```

- 可以直接引入外部文件

- 可以在其中增加一些属性配置

- 如果两个文件有同一个字段，优先使用外部配置文件的！！

## 4.3、类型别名（typeAliases）

类型别名可为 Java 类型设置一个缩写名字。它仅用于 XML 配置，意在降低冗余的全限定类名书写。比如:

```xml
<typeAliases>
  <typeAlias alias="Author" type="domain.blog.Author"/>
  <typeAlias alias="Blog" type="domain.blog.Blog"/>
  <typeAlias alias="Comment" type="domain.blog.Comment"/>
  <typeAlias alias="Post" type="domain.blog.Post"/>
  <typeAlias alias="Section" type="domain.blog.Section"/>
  <typeAlias alias="Tag" type="domain.blog.Tag"/>
</typeAliases>
```

当这样配置时，`Blog` 可以用在任何使用 `domain.blog.Blog` 的地方。

也可以指定一个包名，MyBatis 会在包名下面搜索需要的 Java Bean，比如：        

```xml
//可以给包起别名
<typeAliases>
  <package name="domain.blog"/>
</typeAliases>
```

在实体类比较少的时候，使用第一种方式。

如果实体类十分多，建议使用第二种。

第一种可以自定义别名，第二种不能，如果非要改，需要在实体类上增加注解

```java
@Alias("author")
public class Author {
    ...
}
```



## 4.4、设置（settings）（了解）

![image-20220722180829857](D:\Typora\pritrue\image-20220722180829857.png)

## 4.5、其他配置

- [typeHandlers（类型处理器）](https://mybatis.net.cn/configuration.html#typeHandlers)

- [objectFactory（对象工厂）](https://mybatis.net.cn/configuration.html#objectFactory)

- [plugins（插件）](https://mybatis.net.cn/configuration.html#plugins)
  - MyBatis-plus

## 4.6、映射器



## 4.7、生命周期和作用域



# 日志

## 1、日志工厂



## 2、Log4j

**狂神文档**：https://mp.weixin.qq.com/s?__biz=Mzg2NTAzMTExNg%3D%3D&chksm=ce610428f9168d3ea04245107dd5057e5cbb5b4193b295f7b7ea6002f98c8b35264924186c9a&idx=1&mid=2247484043&scene=21&sn=94dbbcbca7ae17c50aa66fd78c8ecaa3#wechat_redirect

(1).log4j配置文件：log4j.properties

```properties
#将等级为DEBUG的日志信息输出到console和file这两个目的地，console和file的定义在下面的代码
log4j.rootLogger=DEBUG,console,file

#控制台输出的相关设置
log4j.appender.console = org.apache.log4j.ConsoleAppender
log4j.appender.console.Target = System.out
log4j.appender.console.Threshold=DEBUG
log4j.appender.console.layout = org.apache.log4j.PatternLayout
log4j.appender.console.layout.ConversionPattern=[%c]-%m%n

#文件输出的相关设置
log4j.appender.file = org.apache.log4j.RollingFileAppender
log4j.appender.file.File=./log/yang.log
log4j.appender.file.MaxFileSize=10mb
log4j.appender.file.Threshold=DEBUG
log4j.appender.file.layout=org.apache.log4j.PatternLayout
log4j.appender.file.layout.ConversionPattern=[%p][%d{yy-MM-dd}][%c]%m%n

#日志输出级别
log4j.logger.org.mybatis=DEBUG
log4j.logger.java.sql=DEBUG
log4j.logger.java.sql.Statement=DEBUG
log4j.logger.java.sql.ResultSet=DEBUG
log4j.logger.java.sql.PreparedStatement=DEBUG
```

(2).在mybatisConfig.xml中设置使用Log4j

```xml
<settings>
    <setting name="logImpl" value="LOG4J"/>
</settings>
```

简单使用：

1.在要使用Log4j的类中，导入包 import org.apache.log4j.Logger;

2.日志对象，参数为当前类的class



# 分页

**思考：为什么需要分页？**

在学习mybatis等持久层框架的时候，会经常对数据进行增删改查操作，使用最多的是对数据库进行查询操作，如果查询大量数据的时候，我们往往使用分页进行查询，也就是每次处理小部分数据，这样对数据库压力就在可控范围内。

## **使用limit分页**

```sql
#语法
SELECT * FROM table LIMIT stratIndex，pageSize

SELECT * FROM table LIMIT 5,10; // 检索记录行 6-15  

#为了检索从某一个偏移量到记录集的结束所有的记录行，可以指定第二个参数为 -1：   
SELECT * FROM table LIMIT 95,-1; // 检索记录行 96-last.  

#如果只给定一个参数，它表示返回最大的记录行数目：   
SELECT * FROM table LIMIT 5; //检索前 5 个记录行  
 
#换句话说，LIMIT n 等价于 LIMIT 0,n。 
```

使用MyBais实现分页，核心SQL

1.接口

```java
//分页查询
List<User> getUserByLimit(Map<String,Integer> map);
```

2.Mapper.xml

```xml
<!--    //分页实现查询-->
    <select id="getUserByLimit" parameterType="map" resultType="User">
        select * from mybatis.user limit #{startIndex},#{pageSize}
    </select>
```

3.测试

```java
//分页
@Test
public void getUserByLimit(){
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    UserMapper mapper = sqlSession.getMapper(UserMapper.class);
    HashMap<String, Integer> map = new HashMap<>();
    map.put("startIndex",3);
    map.put("pageSize",4);
    List<User> userByLimit = mapper.getUserByLimit(map);
    for (User user : userByLimit) {
        logger.info(user);
    }
    sqlSession.close();
}
```

## RowBounds分页

不再使用SQL实现分页

1.接口

```java
//分页查询2:RowBounds
List<User> getUserByRowBounds(Map<String,Integer> map);
```

2.Mapper.xml

```xml
<!--    //分页实现查询-->
<select id="getUserByRowBounds"  resultType="User">
    select * from mybatis.user
</select>
```

3.测试

```java
//分页2
@Test
public void getUserByRowBounds(){
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //RowBounds实现
    RowBounds rowBounds = new RowBounds(1, 3);
    //通过java代码方面实现分页
    List<User> list = sqlSession.selectList("com.yang.dao.UserMapper.getUserByRowBounds",null,rowBounds);
    for (User o : list) {
        logger.info(o);
    }
    sqlSession.close();
}
```

## 分页插件

插件地址：https://pagehelper.github.io/

![image-20220724100017902](H:\typora\pritrue\image-20220724100017902.png)

了解即可，万一以后提到，只需要知道它是什么东西！





> 123

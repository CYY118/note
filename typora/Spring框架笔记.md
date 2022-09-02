# 1、Spring

学习路线：

![image-20220715154249757](D:\Typora\pritrue\image-20220715154249757.png)

## 1.1、简介

Spring : 春天 --->给软件行业带来了春天

2002年，Rod Jahnson首次推出了Spring框架雏形interface21框架。

2004年3月24日，Spring框架以interface21框架为基础，经过重新设计，发布了1.0正式版。

很难想象Rod Johnson的学历 , 他是悉尼大学的博士，然而他的专业不是计算机，而是音乐学。

Spring理念 : 使现有技术更加实用 . 本身就是一个大杂烩 , 整合现有的框架技术

官网 : http://spring.io/

官方下载地址 : https://repo.spring.io/libs-release-local/org/springframework/spring/

GitHub : https://github.com/spring-projects



## 1.2、优点

1、Spring是一个开源免费的框架 , 容器  .

2、Spring是一个轻量级的框架 , 非侵入式的 .

**3、控制反转 IoC  , 面向切面 Aop**

4、对事物的支持 , 对框架的支持

.......

一句话概括：

**Spring是一个轻量级的控制反转(IoC)和面向切面(AOP)的容器（框架）。**

# 2、IOC（控制反转）理论

**原来的方式：**

1. UserDao接口
2. UserDaoImpl实现类
3. UserService业务接口
4. UserSeviceImpl业务实现类

在我们之前的业务中，用户的需求可能会影响我们原来的代码，我们需要根据用户的需求去修改源代码！如果程序的代码量十分大，修改一次的成本代价十分昂贵

例子：

我们先用我们原来的方式写一段代码 .

1、先写一个UserDao接口

```java
public interface UserDao {
    public void getUser();
}
```

2、再去写Dao的实现类

```java
public class UserDaoImpl implements UserDao {
    @Override
    public void getUser() {
        System.out.println("获取用户数据");
    }
}
```

3、然后去写UserService的接口

```java
public interface UserService {
    public void getUser();
}
```

4、最后写Service的实现类

```java
public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();

    @Override
    public void getUser() {
        userDao.getUser();
    }
}
```

5、测试一下

```java
@Test
public void test(){
    UserService service = new UserServiceImpl();
    service.getUser();
}
```

这是我们原来的方式 , 开始大家也都是这么去写的对吧 . 那我们现在修改一下 .

把Userdao的实现类增加一个 .

```java
public class UserDaoMySqlImpl implements UserDao {
    @Override
    public void getUser() {
        System.out.println("MySql获取用户数据");
    }
}
```

紧接着我们要去使用MySql的话 , 我们就需要去service实现类里面修改对应的实现

```java
public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoMySqlImpl();

    @Override
    public void getUser() {
        userDao.getUser();
    }
}
```

在假设, 我们再增加一个Userdao的实现类 .

```java
public class UserDaoOracleImpl implements UserDao {
    @Override
    public void getUser() {
        System.out.println("Oracle获取用户数据");
    }
}
```

那么我们要使用Oracle , 又需要去service实现类里面修改对应的实现 . 假设我们的这种需求非常大 , 这种方式就根本不适用了, 甚至反人类对吧 , 每次变动 , 都需要修改大量代码 . 这种设计的耦合性太高了, 牵一发而动全身 .

**那我们如何去解决呢 ?** 

我们可以在需要用到他的地方 , 不去实现它 , 而是留出一个接口 , 利用set , 我们去代码里修改下 .

```java
public class UserServiceImpl implements UserService {
    private UserDao userDao;
    // 利用set实现
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void getUser() {
        userDao.getUser();
    }
}
```

现在去我们的测试类里 , 进行测试 ;

```java
@Test
public void test(){
    UserServiceImpl service = new UserServiceImpl();
    service.setUserDao( new UserDaoMySqlImpl() );
    service.getUser();
    //那我们现在又想用Oracle去实现呢
    service.setUserDao( new UserDaoOracleImpl() );
    service.getUser();
}
```

大家发现了区别没有 ? 可能很多人说没啥区别 . 但是同学们 , 他们已经发生了根本性的变化 , 很多地方都不一样了 . 仔细去思考一下 , 以前所有东西都是由程序去进行控制创建 , 而现在是由我们自行控制创建对象 , 把主动权交给了调用者 . 程序不用去管怎么创建,怎么实现了 . 它只负责提供一个接口 .

这种思想 , 从本质上解决了问题 , 我们程序员不再去管理对象的创建了 , 更多的去关注业务的实现 . 耦合性大大降低 . 这也就是IOC的原型 !

**获得依赖对象的方式反转了。**

# 3、HelloSpring

反转：程序本身不创建对象，而变成被动的接收对象

IOC是一种编程思想

所谓的IOC，一句话：对象由Spring来创建，管理，装配！

## 3.1、IOC创建对象的方式

1. 使用无参构造创建对象，默认

2. 假设我们要使用有参构造创建对象

    1. 下标赋值

       ```java
       <!--    有参构造的第一种效果：根据下标赋值-->
           <bean id="user" class="com.yang.pojo.User">
               <constructor-arg index="0" value="根据下标赋值"/>
           </bean>		
       ```

​			2. 利用type（类型）赋值

```java
<!--    有参构造的第二种效果:利用type赋值,    不建议使用-->
    <bean id="user" class="com.yang.pojo.User">
        <constructor-arg type="java.lang.String" value="利用type赋值"/>
    </bean>
```

​			3. 参数名

```java
<!--    有参构造的第三种效果:直接通过参数名赋值-->
<bean id="user" class="com.yang.pojo.User">
   <constructor-arg name="name" value="name赋值"/>
</bean>
```

总结：在配置文件加载的时候，容器中管理的对象就已经初始化了！

# 4、Spring配置

## 4.1、别名

```xml
<!--    设置别名 若果添加了别名,就可以通过别名获取到对象-->
    <alias name="user" alias="userB"/>
```

## 4.2、Bean的配置

```java
<!--
    id:bean的唯一标识符,也就是相当于我们学的对象名
    class:bean对象所对应的权限定名:包名+类型
    name:也可以起别名,而且name 可以同时取多个别名
-->
    <bean id="userT" class="com.yang.pojo.UserT" name="userT2,u2">
        <property name="name" value="测试userT2"/>
    </bean>
```



## 4.3、Import

一般用于团队开发使用，它可以将多个配置文件，导入合并为一个

假设，现在项目中有多个人开发，这三个人负责不同的类开发，不同的类需要注册在不同的bean中，我们可以利用import将所有人的beans.xml合并为一个总的

- 张三

- 李四

- 王五

- applicationContext.xml

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <beans xmlns="http://www.springframework.org/schema/beans"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans.xsd">
  <!--    导入不同的beans.xml-->
      <import resource="beans.xml"/>
      <import resource="beans2.xml"/>
      <import resource="beans3.xml"/>
  
  
  </beans>
  ```

使用的时候，直接使用总的配置就可以了

# 5、依赖注入

## 5.1、构造器注入



## 5.2、Set方式注入【重点】

- 依赖注入：set注入！
  - 依赖：bean对象的创建依赖于容器
  - 注入：bean对象中的所有属性，由容器来注入！

【环境搭建】

1. 复杂类型

   ```java
   package com.yang.pojo;
   
   public class Address {
       private String address;
   
       public String getAddress() {
           return address;
       }
   
       public void setAddress(String address) {
           this.address = address;
       }
   }
   
   ```

   

2. 真实测试对象

   ```java
   package com.yang.pojo;
   
   import java.util.*;
   
   public class Student {
       private String name;
       private Address address;
       private String[] books;
       private List<String> hobbys;
       private Map<String,String> card;
       private Set<String> games;
       private Properties info;
       private String wife;
   
       public String getName() {
           return name;
       }
   
       public void setName(String name) {
           this.name = name;
       }
   
       public Address getAddress() {
           return address;
       }
   
       public void setAddress(Address address) {
           this.address = address;
       }
   
       public String[] getBooks() {
           return books;
       }
   
       public void setBooks(String[] books) {
           this.books = books;
       }
   
       public List<String> getHobbys() {
           return hobbys;
       }
   
       public void setHobbys(List<String> hobbys) {
           this.hobbys = hobbys;
       }
   
       public Map<String, String> getCard() {
           return card;
       }
   
       public void setCard(Map<String, String> card) {
           this.card = card;
       }
   
       public Set<String> getGames() {
           return games;
       }
   
       public void setGames(Set<String> games) {
           this.games = games;
       }
   
       public Properties getInfo() {
           return info;
       }
   
       public void setInfo(Properties info) {
           this.info = info;
       }
   
       public String getWife() {
           return wife;
       }
   
       public void setWife(String wife) {
           this.wife = wife;
       }
   
       @Override
       public String toString() {
           return "Student{" +
                   "name='" + name + '\'' +
                   ", address=" + address +
                   ", books=" + Arrays.toString(books) +
                   ", hobbys=" + hobbys +
                   ", card=" + card +
                   ", games=" + games +
                   ", info=" + info +
                   ", wife='" + wife + '\'' +
                   '}';
       }
   }
   
   ```

3. beans.xml

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <beans xmlns="http://www.springframework.org/schema/beans"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://www.springframework.org/schema/beans
          http://www.springframework.org/schema/beans/spring-beans.xsd">
       <bean  id="student" class="com.yang.pojo.Student">
   <!--        第一种:普通值注入,value-->
           <property name="name" value="张三"/>
       </bean>
   
   </beans>
   ```

4. 测试类

   ```java
   import com.yang.pojo.Student;
   import org.springframework.context.ApplicationContext;
   import org.springframework.context.support.ClassPathXmlApplicationContext;
   
   public class MyTest {
       public static void main(String[] args) {
           ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
           Student student = (Student) context.getBean("student");
           System.out.println(student.getName());
       }
   }
   
   ```

   完善注入信息

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <beans xmlns="http://www.springframework.org/schema/beans"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://www.springframework.org/schema/beans
          http://www.springframework.org/schema/beans/spring-beans.xsd">
   
       <bean id="address" class="com.yang.pojo.Address">
           <property name="address" value="中国上海"/>
       </bean>
   
       <bean  id="student" class="com.yang.pojo.Student">
   <!--        第一种:普通值注入,value-->
           <property name="name" value="张三"/>
           <!-- 第二种:bean注入,ref-->
           <property name="address" ref="address"/>
           <!-- 第三种:数组注入,-->
           <property name="books">
               <array>
                   <value>红楼梦</value>
                   <value>西游记</value>
                   <value>水浒传</value>
                   <value>三国演义</value>
               </array>
           </property>
           <!-- 第四种:List注入,-->
           <property name="hobbys">
               <list>
                   <value>听歌</value>
                   <value>敲代码</value>
                   <value>看电影</value>
               </list>
           </property>
           <!-- 第五种:Map注入,-->
           <property name="card">
               <map>
                   <entry key="身份证" value="321413254235346"/>
                   <entry key="银行卡" value="538942573289457"/>
               </map>
           </property>
           <!-- 第六种:Set注入,-->
           <property name="games">
               <set>
                   <value>LOL</value>
                   <value>COC</value>
                   <value>BOB</value>
               </set>
           </property>
           <!-- 第七种:null注入,-->
           <property name="wife">
               <null/>
           </property>
           <!-- 第八种:Properties注入,
           key=value
           key=value
           key=value
           -->
           <property name="info">
               <props>
                   <prop key="学号">2019123</prop>
                   <prop key="性别">男</prop>
                   <prop key="username">root</prop>
                   <prop key="password">123456</prop>
               </props>
           </property>
       </bean>
   
   </beans>
   ```

最终测试类

```java
import com.yang.pojo.Student;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        Student student = (Student) context.getBean("student");
        System.out.println(student.toString());
//        结果如下：
//        Student{
//        name='张三',
//        address=Address{address='中国上海'},
//        books=[红楼梦, 西游记, 水浒传, 三国演义],
//        hobbys=[听歌, 敲代码, 看电影],
//        card={身份证=321413254235346, 银行卡=538942573289457},
//        games=[LOL, COC, BOB],
//        info={
//              学号=2019123,
//              性别=男,
//              password=123456,
//              username=root
//              },
//        wife='null'
//        }


    }
}
```



## 5.3、其他方式

我们可以使用P命令空间和c命令空间进行注入

1、P命名空间注入 : 需要在头文件中加入约束文件

```xml
 导入约束 : xmlns:p="http://www.springframework.org/schema/p"
 
 <!--P(属性: properties)命名空间 , 属性依然要设置set方法-->
 <bean id="user" class="com.kuang.pojo.User" p:name="狂神" p:age="18"/>
```

2、c 命名空间注入 : 需要在头文件中加入约束文件

```xml
 导入约束 : xmlns:c="http://www.springframework.org/schema/c"

 <!--C(构造: Constructor)命名空间 , 属性依然要设置set方法-->
 <bean id="user" class="com.kuang.pojo.User" c:name="狂神" c:age="18"/>
```

发现问题：爆红了，刚才我们没有写有参构造！

解决：把有参构造器加上，这里也能知道，c 就是所谓的构造器注入！

例子：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:p="http://www.springframework.org/schema/p"
       xmlns:c="http://www.springframework.org/schema/c"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!--P(属性: properties)命名空间 , 属性依然要设置set方法-->
    <bean id="user" class="com.yang.pojo.User" p:name="p小明" p:age="22"/>


    <!--C(构造: Constructor)命名空间 , 属性依然要设置set方法-->
    <bean id="user2" class="com.yang.pojo.User" c:name="c小兰" c:age="18"/>

</beans>
```

测试：

```java
    @Test
    public void testP(){
        ApplicationContext context = new ClassPathXmlApplicationContext("userbeans.xml");
//        后面跟这个：User.class，就不用每次去强转
        User user = context.getBean("user2", User.class);
        System.out.println(user.show());

    }
```

注意点：**p命名和c命名空间不能直接使用，需要导入xml约束 !**

```xml
 导入p约束 : xmlns:p="http://www.springframework.org/schema/p"
 导入c约束 : xmlns:c="http://www.springframework.org/schema/c"
```

## 5.4、bean的作用域

![image-20220726084310826](H:\typora\pritrue\image-20220726084310826.png)

1. 单例模式（Spring默认机制）

```xml
<bean id="user2" class="com.yang.pojo.User" c:name="c小兰" c:age="18" scope="singleton"/>
```

例子：

```java
User user = context.getBean("user2", User.class);
User user2 = context.getBean("user2", User.class);
System.out.println(user==user2);
```

![image-20220726085205629](H:\typora\pritrue\image-20220726085205629.png)

**一般可以用在单线程上**



2. 原型模式

   每次从容器中get的时候都会产生一个新对象！

   ```xml
   <bean id="user2" class="com.yang.pojo.User" c:name="c小兰" c:age="18" scope="prototype"/>
   ```

例子：

```java
User user = context.getBean("user2", User.class);
User user2 = context.getBean("user2", User.class);
System.out.println(user==user2);
```

![image-20220726085320973](H:\typora\pritrue\image-20220726085320973.png)

**一般可以用在多线程上**

3. 其余的request，session，application，这些个只能在web开发中使用到！

# 6、Bean的自动装配（Autowired）

- 自动装配是Spring满足bean依赖的一种方式
- Spring会在上下文中自动寻找，并自动给bean装配属性



在Spring中有三种装配方式

1. 在xml中显示的装配
2. 在java中显示装配
3. 隐式的自动装配bean【重要】

## 6.1、测试

1. 环境搭建
   - 一个人有两个宠物

```java
package com.yang.pojo;

public class Cat {
    public void shout(){
        System.out.println("miao~~");
    }
}
```

```java
package com.yang.pojo;

public class Dog {
    public void shout(){
        System.out.println("wang~~~");
    }

}
```

```java
package com.yang.pojo;

public class People {
    private Dog dog;
    private Cat cat;
    private String name;

    public Dog getDog() {
        return dog;
    }

    public void setDog(Dog dog) {
        this.dog = dog;
    }

    public Cat getCat() {
        return cat;
    }

    public void setCat(Cat cat) {
        this.cat = cat;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "People{" +
                "dog=" + dog +
                ", cat=" + cat +
                ", name='" + name + '\'' +
                '}';
    }
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="cat" class="com.yang.pojo.Cat"/>
    <bean id="dog" class="com.yang.pojo.Dog"/>
    <bean id="people" class="com.yang.pojo.People">
        <property name="name" value="小明"/>
        <property name="dog" ref="dog"/>
        <property name="cat" ref="cat"/>
    </bean>
</beans>
```

```java
import com.yang.pojo.People;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {

    @Test
    public void test1(){
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        People people = context.getBean("people", People.class);
        people.getCat().shout();
        people.getDog().shout();

    }

}
```

结果：

![image-20220726091522725](H:\typora\pritrue\image-20220726091522725.png)

## 6.2、ByName自动装配

修改如下：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="cat" class="com.yang.pojo.Cat"/>
    <bean id="dog" class="com.yang.pojo.Dog"/>
    <bean id="people" class="com.yang.pojo.People" autowire="byName">
        <property name="name" value="小明"/>
    </bean>
</beans>
```

结果：

![image-20220726091529075](H:\typora\pritrue\image-20220726091529075.png)

如果是在样的话：

![image-20220726092243849](H:\typora\pritrue\image-20220726092243849.png)

会报错

![image-20220726092300539](H:\typora\pritrue\image-20220726092300539.png)

会自动寻找实体类中的相应的name，如下：

![image-20220726092444414](H:\typora\pritrue\image-20220726092444414.png)

## 6.3、ByType自动装配

修改为：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="cat" class="com.yang.pojo.Cat"/>
    <bean id="dog12" class="com.yang.pojo.Dog"/>
<!--
    byName: 会自动在容器上下文中查找,和自己对象set方法后面的值对应的beanid！
    byType： 会自动在容器上下文中查找，和自己对象属性类型相同的bean！
-->
    <bean id="people" class="com.yang.pojo.People" autowire="byType">
        <property name="name" value="小明"/>
    </bean>
</beans>
```



**小结：**

- byname的时候，需要保证所有bean的id唯一，并且这个bean需要和自动注入的属性的set方法的值一致
- bytype的时候，需要保证所有bean的class唯一，并且这个bean需要和自动注入的属性的类型一致

## 6.4、使用注解实现自动装配

jdk1.5支持的注解，Spring2.5开始注解

The introduction of annotation-based configuration raised the question of whether this approach is **“better” than XML**. 

要使用注解须知：

1. 导入约束：xmlns:context="http://www.springframework.org/schema/context"
2. **配置注解的支持：<context:annotation-config/>**		【**重要**】

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:context="http://www.springframework.org/schema/context"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        https://www.springframework.org/schema/context/spring-context.xsd">

    <context:annotation-config/>

</beans>
```



**@Autowired**

直接在属性上使用！也可以在set方式上使用！

使用Autowired我们可以不用编写set方法了，前提是这个自动装配的属性在IOC（Spring）容器中存在，且符合名字byname！



科普：

```xml
@Nullable 字段标记了这个注解，说明这个字段可以为null！
```



**注意：**

在xml中如果有多个对象时（有各自的名字）需要使用@Qualifier注解

**@Qualifier(value = "cat12")**：指定xml中实现的值

例子：

![image-20220726095713281](H:\typora\pritrue\image-20220726095713281.png)

![image-20220726095741336](H:\typora\pritrue\image-20220726095741336.png)

```xml
<!--    开启注解的支持-->
    <context:annotation-config/>
    <bean id="cat12" class="com.yang.pojo.Cat"/>
    <bean id="cat1" class="com.yang.pojo.Cat"/>
    <bean id="dog12" class="com.yang.pojo.Dog"/>
    <bean id="dog1" class="com.yang.pojo.Dog"/>

```

```java
    @Autowired
    @Qualifier(value = "dog12")
    private Dog dog;
    @Autowired
    @Qualifier(value = "cat12")
    private Cat cat;
    private String name;
```

如果@Autowired自动装配的环境比较复杂，自动装配无法通过一个注解【@Autowired】完成的时候，我们可以使用【 @Qualifier(value = "xxx") 】去配合【@Autowired】的使用 ，指定一个唯一的bean对象注入

**@Resource注解**

也可以实现自动装配

@Resource 和 @Autowired 的区别：

- 都是用来自动装配的，都可以放在属性字段上
- @Autowired 通过byType的方式实现，而且必须要求这个对象存在【常用】
- @Resource默认通过byname的方式实现，如果找不到名字，则通过byType实现！如果两个都找不到的情况下，就会报错！【常用】
- 执行顺序不同：

# 7、使用注解开发

在Spring4之后要使用注解开发，必须要保证aop的包导入了

![image-20220726144448826](H:\typora\pritrue\image-20220726144448826.png)

使用注解需要导入context约束，增加注解的支持！

【注解说明：

- Autowired：

- @Component：组件，放在类上说明这个类被Spring管理了，就是bean。等价于：

  <bean id="user" class="com.yang.pojo.User"/>

- 

】





1. bean



1. 属性如何注入

   ```java
   package com.yang.pojo;
   
   import org.springframework.beans.factory.annotation.Value;
   import org.springframework.stereotype.Component;
   //等价于在xml中注册了一个bean ： <bean id="user" class="com.yang.pojo.User"/>
   //@Component    组件
   @Component
   public class User {
       
       @Value("小白")    //相当于：<property name="name" value="小白"/>
       public String name;
   }
   
   ```

   

2. 衍生的注解

   @Component 有几个衍生注解，我们在web开发中，会按照mvc三层架构分层！

   - dao	【@Repository】

   - service   【@Service】

   - controller    【@Controller】

     这四个注解功能都是一样的，都是代表将某个类注册到Spring中，装配Bean

3. 自动装配

   - @Autowired：自动装配通过类型。名字
   - @Nullable：字段标记了这个注解，说明这个字段可以为Null ！
   - @Resource：自动装配通过名字。类型

4. 作用域

   - @Scope

     单例模式：singleton

     原型模式：prototype

     

5. 小结

xml与注解：

- xml更加万能，适用于任何场合！维护简单方便

- 注解 不是自己的类使用不了，维护相对复杂！

  xml与注解的最佳实践：

  - xml用来管理bean；

  - 注解只负责完成属性的注入！；

  - 我们在使用的过程中，只需要注意一个问题：必须让注解生效，就需要开启注解的支持！

    ```xml
    <!--    指定要扫描的包,这个包下的注解就会生效-->
        <context:component-scan base-package="com.yang"/>
        <context:annotation-config/>
    ```



# 8、代理模式

为什么要学习代理模式？因为这就是SpringAOP的底层！	【SpringAOP 和 SpringMVC】

**对应代码：Spring-08-proxy**

代理模式的分类：

- 静态代理
- 动态代理

![image-20220726174632767](H:\typora\pritrue\image-20220726174632767.png)

## 8.1、静态代理

角色分析：

- 抽象角色：一般会使用接口或者抽象类来解决
- 真实角色：被代理的角色
- 代理角色：代理真实，代理真实角色后，我们一般会做一些附属操作
- 客户：访问代理对象的人！

代理步骤：

1. 接口

   ```java
   //租房
   public interface Rent {
       public void rent();
   }
   
   ```

   

2. 真实角色 

   ```java
   //房东
   public class Host implements Rent{
   
       @Override
       public void rent() {
           System.out.println("房东要出租房子");
       }
   }
   
   ```

   

3. 代理角色

   ```java
   package com.yang.demo01;
   
   public class Proxy implements Rent{
   
       private Host host;
   
       public Proxy(Host host) {
           this.host = host;
       }
   
       public Proxy() {
       }
   
       @Override
       public void rent() {
           host.rent();
           seeHouse();
           heTong();
           fare();
       }
       //看房
   
       public void seeHouse(){
           System.out.println("中介带着看房");
       }
       //签合同
       public void heTong(){
           System.out.println("签租赁合同");
       }
   
   
       //收中介费
       public void fare(){
           System.out.println("收中介费");
       }
   }
   
   ```

   

4. 客户端访问代理角色

   ```java
   public class Client {
       public static void main(String[] args) {
           //房东要租房子
           Host host = new Host();
           //代理：中介代理房东租房子，但是呢？代理角色一般会有一些附属操作！
           Proxy proxy = new Proxy(host);
   
           //你不用面对房东，直接去找中介租房即可！
           proxy.rent();
       }
   }
   ```

   



代理模式的好处：

- 可以使真实角色的操作更加纯粹！不用去关注一些公共的业务
- 公共业务就交给代理角色！实现了业务的分工！
- 公共业务发生扩展的时候，方便集中管理！

缺点：

- 一个真实角色就会产生一个代理角色；代码量会翻倍~~ 开发的效率会变低！



## 8.2、加深理解

==给方法加一个日志（在不改变源代码的情况下）==

1. 接口

   ```java
   package com.yang.demo02;
   
   public interface UserService {
       public void add();
       public void delete();
       public void select();
       public void update();
   }
   
   ```

   

2. 真实角色

   ```java
   package com.yang.demo02;
   
   public class UserServiceImpl implements UserService{
       @Override
       public void add() {
           System.out.println("增加了一个用户");
       }
   
       @Override
       public void delete() {
           System.out.println("删除了一个用户");
       }
   
       @Override
       public void select() {
           System.out.println("查询到了一个用户");
       }
   
       @Override
       public void update() {
           System.out.println("修改了一个用户");
       }
   }
   
   ```

   

3. 代理角色

   ```java
   package com.yang.demo02;
   
   public class UserServiceProxy implements UserService{
       private UserServiceImpl userService;
   
       public UserServiceProxy(UserServiceImpl userService) {
           this.userService = userService;
       }
   
       public UserServiceProxy() {
       }
   
       public void setUserService(UserServiceImpl userService) {
           this.userService = userService;
       }
   
       @Override
       public void add() {
           log("add()");
           userService.add();
       }
   
       @Override
       public void delete() {
           log("delete()");
           userService.delete();
       }
   
       @Override
       public void select() {
           log("select()");
           userService.select();
       }
   
       @Override
       public void update() {
           log("update()");
           userService.update();
       }
   
       public void log(String msg){
           System.out.println("[日志]"+msg+"方法，执行了");
       }
   
   
   }
   ```

4. 客户端

   ```java
   package com.yang.demo02;
   
   public class Client {
       public static void main(String[] args) {
           UserServiceImpl userService = new UserServiceImpl();
           UserServiceProxy proxy = new UserServiceProxy();
           proxy.setUserService(userService);
           proxy.update();
   
       }
   }
   ```

   

![image-20220726183344510](H:\typora\pritrue\image-20220726183344510.png)

## 8.3、动态代理

- 动态代理和静态代理角色一样
- 动态代理的代理类使动态生成的，不是我们直接写好的！
- 动态代理分为两大类：基于接口的动态代理；基于类的动态代理
  - 基于接口-----JDK动态代理【我们在这里使用】
  - 基于类：cglib
  - java字节码实现：javasist

需要了解两个类：Proxy，InvocationHandler：调用处理程序

InvocationHandler：

动态代理的好处：

- 可以使真实角色的操作更加纯粹！，不用去关注一些公共的业务
- 公共业务就交给代理角色！实现了业务的分工！
- 公共业务发生扩展的时候，方便集中管理！
- 一个动态代理类代理的是一个接口，一般就是对应的一类业务
- 一个动态代理类可以代理多个类，只要是实现了同一个接口即可

# 9、AOP

## **9.1、什么使AOP？**

在软件业，AOP为Aspect Oriented Programming的缩写，意为：==[**面向切面编程**]==(https://baike.baidu.com/item/面向切面编程/6016335)，通过[预编译](https://baike.baidu.com/item/预编译/3191547)方式和运行期间动态代理实现程序功能的统一维护的一种技术。AOP是[OOP](https://baike.baidu.com/item/OOP)的延续，是软件开发中的一个热点，也是[Spring](https://baike.baidu.com/item/Spring)框架中的一个重要内容，是[函数式编程](https://baike.baidu.com/item/函数式编程/4035031)的一种衍生范型。利用AOP可以对业务逻辑的各个部分进行隔离，从而使得业务逻辑各部分之间的[耦合度](https://baike.baidu.com/item/耦合度/2603938)降低，提高程序的可重用性，同时提高了开发的效率。

![image-20220727112115261](H:\typora\pritrue\image-20220727112115261.png)



> Aop在Spring中的作用

提供声明式事务；允许用户自定义切面

以下名词需要了解下：

- 横切关注点：跨越应用程序多个模块的方法或功能。即是，与我们业务逻辑无关的，但是我们需要关注的部分，就是横切关注点。如**日志** , 安全 , 缓存 , 事务等等 ....
- 切面（ASPECT）：横切关注点 被模块化 的特殊对象。即，它是一个类。（log）
- 通知（Advice）：切面必须要完成的工作。即，它是类中的一个方法。  （log中的方法）
- 目标（Target）：被通知对象。
- 代理（Proxy）：向目标对象应用通知之后创建的对象。
- 切入点（PointCut）：切面通知 执行的 “地点”的定义。
- 连接点（JointPoint）：与切入点匹配的执行点。



## 9.2、使用Spring实现Aop

【重点】使用AOP织入，需要导入一个依赖包！

```xml
<!-- https://mvnrepository.com/artifact/org.aspectj/aspectjweaver -->
<dependency>
    <groupId>org.aspectj</groupId>
    <artifactId>aspectjweaver</artifactId>
    <version>1.9.4</version>
</dependency>
```

**方式一：使用Spring的API接口**

demo ：**Spring-09-aop**（E:\idea\workspace\P\01\Spring-Study\Spring-09-aop）

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/aop
       http://www.springframework.org/schema/aop/spring-aop.xsd">

<!--    注册bean-->
    <bean id="userService" class="com.yang.service.UserServiceImpl"/>
    <bean id="log" class="com.yang.log.Log"/>
    <bean id="afterLog"  class="com.yang.log.AfterLog"/>
<!--    方式一：使用原生的Spring  API接口-->
<!--    配置Aop:需要导入AOp的约束-->
    <aop:config>
<!--        切入点   expression:表达式  -->
        <aop:pointcut id="pointcut" expression="execution(* com.yang.service.UserServiceImpl.*(..))"/>
<!--        执行环绕增强-->
        <aop:advisor advice-ref="log"  pointcut-ref="pointcut"/>
        <aop:advisor advice-ref="afterLog" pointcut-ref="pointcut"/>
    </aop:config>
</beans>
```

![image-20220727165444970](H:\typora\pritrue\image-20220727165444970.png)

结果：

![image-20220727170006361](H:\typora\pritrue\image-20220727170006361.png)

**方式二：自定义类来实现AOP 【主要是切面定义】**

```xml
<!--    方式二：自定义类-->
    <bean id="diy" class="com.yang.diy.DiyPointCut"/>
    <aop:config>
<!--        自定义切面，ref要引用的类-->
        <aop:aspect ref="diy">
<!--            切入点-->
            <aop:pointcut id="point" expression="execution(* com.yang.service.UserServiceImpl.*(..))"/>
<!--            通知-->
            <aop:before method="before" pointcut-ref="point"/>
            <aop:after method="after" pointcut-ref="point"/>
        </aop:aspect>
    </aop:config>
```

结果：

![image-20220727171414321](H:\typora\pritrue\image-20220727171414321.png)



**方式三：使用注解实现**

```xml
    <bean id="annotationPointCut" class="com.yang.diy.AnnotationPointCut"/>
<!--    开启注解支持-->
    <aop:aspectj-autoproxy/>
```

```java
package com.yang.diy;

//方式三：使用注解实现

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect     //标注这个类是一个切面
public class AnnotationPointCut {
    @Before("execution(* com.yang.service.UserServiceImpl.*(..))")
    public void before(){
        System.out.println("=============方法执行前.==============");
    }

    @After("execution(* com.yang.service.UserServiceImpl.*(..))")
    public void after(){
        System.out.println("=============方法执行后....==============");
    }
    //在环绕增强中，我们可以给定一个参数，代表我们要获取处理切入的点
    @Around("execution(* com.yang.service.UserServiceImpl.*(..))")
    public void around(ProceedingJoinPoint jp) throws Throwable {
        System.out.println("环绕前");
        Signature signature = jp.getSignature();    //获得签名
        System.out.println("signature:"+signature);
        Object proceed = jp.proceed();      //执行方法
        System.out.println("环绕后");
        System.out.println(proceed);
    }
}

```

# 10、整合Mybatis

步骤：

1. 导入相关的jar包

   - junit
   - mybatis
   - mysql数据库
   - Spring相关的
   - aop植入
   - mybatis-spring【new】

   ```xml
   <dependencies>
           <dependency>
               <groupId>junit</groupId>
               <artifactId>junit</artifactId>
               <version>4.12</version>
           </dependency>
           <dependency>
               <groupId>mysql</groupId>
               <artifactId>mysql-connector-java</artifactId>
               <version>8.0.28</version>
           </dependency>
           <dependency>
               <groupId>org.mybatis</groupId>
               <artifactId>mybatis</artifactId>
               <version>3.5.5</version>
           </dependency>
           <dependency>
               <groupId>org.springframework</groupId>
               <artifactId>spring-webmvc</artifactId>
               <version>5.2.22.RELEASE</version>
           </dependency>
   <!--        Spring 操作数据库的话，还需要一个spring-jdbc-->
           <dependency>
               <groupId>org.springframework</groupId>
               <artifactId>spring-jdbc</artifactId>
               <version>5.2.22.RELEASE</version>
           </dependency>
           <dependency>
               <groupId>org.aspectj</groupId>
               <artifactId>aspectjweaver</artifactId>
               <version>1.9.4</version>
           </dependency>
           <dependency>
               <groupId>org.mybatis</groupId>
               <artifactId>mybatis-spring</artifactId>
               <version>2.0.5</version>
           </dependency>
       </dependencies>
   ```

   

2. 编写配置文档

3. 测试

## 10.1、回忆mybatis

项目：Spring-10-mybatis 【E:\idea\workspace\P\01\Spring-Study\Spring-10-mybatis】

1. 编写实体类
2. 编写核心配置文件
3. 编写接口
4. 编写Mapper.xml
5. 测试


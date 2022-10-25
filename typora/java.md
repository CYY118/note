# 一、Java

IBM			1981年   MS-DOS

施乐公司第一次发布了计算机的图形化界面

图形化界面：

==缺点==：

1.消耗内存		2.运行速度慢

常用的CMD命令

**java语言的发展**

1995年出现java语言（由Sun公司负责）

1996~2002年相继出现java（1.0）--  java（1.4）

2004年进入java（5.0）

2009年Sun公司被Oracle公司收购

2014年发布java（8.0）

2018年9月发布java（11.0）

2021年9月发布java（17.0）

## Java SE

java语言的（标准版），用于桌面应用的开发，==是其他两个版本的基础==

桌面应用

但是java SE在桌面应用领域不占优势

学习其的目的：思想

## Java ME

java语言的（小型版），用于嵌入式电子设备或者小型移动设备

嵌入式系统：电视机、摄像机、微波炉里面的系统，还有部分手机的系统（早期），现在已经逐渐被Android和IOS系统替代

## Java EE

java语言的（企业版），用于Web方向的网站开发。在这个领域，是当之无愧的No1

**网站开发**：是浏览器+服务器的开发，（java在服务器开发上占有很大的优势）

## Java能做什么？

### 1、桌面应用开发

各种税务管理软件，IDEA，Clion，Pycharm

### 2、企业级应用开发

微服务，springcloud

企业级简单来说就是开发服务器

### 3、移动应用开发

鸿蒙，android，医疗设备

### 4、科学计算

matlab

### 5、大数据开发

hadoop

### 6、游戏开发

我的世界 MineCraft

## Java为什么这么火？

- 用户量
- 与时俱进
- 自身特点
- 适用面

## Java的主要特性

- 面向对象
- 跨平台

​		Windows、Mac	、Linux		

​		C语言不是跨平台的

​		**解释型**：逐行翻译

​		**编译型：**整体翻译

- 开源

​		开源：安装包、代码			不开源：安装包

- 简单易用
- 多线程

​		多线程简单理解：就是同时做多件事情

- 安全性

## JRE和JDK

### JDK

**(Java Development kit):Java开发工具包**

1、JVM（Java Virtual Machine）：Java虚拟机，真正运行Java程序的地方

2、核心类库：java已经写好了的东西，直接拿过来用

3、开发工具：

- javac 编译工具
- java 运行工具
- jdb  调试工具
- jhat 内存分析工具
- ....

### JRE

JRE是Java运行环境

JVM，核心类库，运行工具

**JDK、JRE、JVM三者的包含关系**：

- JDK包含JRE
- JRE包含JVM

# 二、Java基础语法

## 注释

说明性的信息

```java
单行注释			//注释信息
多行注释			/*注释信息*/
文档注释			/**注释信息*/
```

## 关键字

被Java赋予了特定含义的英文单词

```tex
关键字的字母全部小写
常用的代码编辑器，对关键字有特殊颜色标记
```

例如：

class：用于创建/定义一个类，类是java的最基本的组成单元

## 字面量

数据在程序中的书写格式

**字面量类型**

| 字面量类型 | 说明                             | 举例                    |
| ---------- | -------------------------------- | ----------------------- |
| 整数类型   | 不带小数点的类型                 | 666，-98                |
| 小数类型   | 带小数点的数字                   | 13.14，-45.2            |
| 字符串类型 | 用双引号括起来的内容             | “helloWorld”            |
| 字符类型   | 用单引号括起来的，内容只能有一个 | ‘A’，‘我’，‘，’         |
| 布尔类型   | 布尔型，表示真假                 | 只有两个值：true，false |
| 空类型     | 一个特殊的值，空值               | 值是：null              |

```java
public class test{
    public static void main(String[] args){
        //常见的数据类型的书写
        //整数
        System.out.println(666);
        System.out.println(-666);
        //字符串
        System.out.println("你好");
        //字符
        System.out.println('男');
    }
}
```

制表符 :`\t` ，将字符串的长度补齐到`8`

```java
public class demo1 {
    public static void main(String[] args) {
		//        熟悉制表符的基本用法
        System.out.println("name \t age");
        System.out.println("cyy \t 18");
    }
}
```

## 变量

数据类型 变量名 = 数据值；

标识符：就是给类，方法，变量等起的名字

标识符命名规范----硬性要求

- 由数字、字母、下划线和美元符（$$）组成
- 不能以数字开头
- 不能是关键字
- 区分大小写

## 数据类型

**分为两大类**

- 基本数据类型

  数据值是存储在自己的空间中的

  - 特点：赋值给其他变量，也是赋的真实的值

- 引用数据类型

  只要是new出来的都是引用数据类型

  当一个变量存储的不是数据，而是其他空间的地址值的时候，就把其称之为引用数据类型

  ==这里的`引用`就可以理解为使用其他空间中的数据==

  - 特点：赋值给其他变量，赋的地址值



**基本数据类型**

四类八种

| 数据类型 | 关键字  | 取值范围                         | 内存占用 |
| -------- | ------- | -------------------------------- | -------- |
| 整数     | byte    | -128~127（重点）                 | 1        |
| 整数     | short   | -32768~32767                     | 2        |
| 整数     | int     | -2147483648~2147483648（10位数） | 4        |
| 整数     | long    | （19位数）                       | 8        |
| 浮点数   | float   | 小数                             | 4        |
| 浮点数   | double  | 小数                             | 8        |
| 字符     | char    | 0~65535                          | 2        |
| 布尔     | boolean | true，false                      | 1        |

整数和小数取值范围的大小关系

double>float>long>int>short>byte

```java
package java基础语法;

public class demo2 {
    public static void main(String[] args) {
//        byte
        byte b=10;
        System.out.println(b);
//        short
        short s = 20;
        System.out.println(s);
//        int
        int i=30;
        System.out.println(i);
//        long
/*        如果要定义long类型的变量
          在数据值的后面需要加一个L作为后缀
          L可以是大写的也可以是小写的，建议使用大写*/
        long l=99999999999L;
        System.out.println(l);
//        float
        /*注意点：定义float类型变量的时候
               数据值也需要加一个F来作为后缀
        * */
        float f=10.2356F;
        System.out.println(f);
//        double
        double d=20.5;
        System.out.println(d);
//        char
        char c='中';
        System.out.println(c);
//        boolean
        boolean o=true;
        System.out.println(o);
    }
}
```

![image-20221019143808383](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210191438511.png)

==注意：==

==long类型：数值后面加L==

==float类型：数值后面加F==

输出电影信息：

![image-20221019145249071](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210191452140.png)

```java
public class movie{
    public static void main(String[] args){
        String name="山楂树之恋";
        double grade=8.1;
        int year=2020;
        String nameTwo="山楂树";
        String tostar="周冬雨 窦骁 奚美娟 李雪健";
        System.out.println(name);
        System.out.println(grade);
        System.out.println(year);
        System.out.println(nameTwo);
        System.out.println(tostar);
    }
}
```

## 键盘录入

Java帮我们写好了一个类叫Scanner，这个类就可以接收键盘输入的数字

- 步骤一：导包

​		`import java.util.Scanner`

- 步骤二：创建对象

​		`Scanner sc = new Scanner(System.in);`

- 步骤三：接收数据

​		`int i = sc.nextInt();`		接收的数据类型有很多选择

```java
package java基础语法;

import java.util.Scanner;

public class demo3 {
    public static void main(String[] args) {
//        键盘录入
        Scanner scanner = new Scanner(System.in);
        String next = scanner.next();
        System.out.println(next);
    }
}

```

应用：

*键盘录入两个数字并进行求和*

```java
package java基础语法;

import java.util.Scanner;

public class demo4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入第一个数据：");
        int a=scanner.nextInt();
        System.out.println("请输入第二个数据：");
        int b=scanner.nextInt();
        int sum=a+b;
        System.out.println("a+b="+sum);
    }
}

```

## 开发工具

IDEA

业界公认目前用于java程序开发最好的工具

==*什么是集成环境？*==

*把代码编写，编译，执行，调试等多种功能综合到一起的开发工具*

# 三、运算符

运算符和表达式

- 运算符：对字面量或者变量进行操作的符号
- 表达式：用运算符把字面量或者变量连接起来，符合java语法的式子

`int sum=a+b;`

`a+b`就是表达式

## 算术运算符

| 符号 | 作用       |
| ---- | ---------- |
| +    | 加         |
| -    | 减         |
| *    | 乘         |
| /    | 除         |
| %    | 取模，取余 |

在这里就练习一下`%`

例如：10/3=3······1			（10除以3余1）

```java
package java基础语法;

public class demo5 {
    public static void main(String[] args) {
        System.out.println(10%3);
    }
}
```

![image-20221019155745334](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210191557398.png)

注意：使用除法时除数不能为0

==*练习：数值拆分*==

需求：键盘录入一个三位数$num$，将其拆分为个位，十位，百位后，打印在控制台

公式总结

- 个位：num%10

- 十位：num/10%10

- 百位：num/100%10
- 千位：num/1000%10
- ·······

```java
package java基础语法.test;

import java.util.Scanner;

public class test1 {
    public static void main(String[] args) {
//        键盘录入一个三位数，将其拆分为个位，十位，百位后，打印在控制台
//        1.键盘录入
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入一个三位数");
        int num = scanner.nextInt();
//        2.获取个位，十位，百位
        int ge=num % 10;
        int shi=num / 10 % 10;
        int bai = num /100 % 10;
        System.out.println("个位 \t 十位 \t 百位");
        System.out.println(ge+"\t"+shi+"\t"+bai);
    }
}

```

![image-20221019161634687](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210191616762.png)

*字符相加：*

执行之前先到ASCII表中查找到其对应的数字，之后再进行相加

*字符串相加：*

拼接成新的字符串

字符串只能进行加法操作

## 自增自减运算符

| 符号 | 作用 | 说明        |
| ---- | ---- | ----------- |
| ++   | 加   | 变量的值加1 |
| --   | 减   | 变量的值减1 |

两种用法：

`a++` ：先用后加

`++a`：先加后用

```java
package java基础语法;

public class demo6 {
    public static void main(String[] args) {
        int x = 10;
        int y = x++;	//x = 11 ;y = 10
        int z = ++x;	//x = 12 ;z = 12
        System.out.println("x = " + x);
        System.out.println("y = " + y);
        System.out.println("z = " + z);
    }
}
```

![image-20221019164046337](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210191640410.png)

## 赋值运算符

| 符号 | 作用       | 说明                     |
| ---- | ---------- | ------------------------ |
| =    | 赋值       | int a=10,将10赋值给变量a |
| +=   | 加后赋值   | a+=b,将a+b的值赋值给a    |
| -=   | 减后赋值   | a-=b,将a-b的值赋值给a    |
| *=   | 乘后赋值   | a*+=b,将axb的值赋值给a   |
| /=   | 除后赋值   | a/=b,将a/b的商赋值给a    |
| %=   | 取余后赋值 | a%=b,将a/b的余数赋值给a  |

*该运算符的底层隐含了一个强制类型转化的操作*

## 关系运算符

比较运算符

- ==
- !=
- \>
- \>=
- <
- <=

关系运算符的结果都是boolean，要么是true，要么是false

注意：不能把  `==`  写成 `=`

*练习：约会：*

```tex
需求：
您和您的约会对象在餐厅里面正在约会。
键盘录入两个整数，表示您和您的约会对象衣服时髦度（手动录入0~10之间的整数，不能录入其他值）
如果你的时髦程度大于你对象的时髦程度，相亲成功，输出true
否则输出false。
```

```java
package java基础语法.test;

import java.util.Scanner;

public class test2 {
    public static void main(String[] args) {
        /*需求：
        您和您的约会对象在餐厅里面正在约会。
        键盘录入两个整数，表示您和您的约会对象衣服时髦度（手动录入0~10之间的整数，不能录入其他值）
        如果你的时髦程度大于你对象的时髦程度，相亲成功，输出true
        否则输出false。*/
//        1. 键盘录入两个整数，
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入我们自己的衣服时髦度");
        int myFashion = sc.nextInt();
        System.out.println("请输入相亲对象的衣服时髦度");
        int girlFashion = sc.nextInt();
//        2 .把我衣服的时髦程度和相亲对象时髦程度进行对比
        boolean result = myFashion > girlFashion;
//        3.打印结果
        System.out.println("result = " + result);
    }
}

```

## 逻辑运算符

- &	与
- |    或
- ^    
- !      取反

***短路逻辑运算符***

| 符号 | 作用   | 说明                           |
| ---- | ------ | ------------------------------ |
| &&   | 短路与 | 结果和&相同，但是有短路效果    |
| \|\| | 短路或 | 结果和 \| 相同，但是有短路效果 |

*什么是短路效果：*

简单而言：当左边的表达式能确定最终的结果，那么右边就不会参与运行了

==注意事项==

- & |，无论左边true/false，右边都要执行

- && ||，如果左边能确定整个表达式的结果，右边不执行

- &&：左边为false，右边不管是真是假，整个表达式的结果一定是false

- ||：左边为true，右边不管是真是假，整个表达式的结果一定是true

  ==这两种情况下，右边不执行，提高了效率==

- 最为常用的：&&，||，！

*练习：数字6*

```tex
需求：数字6是一个真正伟大的数字，键盘录入两个整数。

如果其中一个为6，最终结果输出true

如果它们的和为6的倍数。最终输出true

其他情况都是false
```

```java
package java基础语法.test;

import java.util.Scanner;

public class test3 {
    public static void main(String[] args) {
        /*需求：数字6是一个真正伟大的数字，键盘录入两个整数。
        如果其中一个为6，最终结果输出true
        如果它们的和为6的倍数。最终输出true
        其他情况都是false*/

        //分析
//        1.键盘录入两个整数a ，b
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入一个整数");
        int num1 = sc.nextInt();
        System.out.println("请输入二个整数");
        int num2 = sc.nextInt();

//        2.a==6   b==6  (a+b)%6==0    满足其中一个就可以输出true
        boolean res = num1 == 6 || num2 == 6 || (num1 + num2) % 6 == 0;
        System.out.println("res = " + res);
    }
}

```

![image-20221020145725041](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210201457275.png)

## 三元运算符

作用：根据条件判断变量的值

格式：关系表达式 ？表达式1 ：表达式2；

范例：求两个数的较大值

`int max = a > b ? a : b; `

```java
package java基础语法;

public class demo8 {
    public static void main(String[] args) {
        //    需求：获取两个数的较大值
        int a=10;
        int b=20;
        System.out.println("masx"+(a>b?a:b));
    }
}

```

*计算规则*

- 首先计算关系表达式的值
- 如果值为true，表达式1的值就是运算结果
- 如果值为false，表达式2的值就是运算结果



==运算符优先级：小括号优先于所有==

# 四、流程控制语句

通过一些语句，来控制程序运行

## 顺序执行

程序的默认执行顺序（从上到下）

## 分支结构

### if

*格式一*

```java
if (关系表达式){
    语句体；
}
```

*格式二*

```java
if(关系表达式){
    语句体1;
}else{
    语句体2;
}
```

*格式三*

```java
if(关系表达式1){
    语句体1;
}else if (关系表达式2){
    语句体2;
}
	······
 else{
     语句体n+1;
 }
```

### switch

*格式*

```java
switch(表达式){
    case 值1:
        语句体1;
        break;
    case 值2:
        语句体2;
        break;
    ······
    default:
        语句体n+1;
        break;
}
```

*执行流程*

1. 首先计算表达式的值
2. 依次和case后面的值进行比较，如果有对应的值，就会执行相应的语句，在执行的过程中，遇到break就会结束。
3. 如果所有的case后面的值和表达式的值都不匹配 就会执行default里面的语句体，然后结束整个switch

*格式说明*

- case：后面跟的是要和表达式进行比较的值（被匹配的值）
- break：表示中断，结束的意思，用来结束switch语句。
- default：表示所有情况都不匹配的时候，就执行该处的内容，和if语句的else相似
- case后面的值只能是字面量，不能是变量
- case给出的值不允许重复

*练习：吃面*

```java
package 流程控制;

public class demo1 {
    public static void main(String[] args) {
//        拉面、热干面、炸酱面、油泼面
//        1.定义变量记录想吃的面
        String noodles="炸酱面";
//        2.利用swict进行匹配
        switch (noodles){
            case "拉面":
                System.out.println("我想吃拉面");
                break;
            case "热干面":
                System.out.println("我想吃热干面");
                break;
            case "炸酱面":
                System.out.println("我想吃炸酱面");
                break;
            case "油泼面":
                System.out.println("我想吃油泼面");
                break;
            default:
                System.out.println("错误");
        }
    }
}
```

![image-20221020170117558](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210201701664.png)

*switch的其他知识点*

- default的位置和省略

  - default可以省略，语法上不会有问题，但是不建议省略

  - default的位置不一定写在最下面，我们可以写在任何位置，只不过习惯会写在下面

- case穿透

  - 语句体中如果将break省略，就会导致case穿透，
  - 会使每个case都会执行直到遇到break或者右大括号为止
  - 使用场景：如果多个case的语句体重复了，那么我们考虑利用case穿透去简化代码。

- switch新特性

  - 在JDK12中才具备的，JDK12以下版本的不具备该特性

  ```java
  int number=1;
  switch(number){
          case 1 ->{
              System.out.println("一")
          }
          case 2 ->{
              System.out.println("二")
          }
          case 3 ->{
              System.out.println("三")
          }
          default ->{
              System.out.println("没有该选项")
          }
  }
  ```

  - 如果大括号里面只有一行代码的话，就可以把大括号去掉

- switch和if的第三种格式各自的使用场景

  - if的第三种格式，一般用于范围的判断
  - switch是把有限个数据一一列举出来，再进行选择

### for

格式

```java
for(初始化语句; 条件判断语句; 条件控制语句){
    循环体语句;
}
```

*执行流程*

1. 执行初始化语句
2. 执行条件判断语句，看起结果是true还是false
   - 如果是false，循环结束
   - 如果是true，执行循环体语句
3. 执行条件控制语句
4. 回到 `2` 继续执行条件判断语句

*注意*

- 初始化语句只执行一次

练习：打印5次 `Hello,world`

```java
public class demo{
    public static void main(String[] args){
        for(int i=0;i<5;i++){
            System.out.println("Hello,world");
        }
    }
}
```

*倒着打印1-5*

```java
public class demo{
    public static void main(String[] args){
        for(int i=5;i>=1;i--){
            System.out.println(i);
        }
    }
}
```

*练习：断线重连*

```tex
在实际开中，需要重复执行的代码，会选择循环实现

例如：玩游戏的时候，如果网不好那么会经常断线重连。那么断线重连这个业务逻辑就需要重复执行。假设现在公司要求，断线重连的业务逻辑最多只写5次。请用代码实现

备注：断线重连的业务逻辑可以使用输出语句代替
```

```java
public class demo{
        public static void main(String[] args){
        for(int i=1;i<5;i++){
            System.out.println("第"+i+"次执行断线重连的业务逻辑");
        }
    }
}
```

*练习：求和*

需求：求1-5之间的和

```java
public class demo{
    public static void main(String[] args){
        //分析
        //1.循环1~5得到里面的每一个数字
        int sum=0;
        for(int i=0;i<5;i++){
            //sum=sum+i;
            sum+=i;
        }
        System.out.println("和为："+sum);
    }
}
```

*注意：*

- 如果把`int sum=0;`定义在循环的里面，会报错（原因是作用域不同）

*练习：求和*

需求：求1-100之间的偶数和

```java
package 流程控制.test;

public class test1 {
    public static void main(String[] args) {
//        求1-100之间的偶数和
        int sum=0;
        for (int i = 1; i <= 100; i++) {
            if(i % 2 == 0){
                sum+=i;
            }
        }
        System.out.println("sum = " + sum);
    }
}
```

![image-20221020220450118](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210202204225.png)

*练习：*

需求：键盘录入两个数字，表示一个范围。统计这个范围中，既能被3整除，又能被5整除的数字有多少个？

```java
package 流程控制.test;

import java.util.Scanner;

public class test2 {
    public static void main(String[] args) {
//        需求：键盘录入两个数字，表示一个范围。统计这个范围中，既能被3整除，又能被5整除的数字有多少个？
//        分析
//        1.键盘录入两个数字
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入第一个数字");
        int num1 = sc.nextInt();    //定义开始条件
        System.out.println("请输入第二个数字");
        int num2 = sc.nextInt();    //定义结束条件
//        2.利用循环获取这个范围中的数字
        int count=0;    //统计个数
        for (int i = num1; i < num2; i++) {
            if (i % 3 == 0 && i % 5 == 0){
                //        3.对一个数字进行判断
                System.out.println(i);
                count++;
            }
        }
        System.out.println("满足条件的总共的有"+count);
    }
}

```

![image-20221020221827479](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210202218573.png)

### while

*格式*

```java
初始化语句;
while(条件判断语句){
    循环体语句;
    条件控制语句;
}
```

*举例*

```java
package 流程控制;

public class demo2 {
    public static void main(String[] args) {
        int i=1;
        while (i<=100){
            System.out.println(i);
            i++;
        }
    }
}
```

**for和while的区别：**

- for循环中：知道循环的次数或者循环的范围
- while循环中：不知道循环的次数和范围，只知道循环的结束条件

*案例：打印折纸的次数*

```tex
需求：世界最高的山峰是珠穆朗玛峰（8844.43米=8844430毫米），假如我有一张足够大的纸，它的厚度是0.1毫米。请问，我折叠多少次，可以折成珠穆朗玛峰的高度？
```

```java
package 流程控制.test;

public class test3 {
    public static void main(String[] args) {
//        需求：世界最高的山峰是珠穆朗玛峰（8844.43米=8844430毫米），
//        假如我有一张足够大的纸，它的厚度是0.1毫米。请问，我折叠多少次，可以折成珠穆朗玛峰的高度？
//        分析：折叠纸张;每次折叠纸张的厚度都是原先的两倍
//        1.定一个变量用来记录山峰的高度
        double height=8844430;
//        2.定义一个变量用来记录纸张的起始厚度
        double paper=0.1;
//        3.定义一个变量用来统计次数
        int count=0;
//        4.循环折叠纸张，只要纸张的厚度小于山峰的高度，那么循环就继续
//        每折叠一次。统计次数就要++
        while (paper<height){
//            折叠纸张
//            paper=paper * 2;
            paper*=2;
//            折叠一次，就++一次
            count++;
        }
//        输出结果
        System.out.println("count = " + count);
    }
}

```

![image-20221020224230917](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210202242007.png)

*案例：回文数*

```tex
需求：给你一个整数 x，如果 x 是一个回文整数，打印true，否则，返回false。

解释：回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

例如：121是回文，而123不是
```

```java
package 流程控制.test;

public class test4 {
    public static void main(String[] args) {
        /*需求：给你一个整数 x，如果 x 是一个回文整数，打印true，否则，返回false。

        解释：回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

        例如：121是回文，而123不是*/
//        核心思路：把数字倒过来跟原来的数字进行比较
/*//        1.定义数字
        //原始写法
        int x=121;
//        2.获取位数
        int ge = x % 10;
        int shi = x / 10 % 10;
        int bai = x / 100 % 10;
//        拼接
        int res=ge*100 + shi*10 + bai;
        System.out.println("res = " + res);
        System.out.println("该数是否是回文数："+(x==res));*/
        
//        使用循环
//        1.定义数字
        int x=121121;
//        定义一个临时变量用于记录x原来的值
        int temp=x;
//        用于记录x倒过来后的值
        int num = 0;
//        利用循环开始
        while (x != 0){
//            从左往右获取每一位数字
            int ge = x % 10;
//            修改一下x记录的值
            x = x / 10;
//            把当前获取到的数字拼接到最右边
            num = num * 10 +ge;
//            System.out.println("x = " + x);
        }
//        3.打印
        System.out.println("num = " + num);
        System.out.println("x = " + x);
        System.out.println("temp = " + temp);
        System.out.println("该数是否是回文数："+(temp==num));
    }
}
```

![image-20221020230805247](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210202308344.png)

*练习：*

```tex
需求：给定两个整数，被除数和除数（都是正数，且不超过int的范围），将两个数相除，要求不使用乘法‘除法和%运算符,得到商和余数
```

分析：

被除数 / 除数 = 商······余数

int a=100;

int b=10;

100-10=90;

90-10=80;

····

10-10=0 (余数)

```java
package 流程控制.test;

public class test5 {
    public static void main(String[] args) {
//        需求：给定两个整数，被除数和除数（都是正数，且不超过int的范围），
//        将两个数相除，要求不使用乘法‘除法和%运算符,得到商和余数
//        1.定义变量记录被除数
        int dividend=4562;
//        2.定义变量记录除数
        int divisor=456;
//        定义一个变量用于统计相减了多少次
        int count=0;
//        3.循环while
//        在循环中，不断用被除数-除数，只要被除数是大于等于除数的，那么就一直循环
        while (dividend>=divisor){
            dividend=dividend-divisor;
            count++;
        }
//        当循环结束之后dividend变量记录的就是余数
        System.out.println("商 = " + count);
        System.out.println("余数 = " + dividend);
    }
}
```



### do...while

*格式*

```java
初始化语句;
do{
    循环体语句;
    条件控制语句;
}while(条件判断语句);
```

*特点*

- 先执行后判断

### 循环高级

#### 无限循环

表示循环一直都停不下来

*格式一*

```java
for (;;){
    System.out.println("for的无限循环")
}
```

*格式二*

```java
while(true){
    System.out.println("while的无限循环")
}
```

*格式三*

```java
do{
    System.out.println("do...while的无限循环")
}while(true);
```

==其中经常使用的是格式二的方式（while）==

注意：

- 无限循环的下面不能再写其他代码了，因为循环永远同步下来，那么下面的代码永远执行不到

#### 跳转控制语句

##### **continue**

==跳过本次循环，继续下次循环==

*案例：小老虎吃包子*

小老虎吃包子，第三个包子有虫子，跳过

```java
package 流程控制;

public class demo3 {
    public static void main(String[] args) {
//        1.跳过某一次循环
        for (int i = 1; i <= 5; i++) {
            if (i==3){
//                跳过本次循环，继续下次循环
                continue;
            }
            System.out.println("小老虎在吃第"+i+"个包子");
        }
    }
}

```

![image-20221021151944017](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210211519191.png)

##### break

==结束整个循环==

*案例：小老虎吃包子*

小老虎吃包子，吃完第三个就饱了

```java
package 流程控制;

public class demo4 {
    public static void main(String[] args) {
        //        1.结束循环
        for (int i = 1; i <= 5; i++) {
            System.out.println("小老虎在吃第"+i+"个包子");
            if (i==3){
//                结束循环
                break;
            }
        }
    }
}
```

![image-20221021152306065](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210211523145.png)

### 获取随机数

java帮我们写好了一个类叫Random，这个类就可以生成一个随机数

使用步骤：

- 导包   ----Random这个类在哪里

  `import java.util.Random;`

- 创建对象

  `Random r = new Random();`

- 生成随机数

  `int number = r.nextInt(随机数的范围)`

*练习*

```java
package 流程控制;

import java.util.Random;

public class demo5 {
    public static void main(String[] args) {
//        获取随机数
//        范围：0~10
        Random r = new Random();
//        判断技巧
//        在小括号中，书写的是生成数字的范围
//        这个范围一定是从0开始的
//        到这个数-1结束
//        口诀：包头不包尾，包左不包右
        int i = r.nextInt(100);  //0~99
        System.out.println("i = " + i);
    }
}

```

*练习*

```java
package 流程控制;

import java.util.Random;

public class demo6 {
    public static void main(String[] args) {
//        生成任意数之间的随机数 7~15
//        1.让这个范围头尾都减去一个值，让这个范围从0开始  -7   0~8
//        2.尾巴+1    8+1=9
//        3.最终的结果(包含7和15)，再加上第一步减去的值
        Random r = new Random();
        int i = r.nextInt(9)+7;
        System.out.println("i = " + i);
    }
}
```

### 练习

*案例：逢7过*

```tex
朋友聚会的时候可能会玩一个游戏：逢7过

游戏规则：从任意一个数字开始报数，当你要报的数字是包含7或者是7的倍数时都要说：过

需求：使用程序在控制台打印出1-100之间的满足逢七必过规则的数据
```

```java
package 流程控制.test;

public class test6 {
    public static void main(String[] args) {
/*        朋友聚会的时候可能会玩一个游戏：逢7过

        游戏规则：从任意一个数字开始报数，当你要报的数字是包含7或者是7的倍数时都要说：过

        需求：使用程序在控制台打印出1-100之间的满足逢七必过规则的数据*/
//        分析：
//        个位7   十位7     7倍数
//        例如：  1 2 3 4 5 6 过 8 9 10 11 12 13 过 14 15 16 过 18 19 ...

//        1.得到1-100之间的每一个数字
        for (int i=1;i<=100;i++){
 //        2.判断每一个数字，如果符合规则，就打印过，如果不符合规则就打印真实的数字
            if (i%7==0 || i/10 %10==7 || i%10==7){
                System.out.print("过"+"、");
                continue;
            }
            System.out.print(i+"、");
        }

    }
}
```

![image-20221021153631390](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210211536488.png)

*案例：求平方根*

```tex
需求：键盘录入一个大于等于2的整数x，计算并返回x的平方根。结果只保留整数部分，小数部分将被舍去
```

```java
package 流程控制.test;

import java.util.Scanner;

public class test7 {
    public static void main(String[] args) {
//        需求：键盘录入一个大于等于2的整数x，计算并返回x的平方根。结果只保留整数部分，小数部分将被舍去
//        分析：
//        平方根：16的平方根4；
//               4的平方根2
        /*
        10
        1*1=1<10
        2*2=4<10
        3*3=9<10
        4*4=16>10
        所以：10的平方根是在3~4之间
        * */
        /*
        * 在代码中
        * 从1开始循环，拿着数字的平方和原来的数字相比较
        * 如果小于的，那么继续往后判断
        * 如果相等，那么当前数字就是平方根
        * 如果大于的，那么前一个数字就是平方根的整数部分*/

//        1.键盘录入一个整数
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入一个整数");
        int number = sc.nextInt();
        for (int i = 1; i <= number; i++) {
            if (i*i==number){
                System.out.println(i+"就是"+number+"的平方根");
                break;/*一旦找到了，循环就可以停止了，后面的数字就不需要再找了，提高代码的运行效率*/
            }else if (i*i>number){
                System.out.println((i-1)+"就是"+number+"的平方根的整数部分");
                break;
            }
        }
    }
}
```

![image-20221021155438883](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210211554987.png)

*案例：求质数*

```tex
需求：键盘录入一个正整数 x ，判断该数是否为一个质数
```

```java
package 流程控制.test;

import java.util.Scanner;

public class test8 {
    public static void main(String[] args) {
//        需求：键盘录入一个正整数 x ，判断该数是否为一个质数

//        质数：
//        如果一个整数只能被1和本身整除，那么这个数就是质数，否则这个数叫做合数
//        例如：7=7*1  质数
//             8=1*8 2*4  合数

        /*
        * 分析：
        * */
//        1.键盘录入一个正整数number
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入一个正整数");
        int number = sc.nextInt();
//        定义一个变量，表示标记   true;是质数；false：不是一个质数
        boolean flag=true;
//        2.判断
//        写一个循环，从2开始判断，一直判断到number-1为止
//        看这个范围之内，有没有数字可以被number整除
        for (int i = 2; i < number; i++) {
            if (number % i ==0){
//                System.out.println(number+"不是一个质数");
                flag=false;
                break;
            }
        }
//        只有当这个循环结束了，表示这个范围之内的所有数字都判断完毕了
//        此时才能断定number是一个质数
        if (flag){
            System.out.println(number+"是一个质数");
        }else {
            System.out.println(number+"不是一个质数");
        }
    }
}
```

![image-20221021161128188](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210211611279.png)

*优化：*

为什么要优化？如果要判断一个数100000是不是一个质数，那么就需要循环100000次，这样的效率不高

```java
package 流程控制.test;

public class test9 {
    public static void main(String[] args) {
//        判断一个数是不是质数的优化
//        推荐一个简化的思路
        /*
        * 81
        * 1*81
        * 3*27
        * 9*9*/
        /*
        * 以81的平方根9为中心
        * 而且假设a*b=81
        * 那么a和b中，其中有一个必定是小于9的
        * 另一个是大于等于9的*/

//        假设，都是大于9----9.1*9.1>81
//        假设，都是小于9----8.9*8.9<81
//        其中一个数字一定是小于等于平方根
//        另外一个数字一定是大于等于平方根

        int number=100;
//        如果这个范围之内，所有数字都不能被number整除
//        那么number就一定是一个质数
        for (int i=2;i <= number的平方根;i++){
            
        }
    }
}
```

# 五、数组

## 数组介绍

数组是一种容器，可以用来存储同种数据类型的多个值

## 数组的定义和静态初始化

*格式一*

```java
数据类型[] 数组名
范例：	int[] array
```

格式二

```java
数据类型 数组名[]
范例： int array[]
```

### 数组的初始化

初始化：就是在内存中，为数组容器开辟空间,并将数据存入容器中的过程

完整格式：

数据类型[] 数组名 = new 数据类型[]{元素1，元素2，元素3，.....}

范例：`int[] array =  new int[]{11,22,33};`

简化格式：数据类型[] 数组名={元素1，元素2，元素3，.....}

范例：`int[] array = {11,22,33};`

```java
package 数组;

public class demo {
    public static void main(String[] args) {
//        静态初始化
//        需求：定义数组存储3个学生的年龄
        int[] arr1=new int[]{11,12,13};     //完整格式
        int[] arr2={11,12,13};
//        需求：定义数组存储3个学生的姓名
        String[] arr3=new String[]{"a","b","c"};    //完整格式
        String[] arr4={"a","b","c"};
    }
}

```

*地址值*

数组在整个内存中的位置

```java
package 数组;

public class demo {
    public static void main(String[] args) {
//        静态初始化
//        需求：定义数组存储3个学生的年龄
        int[] arr1=new int[]{11,12,13};     //完整格式
        System.out.println(arr1);
    }
}
```

输出结果：`[I@1b6d3586`

如上的输出结果表示的是数组的地址值

==解释地址值的格式含义==

`[I@1b6d3586`

- [   :表示当前是一个数组
- I   ：表示当前数组里面的元素都是int类型的
- @ ：表示一个间隔符号。（固定格式）
- 1b6d3586  ：才是正真的地址值，（十六进制）
- 平时我们习惯性的将这个整体叫做地址值

### 数组元素的访问

数组名[索引]

索引：

- 也叫做下标，角标
- 从0开始，逐个+1增长，连续不间断

*练习：遍历数组并求和*

```java
package 数组;

public class demo {
    public static void main(String[] args) {
//        静态初始化
//        需求：定义数组存储3个学生的年龄
        int[] arr2={11,12,13};

        int sum=0;
        for (int i = 0; i < arr2.length; i++) {
            sum+=arr2[i];
        }
        System.out.println("sum = " + sum);
    }
}

```

*练习：*

需求：遍历数组得到每一个元素，统计数组里面一共有多少个能被3整除的数字

```java
package 数组.test;

public class test1 {
    public static void main(String[] args) {
        int[] arr={1,2,12,3,5,6,7,8,9,16};
        int count=0;
        for (int i = 0; i < arr.length; i++) {
            if(arr[i] % 3 == 0){
                count++;
            }
        }
        System.out.println("count = " + count);
    }
}
```

![image-20221021214714513](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210212147661.png)

*练习：变化数据*

```tex
定义一个数组，存储1,2,3,4,5,6,7,8,9,10
遍历数组得到每一个元素
要求：
1.如果是奇数，则将当前数字扩大两倍
2.如果是偶数，则将当前数字变成二分之一
```

```java
package 数组.test;

public class test2 {
    public static void main(String[] args) {
        /*定义一个数组，存储1,2,3,4,5,6,7,8,9,10
            遍历数组得到每一个元素
            要求：
            1.如果是奇数，则将当前数字扩大两倍
            2.如果是偶数，则将当前数字变成二分之一*/
        int[] arr={1,2,3,4,5,6,7,8,9,10};
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] % 2 ==1){
                arr[i]*=2;
            }else if (arr[i] % 2 ==0){
                arr[i]*=0.5;
            }
        }
        for (int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }
    }
}
```

![image-20221021215701550](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210212157666.png)

注意：

- 一个循环尽量只做一件事情

## 数组的动态初始化

格式：`数据类型[] 数组名 = new 数据类型[数组的长度]`

特点：在创建的时候，由我们自己指定数组的长度，由虚拟机给出默认的初始化值

*静态初始化和动态初始化的区别*

- 动态初始化：手动指定数组的长度，由虚拟机给出默认的初始化值
- 静态初始化：手动指定数组的元素，系统会根据元素个数，计算出数组的长度

## 数组的内存图

Java内存分配

- 栈：方法运行时使用的内存，比如main方法运行，进入方法栈中运行
- 堆：存储对象或者数组，new来创建的，都存储在堆内存
- 方法区：存储可以运行的class文件
- 本地方法栈：JVM在使用操作系统功能的时候使用，和我们开发无关
- 寄存器：给CPU使用，和我们开发无关

*练习：*

```java
public class test{
    public static void main(String[] args){
        int a = 10;
        int b = 10;
        int c = a + b;
        System.out.println(c)
    }
}
```

![image-20221022123105211](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210221231310.png)

#### 数组的内存图

```java
public class test{
    public static void main(String[] args){
		int[] arr = new int[2];
        sout(arr);
        sout(arr[0]);
        sout(arr[1]);
        
        arr[0] = 11;
        arr[1] = 22;
        sout(arr[0]);
        sout(arr[1]);
        
        sout("-------------------")
        int[] arr2 = {33,44,55};
        sout(arr2);
    }
}
```

![image-20221022125540688](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210221255783.png)

*注意：*

- 只要是new出来的一定是在堆里面开辟了一个小空间
- 如果new了多次，那么在堆里面就有多个小空间，每个小空间中都有各自的数据

#### 两个数组指向同一个空间的内存图

```java
public class test{
    public static void main(String[] args){
        int[] arr1 = {33,44};
        int[] arr2 = arr1;
        
        sout(arr1[0]);
        sout(arr2[0]);
        
        arr2[0] = 33;
        
        sout(arr1[0]);
        sout(arr2[0]);

    }
}
```

![image-20221022131422263](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210221314371.png)

*注意：*

- 当两个数组指向同一个小空间时，其中一个数组对小空间中的值发生了改变，那么其他数组再次访问时就都是修改之后的结果了

## 数组常见问题

- 当访问了数组中不存在的索引，就会引发索引越界异常

```java
package 数组;

public class demo2 {
    public static void main(String[] args) {
        int[] arr={1,2,3};
        System.out.println(arr[4]);		//访问了不存在的索引
    }
}
```



![image-20221021221550443](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210212215564.png)

`ArrayIndexOutOfBoundsException`:索引越界异常



## 数组常见操作

- 求最值

  *练习*

  ```tex
  需求：已知数组元素为{33,5,22,44,55}
  找出最大值并打印输出
  ```

  ```java
  package 数组.test;
  
  public class test3 {
      public static void main(String[] args) {
          /*需求：已知数组元素为{33,5,22,44,55}
            找出最大值并打印输出*/
  //        1.定义数组用来存储5个值
          int[] arr={33,5,22,44,55};
  //        2.定义一个变量max用来存储最大值
          int max=arr[0];		//如果将max初始化值是0，那么如果数组中的值若为负数则不正确
  
          for (int i = 0; i < arr.length; i++) {
              if (arr[i]>max){
                  max=arr[i];
              }
          }
  //        4.当循环结束之后，max记录的就是数组中的最大值
          System.out.println("max = " + max);
  
      }
  }
  ```

  <img src="https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210212226542.png" alt="image-20221021222604435" style="zoom:200%;" />

- 求和

  *练习*

  ```tex
  需求：生成10个1~100之间的随机数存入数组
  求出所有数据的和
  求所有数据的平均数
  统计有多少个数据比平均数值小
  ```

  ```java
  package 数组.test;
  
  import java.util.Random;
  
  public class test4 {
      public static void main(String[] args) {
          /*需求：生成10个1~100之间的随机数存入数组
              求出所有数据的和
              求所有数据的平均数
              统计有多少个数据比平均数值小*/
          int[] arr=new int[10];
          Random r = new Random();
  //        1.生成10个1~100之间的随机数存入数组
          for (int i = 0; i < arr.length; i++) {
              arr[i]= r.nextInt(100)+1;
          }
  //        2.求出所有数据的和
          int sum=0;
          for (int i = 0; i < arr.length; i++) {
              sum+=arr[i];
          }
  //        3.求所有数据的平均数
          double avg=sum/(arr.length);
  //        4.统计有多少个数据比平均数值小
          int count=0;
          for (int i = 0; i < arr.length; i++) {
              if (arr[i]<avg){
                  count++;
              }
          }
          for (int i = 0; i < arr.length; i++) {
              System.out.print(arr[i]+" ");
          }
          System.out.println("");
          System.out.println("数组的长度为："+arr.length);
          System.out.println("数据的和为："+sum);
          System.out.println("数据的平均数为："+avg);
          System.out.println("比平均数值小的数据共有："+count+"个");
      }
  }
  ```

  ![image-20221021225205640](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210212252753.png)

- 交换数据

  ```java
  package 数组.test;
  
  public class test5 {
      public static void main(String[] args) {
          int[] arr={1,2,3,4,5};
          for (int i = 0,j = arr.length-1; i < j; i++,j--) {
              int temp=arr[i];
              arr[i]=arr[j];
              arr[j]=temp;
          }
          for (int i = 0; i < arr.length; i++) {
              System.out.print(arr[i]+" ");
          }
      }
  }
  ```

  ![image-20221021231327210](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210212313316.png)

- 打乱数据

  ```java
  package 数组.test;
  
  import java.util.Random;
  
  public class test6 {
      public static void main(String[] args) {
  //        需求：定义一个数组，存入1~5，要求打乱数组中所有数据的顺序
  
  /*//        难点：
  //        如何获取数组中的随机索引
          int[] arr={1,2,3,4,5};
  //        索引范围1~5
          Random r = new Random();
          int randomIndex = r.nextInt(arr.length);*/
  
  //        1.定义数组
          int[] arr={1,2,3,4,5};
  
          Random r = new Random();
          for (int i = 0; i < arr.length; i++) {
              int randomIndex = r.nextInt(arr.length);
              int temp=arr[i];
              arr[i]=arr[randomIndex];
              arr[randomIndex]=temp;
          }
  
          for (int i = 0; i < arr.length; i++) {
              System.out.print(arr[i]+" ");
          }
  
      }
  }
  ```

  

![image-20221022121533196](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210221215324.png)

## 二维数组

*格式*

```java
数据类型[][] 数组名=new 数据类型[][]{{元素1，元素2},{元素1，元素2}}
```

*范例*

```java
int[][] arr = new int[][]{{11,22},{33,44}}
```

*简化格式*

```java
数据类型[][] 数组名 = {{元素1，元素2},{元素1，元素2}}
```

*范例*

```java
int[][] arr = {{11,22},{33,44}}
```

或者

```java
int arr[][]= {{11,22},{33,44}}
```

### 二维数组的静态初始化

*练习：*

```java
package 数组.二维数组;

public class demo1 {
    public static void main(String[] args) {
        int[][] arr = new int[][]{{11, 22}, {33, 44}};
        int[][] arr2={{1,2,3},{4,5,6,7}};
//        建议如下的写法
        int[][] arr3={
                {1,2,3},
                {4,5,6,7}
        };
//      获取一个元素
        /*
        * arr[i][j]
        * arr:数组
        * i：二维数组的索引，获取出来的是里面的一维数组
        * j：表示一维数组中的索引，获取出来的是真正的元素*/
        System.out.println(arr[0][1]);

//       3.遍历数组
        System.out.println("========================遍历二维数组=========================");
//        外循环：遍历二维数组，得到每一个一维数组
        for (int i = 0; i < arr3.length; i++) {
//            i:二维数组的索引
//            内循环：遍历一维数组，得到里面的每一个元素，
            for (int j = 0; j < arr3[i].length; j++) {
                System.out.print(arr3[i][j]+" ");
            }
            System.out.println();
        }
    }
}
```

![image-20221023193944168](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210231939276.png)

### 二维数组的动态初始化

*格式*

```java
数据类型[][] 数组名 = new 数据类型[m][n];
m:表示这是一个二维数组，可以存放多少个一维数组
n:表示每一个一维数组，可以存放多少个元素
```

*范例：*

```java
int[][] arr = new int[2][3];
该数组表示可以存放2个一维数组，，每一个一维数组中可以存放3个int类型的元素
```

*练习：*

```java
package 数组.二维数组;

public class demo2 {
    public static void main(String[] args) {
//        1.利用动态初始化创建二维数组
        int[][] arr = new int[3][5];
        arr[0][0]=10;

//        遍历数组
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
                System.out.print(arr[i][j]+" ");
            }
            System.out.println();
        }
    }
}
```

![image-20221023194906425](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210231949533.png)

### 二维数组的内存原理

*例如：*

```java
public static void main(String[] args){
    int[][] arr = new int[2][3];
}
```

如下是内存图

![image-20221023200530986](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210232005094.png)

*特殊情况：*

例如：

```java
public static voic main(String[] args){
    int[][] arr = new int[2][];
    int[] arr1 = {11,22};
    int[] arr2 = {44,55,66};
    
    arr[0]=arr1;
    arr[1]=arr2;
}
```

![image-20221023201724502](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210232017609.png)

*特殊情况*

*例如：*

```java
public static voic main(String[] args){
    int[][] arr = new int[2][3];
    int[] arr1 = {11,22};
    int[] arr2 = {44,55,66};
    
    arr[0]=arr1;
    arr[1]=arr2;
}
```

内存图如下：

![image-20221023202842301](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210232028422.png)

### 总结

1. 当我们需要把数据分组管理的时候，就需要用到二维数组
2. 掌握二维数组的静态初始化、动态初始化
3. 如何给二维数组中的元素赋值
4. 如何遍历二维数组

*练习：二维数组的练习：*

```te
某商场每个季度的营业额度如下：单位（万元）

第一季度：22、66、44
第二季度：77、33、88
第三季度：25、45、65
第四季度：11、66、99

要求计算出每个季度的总营业额和全年的营业额
```

```java
package 数组.二维数组;

public class demo3 {
    public static void main(String[] args) {
        /*某商场每个季度的营业额度如下：单位（万元）

            第一季度：22、66、44
            第二季度：77、33、88
            第三季度：25、45、65
            第四季度：11、66、99

            要求计算出每个季度的总营业额和全年的营业额*/

//        1.创建二维数组并存储数据
        int[][] arr = {
                {22, 66, 44},
                {77, 33, 88},
                {25, 45, 65},
                {11, 66, 99}
        };
        int yearSum=0;
        for (int i = 0; i < arr.length; i++) {
            int sum = getSum(arr[i]);
            System.out.println("第"+(i+1)+"个季度的总营业额为："+sum+"万元");
//            计算全年的总营业额
            yearSum+=sum;
        }

//        输出全年的总营业额
        System.out.println("该商场全年的总营业额为："+yearSum+"万元");
    }
    //        定义一个方法，计算每一个季度的营业额
    public static int getSum(int[] arr){
        int sum=0;
        for (int i = 0; i < arr.length; i++) {
            sum+=arr[i];
        }

        return sum;
    };
}
```

![image-20221023204714876](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210232047988.png)



# 六、方法

## *什么是方法？*

==方法（method）时程序中最小的执行单元==

## *方法有什么用呢？*

- 提高代码的复用性
- 提高代码的可维护性

## 方法的格式

方法的定义：把一些代码打包到一块

*格式一*

```java
public static void 方法名(){
    方法体;
}
```



*练习：拷贝数组*

定义一个方法copyOfRange（int[] arr,int from,int to），

功能：将数组arr中从索引from（包含from）开始。到索引to（不包含to）的元素复制到新数组中，将新数组返回。

```java
package 方法.test;

public class test1 {
    public static void main(String[] args) {
        /*定义一个方法copyOfRange（int[] arr,int from,int to），
            功能：将数组arr中从索引from（包含from）开始。
            到索引to（不包含to）的元素复制到新数组中，将新数组返回。*/
//        1.定义初始数组
        int[] arr={1,2,3,4,5,6,7,8,9};

//        2.调用方法拷贝数组
        int[] copyArr = copyOfRange(arr, 1, 5);
        for (int i = 0; i < copyArr.length; i++) {
            System.out.print(copyArr[i]+" ");
        }
    }

    public static int[] copyOfRange(int[] arr, int from, int to){
//        1.定义数组，动态的
        int arrLength=to-from;
        int[] newArr=new int[arrLength];

        int index=0;
        for (int i = from; i < to; i++) {
            newArr[index]=arr[i];
            index++;
        }
        return newArr;
    }
}
```

![image-20221023141803067](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210231418197.png)

## java的内存分配

![image-20221023143516526](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210231435642.png)

栈：先进后出

### 方法传递基本数据类型的内存原理

*练习*

```java
package 方法;

public class demo2 {
    public static void main(String[] args) {
        int num=100;
        System.out.println("调用change方法前"+num);
        change(num);
        System.out.println("调用change方法后"+num);
    }

    public static void change(int num){
        num=200;
    }
}
```

![image-20221023151026775](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210231510899.png)

*注意：*

==传递基本数据类型时，传递的是真实的数据，形参的改变，不影响实际参数的值==

*练习*

```java
package 方法;

public class demo3 {
    public static void main(String[] args) {
        int[] arr={10,20,30};
        System.out.println("调用change方法前"+arr[1]);
        change(arr);
        System.out.println("调用change方法后"+arr[1]);
    }
    public static void change(int[] arr){
        arr[1]=200;
    }
}
```

![image-20221023152213752](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210231522844.png)

*注意：*

==传递引用数据类型时，传递的是地址值，形参的改变，影响实际参数的值==

# 七、面向对象

## 类和对象

*如何定义类：*

```java
public class 类名{
    1.成员变量（代表属性，一般是名词）
    2.成员方法（代表方法，一般是动词）
    3.构造器（后面学习）
    4.代码块（后面学习）
    5.内部类（后面学习）    
}
```

例如：

```java
public class Phone{
    //属性（成员变量）
    String brand;
    double price;
    
    //行为（方法）
    public void call(){
        sout("打电话")
    }
    public void playGame(){
        sout("玩游戏")
    }
}
```

*问：类和对象是什么？*

- 类：是共同特征的描述
- 对象：是真实存在的具体实例

*定义类的补充注意事项：*

- 用来描述一类事物的类，专业叫做：==JavaBean类==

  - 在JavaBean类中，是不写卖弄方法的

- 在以前，编写main方法的类，叫做==测试类==

  - 我们可以在测试类中创建JavaBean类的对象并进行赋值调用

- 类名首字母建议大写需要见名知意，驼峰模式

- 一个java文件中可以定义多个class类，且只能一个类是public修饰，而且public修饰的类名必须成为代码文件名

  - ==实际开发中建议还是一个文件定义一个class类==

- 成员变量的完整定义格式是：`修饰符 数据类型  变量名称 = 初始化值;`  ==一般无需指定初始化值，存在默认值==

  

## 封装

### 面向对象三大特征

- 封装
  - 告诉我们，如何正确设计对象的属性和方法
  - 原则：==对象代表什么，就得封装对应的数据，并提供数据对应的行为==
  - 理解封装思想的好处？
    - 让编程变得简单，有什么事。找对象，调方法就行
    - 降低我们的学习成本，可以少学、少记，不用记对象有哪些方法，有需要时去找就行
- 继承
- 多态

### private关键字

- 是一个权限修饰符
- 可以修饰成员（成员变量的成员方法）
- 被`private`修饰的成员只能在本类中才能访问
- 针对private修饰的成员变量，如果需要被其它类使用，提供相应的操作
- 提供”setXxx(参数)“方法，用于给成员变量赋值，方法用public来修饰
- 提供”gettXxx()“方法，用于获取成员变量的值，方法用public来修饰

==目的：就是为了保证数据的安全性==

例如：

```java
public class Friend{
    private String name;
    private int age;
    private String gender;
}
```

此时如下这样写就会报错

```java
Friend fri = new Friend();
fri.age = 18;		//此时这样写就会报错
```

要求：正确的数据可以赋值，错误的数据无法赋值（例如`fri.age = -18;`就是错误的数据）

实现的方式如下：

get 、set 方法

```java
public class Friend{
    private String name;
    private int age;
    private String gender;
    
    //set(赋值)
    public void setAge(int a){
        if(a > 0 && a <= 50){
            age = a;
        }else{
            Sout("非法数据");
        }
    }
    //get(获取)
    public int getAge(){
        return age;
    }
}
```

*练习：*

```java
package 面向对象.test1;

public class Friend {
    private String name;
    private int age;
    private String gender;

//    针对每一个私有化的成员变量，都要提供get和set方法
//    set方法：给成员变量赋值
//    get方法：对外提供成员变量的值

    //    name
//    作用：给成员变量name进行赋值
    public void setName(String n) {
        name = n;
    }
    //    作用：对外提供name属性
    public String getName() {
        return name;
    }

    //    age
    public void setAge(int a) {
        if (a > 0 && a <= 50) {
            age = a;
        } else {
            System.err.println("非法数据");
        }
    }
    public int getAge() {
        return age;
    }

    //    gender
    public void setGender(String g) {
        gender = g;
    }
    public String getGender() {
        return gender;
    }
}
```

```java
package 面向对象.test1;

public class FriendTest {
    public static void main(String[] args) {
        Friend friend = new Friend();
        friend.setName("小红");
        friend.setAge(-20);
        friend.setGender("女");

        System.out.println(friend.getName());
        System.out.println(friend.getAge());
        System.out.println(friend.getGender());
    }
}
```

![image-20221023231048340](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210232310504.png)

### this关键字

当成员变量和局部变量重名时，就会触发就近原则，如果想要使用成员变量就需要使用`this.`

就近原则：谁离我近，我就用谁

例如对Friend类的修改：

```java
package 面向对象.test2;

public class Friend {
    private String name;
    private int age;
    private String gender;

//    针对每一个私有化的成员变量，都要提供get和set方法
//    set方法：给成员变量赋值
//    get方法：对外提供成员变量的值

    //    name
//    作用：给成员变量name进行赋值
    public void setName(String name) {
//        局部变量表示测试类中调用方法传递过来的数据
//        等号的左边：就表示成员位置的变量name
        this.name=name;
    }

    //    作用：对外提供name属性
    public String getName() {
        return name;
    }

    //    age
    public void setAge(int age) {
        if (age > 0 && age <= 50) {
            this.age = age;
        } else {
            System.err.println("age-非法数据");
        }
    }

    public int getAge() {
        return age;
    }

    //    gender
    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }

}
```

*this的作用？*

可以区别成员变量和局部变量

*成员变量和局部变量的区别：*

| 区别           | 成员变量                                   | 局部变量                                       |
| -------------- | ------------------------------------------ | ---------------------------------------------- |
| 类中的位置不同 | 类中，方法外                               | 方法内、方法声明上                             |
| 初始化值不同   | 有默认初始化值                             | 没有、使用之前需要完成赋值                     |
| 内存位置不同   | 堆内存                                     | 栈内存                                         |
| 生命周期不同   | 随着对象的创建而存在，随着对象的消失而消失 | 随着方法的调用而存在，随着方法的运行结束而消失 |
| 作用域         | 整个类中有效                               | 当前方法中有效                                 |

### 案例

#### *案例1：文字版格斗游戏*

如下是JavaBean代码

```java
package 案例.test1;

import java.util.Random;

public class Role {
    private String name;
    private int blood;

    public Role(String name, int blood) {
        this.name = name;
        this.blood = blood;
    }

    public Role() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBlood() {
        return blood;
    }

    public void setBlood(int blood) {
        this.blood = blood;
    }

    //    定义一个方法用于攻击别人
    /*
     * 思考：谁攻击谁？
     * r1,r2
     * r1.攻击(r2)
     * 方法的调用者去攻击参数
     * */
    public void attack(Role role) {
//        计算造成的伤害1~20，随机的伤害
        Random random = new Random();
        int hurt = random.nextInt(20) + 1;
//         被打的角色的血量
        int remainBlood = role.getBlood() - hurt;
//        对剩余血量做一个验证，如果为负数了，就修改为0
        remainBlood = remainBlood < 0 ? 0 : remainBlood;
//         修改一下被打的角色的血量
        role.setBlood(remainBlood);
//        this表示的是方法的调用者
        System.out.println(this.getName() + "举起拳头，打了一下" + role.getName() +
                "，造成了" + hurt + "点的伤害，" + role.getName() + "还剩下了" + remainBlood + "点血");
    }
}

```

```java
package 案例.test1;

public class GameTest {
    public static void main(String[] args) {
//        1.创建一个角色
        Role r1 = new Role("亚瑟",50);
//        2.创建第二个角色
        Role r2 = new Role("后裔",50);

//        3.开始格斗，回合制游戏

        while (true){
//            r1开始攻击r2
            r1.attack(r2);
//            判断r2的剩余血量
            if (r2.getBlood() == 0){
                System.out.println(r1.getName()+"K.O了"+r2.getName());
                break;
            }

//            r2开始攻击r1
            r2.attack(r1);
            if (r1.getBlood() == 0){
                System.out.println(r2.getName()+"K.O了"+r1.getName());
                break;
            }
        }
    }
}
```

![image-20221024151733215](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210241517315.png)

#### *案例2：对象数组*

```tex
需求：定义一个数组存储3个商品对象

商品的属性：商品的id，名字，价格，库存

创建三个商品对象，并把商品对象存入到数组当中
```

如下是javabean代码

```java
package 案例.test3;

public class Goods {
    private String id;
    private String name;
    private double price;
    private int count;

//    无参构造
    public Goods() {
    }
//    有参构造
    public Goods(String id, String name, double price, int count) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.count = count;
    }
//     get  set方法
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", count=" + count +
                '}';
    }
}
```

如下是测试代码

```java
package 案例.test3;

public class GoodsTest {
    public static void main(String[] args) {
//        1.创建一个数组
        Goods[] goodsArr = new Goods[3];
//        2.创建三个商品对象
        Goods g1 = new Goods("001", "小米K50", 3999.0, 100);
        Goods g2 = new Goods("002", "荣耀50", 2999.0, 50);
        Goods g3 = new Goods("003", "充电宝", 199.0, 70);
//        把商品添加到数组中
        goodsArr[0] = g1;
        goodsArr[1] = g2;
        goodsArr[2] = g3;

        for (int i = 0; i < goodsArr.length; i++) {
            System.out.println(goodsArr[i]);
        }

    }
}
```

![image-20221024153853042](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210241538138.png)

#### *案例3：对象数组2*

```java
需求：定义一个数组用来存储3部汽车对象

汽车的属性：品牌，价格，颜色

创建三个汽车对象，数据通过键盘录入的方式而来。并把数据存入到数组当中去
```

键盘录入：

- 第一套体系

  ==特点：遇到空格，制表符，回车就停止接受。这些符号后面的数据就不会接受了==

  - nextInt()：接收整数
  - nextDouble()：接受小数
  - next()：接收字符串

- 第二套体系

  ==特点：可以接收空格，制表符，遇到回车才停止接收数据==

  - nextLine()：接收字符串

- 以上键盘录入的两套体系是不建议混合使用

  弊端：先用nextInt，再用nextLine会导致下面的nextLine接收不到数据

如下是JavaBean类

```java
package 案例.test4;

public class Car {
    private String brand;//表示汽车的品牌
    private int price;//表示汽车的价格
    private String color;//表示汽车的颜色
//  无参构造
    public Car() {
    }
//  有参构造
    public Car(String brand, int price, String color) {
        this.brand = brand;
        this.price = price;
        this.color = color;
    }
//get set方法
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

//    toString方法
    @Override
    public String toString() {
        return "Car{" +
                "brand='" + brand + '\'' +
                ", price=" + price +
                ", color='" + color + '\'' +
                '}';
    }
}
```

如下是测试类

```java
package 案例.test4;

import java.util.Scanner;

public class CarTest {
    public static void main(String[] args) {
//        1.创建一个数组用来存储三个汽车对象
        Car[] carsArr = new Car[3];
//        2.创建汽车对象，数据来自于键盘录入
        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < carsArr.length; i++) {
//            创建汽车的对象，
//            注意：如果将对象放到循环的外面，那么每次输入的数据就会覆盖掉上一次的输入的数据
//            所以不能写在循环的外面
            Car car = new Car();
//            品牌
            System.out.println("请录入汽车的品牌");
            String brand = sc.next();
            car.setBrand(brand);
//            价格
            System.out.println("请输入汽车的价格");
            int price = sc.nextInt();
            car.setPrice(price);
//            颜色
            System.out.println("请输入汽车的颜色");
            String color = sc.next();
            car.setColor(color);
//            将汽车对象添加到数组当中
            carsArr[i] = car;
        }

//        遍历数组
        for (int i = 0; i < carsArr.length; i++) {
            System.out.println(carsArr[i]);
        }
    }
}
```

![image-20221024161836032](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210241618202.png)

注意：

- 如果将对象放到循环的外面，那么每次输入的数据就会覆盖掉上一次的输入的数据

- 所以不能写在循环的外面

- 如下是其内存图

  ![image-20221024161950006](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210241619097.png)

#### *案例4：对象数组3*

```tex
需求：定义数组存储三部手机对象

手机的属性：品牌，价格，颜色

要求：计算出三部手机的平均价格
```

如下是JavaBean的代码

```java
package 案例.test5;

public class Phone {
    private String brand;//品牌
    private int price;//价格
    private String color;//颜色

    public Phone() {
    }

    public Phone(String brand, int price, String color) {
        this.brand = brand;
        this.price = price;
        this.color = color;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "Phone{" +
                "brand='" + brand + '\'' +
                ", price=" + price +
                ", color='" + color + '\'' +
                '}';
    }
}
```

如下是测试类

```java
package 案例.test5;

public class PhoneTest {
    public static void main(String[] args) {
//        1.创建一个数组
        Phone[] phonesArr = new Phone[3];
//        2.创建手机对象
        Phone p1 = new Phone("小米", 4500, "红色");
        Phone p2 = new Phone("华为", 4999, "蓝色");
        Phone p3 = new Phone("苹果", 6999, "黑色");
//        3.将手机对象添加到数组中
        phonesArr[0] = p1;
        phonesArr[1] = p2;
        phonesArr[2] = p3;
//        4.获取价格
        int sum=0;
        for (int i = 0; i < phonesArr.length; i++) {
            Phone phone=phonesArr[i];
            sum+= phone.getPrice();
        }
        int priceAvg=0;
        priceAvg=sum/ phonesArr.length;
        System.out.println("三部手机的平均价格为："+priceAvg);
    }
}
```

![image-20221024163659237](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210241636318.png)

# 八、API&字符串

如何使用java已经写好的东西

API：应用程序编程接口

简单理解：API就是别人已经写好了的东西，我们不需要自己编写，直接使用即可

Java API：指的就是JDK中提供的各种功能的Java类

这些类将底层的实现分装了起来，我们不需要关心这些类是如何实现的，只需要学习这些类如何使用即可

## API和API帮助文档

API帮助文档：帮助开发人员更好的使用API和查询API的一个工具

如何使用API帮助文档

![image-20221024204940871](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242049087.png)

目前我们需要学习的就是

![image-20221024205010020](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242050087.png)

练习：使用Scanner获取一个小数

帮助文档如下描述：

![image-20221024210202789](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242102875.png)

如下是代码的实现：

![image-20221024210343186](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242103304.png)

## 字符串

字符串在开发中的应用场景

- 用户登录时判断用户账号和密码
- 敏感词替换

***Srting概述：***

- java.lang.String类代表字符串，Java程序中的所有字符串文字（例如：“abc”）都为此类的对象，
- java.lang包是Java的核心包，所以在使用的时候是不用导包的

***String的注意点：***

字符串的内容是不会发生改变的，它的对象在创建后不能被更改

***创建String对象的两种方式***

- 直接赋值

```java
public class demo{
    public static void main(String[] args){
        String a1 = "abc";
        String a2 = "abc";
    }
}
```

注意：

==当使用双引号直接赋值时，系统会检查该字符串在串池中是否存在。==

==如果不存在：创建新的==

==存在：复用==

- new

练习：

```java
package JAVAAPI.String;

public class demo1 {
    public static void main(String[] args) {
//        1.使用直接赋值的方式获取一个字符串对象
        String s1 = "abc";
        System.out.println("s1 = " + s1);

//        2.使用new的方式来获取一个字符串对象
//        空参构造
        String s2 = new String();   //没有任何的内容
        System.out.println("s2 = " + s2);

//      有参构造
        String s3 = new String("abc");

//        传递字符数组，得到字符串对象
        char[] chs = {'a', 'b', 'c', 'd'};
        String s4 = new String(chs);
        System.out.println("s4 = " + s4);

//        传递一个字节数组，根据字节数组的内容再创建一个新的字符串对象
//        应用场景：在网络中传输的数据其实都是字节信息        
        byte[] bytes = {97, 98, 99, 100};
        String s5 = new String(bytes);
        System.out.println("s5 = " + s5);
    }
}
```

注意：

new出来的字符串不会被复用

### java中的常用方法（比较）

`==` 和  `equals`的区别

- `==`比较

| 基本数据类型               | 引用数据类型               |
| -------------------------- | -------------------------- |
| 基本数据类型比较的是数据值 | 引用数据类型比较的是地址值 |

例如：

```java
String s1 = "abc";		//该值是记录在串池中的
String s2 = "abc";		//该值是记录在串池中的
sout(s1 == s2) //true
```

原因是因为s1和s2的地址值是一样的（复用）



```java
String s1 = new String("abc");		//该是记录在堆中的地址值
String s2 = "abc";					//该值是记录在串池中的地址值
sout(s1 == s2) //false
```

两者的地址值不一样

- `equals`比较	

  ![image-20221024215115641](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242151756.png)

`equals`:完全一样的结果才是true，否则则是false

`equalsIgnoreCase`：忽略大小写的比较

练习：

```java
//        1.创建两个字符串对象
        String s1 = "abc";
        String s2 = "ABC";
        System.out.println(s1.equals(s2));		//false
		//忽略大小写的比较
        System.out.println(s1.equalsIgnoreCase(s2));		//true
```

![image-20221024215718411](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242157509.png)

但是  数字 `1`  和中文数字 `一`类似这样的是不可以比较的

练习

```java
package JAVAAPI.String;

import java.util.Scanner;

public class demo3 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String s1 = scanner.next();		//java底层是new出来的，所以说和s2的地址值是不一样的
        String s2 = "abc";
        System.out.println(s1 == s2);
    }
}
```

![image-20221024220514011](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242205100.png)

<p style="color:red">注意：next()的java底层是new出来的，所以说和s2的地址值是不一样的</p>

结论：

- 以后只要是想比较字符串中的内容，就必须要使用String里面的方法`equals`或者`equalsIgnoreCase`

案例：用户登录

```tex
需求：已知正确的用户名和密码，请用程序实现模拟用户登录

总共给三次机会，登录之后，给出相应的提示
```

```java
package JAVAAPI.String;

import java.util.Scanner;

public class demo4 {
    public static void main(String[] args) {
        /*需求：已知正确的用户名和密码，请用程序实现模拟用户登录
            总共给三次机会，登录之后，给出相应的提示*/
//        1.定义两个变量，记录正确的用户名和密码
        String rightUsername = "cyy";
        String rightPassword = "123456";

//        2.模拟用户登录
        Scanner sc = new Scanner(System.in);
        int count=0;
        for (int i = 0; i < 3; i++) {

            System.out.println("请您登录，您还有"+(3-count)+"次机会");
            System.out.println("请输入用户名");
            String username = sc.next();
            System.out.println("请输入密码");
            String password = sc.next();
            if (username.equals(rightUsername) &&password.equals(rightPassword)){
                System.out.println("用户登录成功");
                break;
            }else {
                if (count==2){
                    System.out.println("您的三次机会已经用完，账户"+rightUsername+"已被锁定，系统即将推出");
                }else {
                    System.out.println("用户登陆失败,账号或密码错误，请检查");
                }
                count++;
            }
        }


    }
}
```

登录失败演示

![image-20221024224041705](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242240857.png)

登录成功演示

![image-20221024224145222](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210242241324.png)

*练习：遍历字符串*

需求：键盘录入一个字符串，使用程序实现在控制台遍历该字符串

```java
public char charAt(int index):根据索引返回字符
public int length():返回此字符串的长度
```

数组的长度：数组名.length

字符串的长度：字符串对象.length()

“你好123世界”

```java
package JAVAAPI.String;

import java.util.Scanner;

public class demo5 {
    public static void main(String[] args) {
//        1.键盘读入一个字符串
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入一个字符串");
        String str = sc.next();
//        2.进行遍历
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            System.out.println(c);
        }
    }
}
```

输出结果如下：

```java
请输入一个字符串
你好123世界
你
好
1
2
3
世
界
```

*案例：统计字符的次数*

键盘录入一个字符串，统计该字符串中大写小写字母字符，数字字符出现的次数（不考虑其他字符）

```java
package JAVAAPI.String;

import java.util.Scanner;

public class demo6 {
    public static void main(String[] args) {
//        键盘录入一个字符串，统计该字符串中大写小写字母字符，数字字符出现的次数（不考虑其他字符）
        
//        1.键盘录入一个字符串
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入一个字符串");
        String str = sc.next();
//        2.统计----计数器思想
        int bigCount = 0;
        int smallCount = 0;
        int numberCount = 0;
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c>='a' && c<='z'){
                smallCount++;
            }else if (c>='A'&& c<='Z'){
                bigCount++;
            }else if (c>='0'&&c<='9'){
                numberCount++;
            }
        }
        System.out.println("bigCount = " + bigCount);
        System.out.println("smallCount = " + smallCount);
        System.out.println("numberCount = " + numberCount);
    }
}
```

输出结果：

```bash
请输入一个字符串
ghj123456ADhj45HSD
bigCount = 5
smallCount = 5
numberCount = 8
```

*案例：字符串的反转*

定义一个方法，实现字符串的反转

键盘录入一个字符串，调用该方法后，在控制台输出结果

例如，键盘录入abc，输出结果cba

```java
package JAVAAPI.String;

import java.util.Scanner;

public class demo7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入一个字符串");
        String str = sc.next();
        String s = strFan(str);
        System.out.println("反转后的字符串为：" + s);
    }

    //定义一个方法：实现字符串的反转
    public static String strFan(String str) {
        int j = str.length();
        String strF = "";
        for (int i = str.length() - 1; i >= 0; i--) {
            char c = str.charAt(i);
            strF = strF + c;
        }
        return strF;
    }

}
```

输出结果：

```java
请输入一个字符串
你好啊
反转后的字符串为：啊好你
```

*案例：金额转换*

需求：将阿拉伯数字转化为大写的中文

```java
package JAVAAPI.String;

import java.util.Scanner;

public class demo8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int money = 0;
        while (true) {      //ctrl+alt+T:可以用来包裹代码
            System.out.println("请录入一个整数");
            money = sc.nextInt();
            if (money >= 0 && money <= 9999999) {
                break;
            } else {
                System.out.println("金额无效");
            }
        }
        System.out.println(money);

        String strMoney = "";   //表示大写的数字
        while (true) {
//            从右往左获取数据
            int ge = money % 10;
            String capitalNumber = getCapitalNumber(ge);
//            把转换之后的大写拼接到strMoney当中
            strMoney = capitalNumber + strMoney;
//            去掉刚刚获取的数据
            money = money / 10;
//            如果数字上的每一位全部获取到了，那么money记录的就是0，此时循环结束
            if (money == 0) {
                break;
            }
        }

        System.out.println("大写：" + strMoney);
//        3.在前面补0，补齐7位
        int count = 7 - strMoney.length();
        for (int i = 0; i < count; i++) {
            strMoney = "零" + strMoney;
        }
        System.out.println("补齐后的七位大写数字：" + strMoney);
//        4.添加单位
        String strMoneyTwo = "";       //插入了单位后的结果
        String[] arr = {"佰", "拾", "万", "仟", "佰", "拾", "元",};
        for (int i = 0; i < strMoney.length(); i++) {
            char c = strMoney.charAt(i);
            strMoneyTwo = strMoneyTwo + c + arr[i];
        }
        System.out.println("插入单位后的结果：" + strMoneyTwo);

    }

    //    定义各一个方法把数字变成大写中文
    public static String getCapitalNumber(int money) {
        String[] arr = {"零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"};
//              数组下标   0    1     2     3    4     5    6     7     8    9
        return arr[money];
    }
}
```

输出结果：

```java
请录入一个整数
4562
4562
大写：肆伍陆贰
补齐后的七位大写数字：零零零肆伍陆贰
插入单位后的结果：零佰零拾零万肆仟伍佰陆拾贰元
```

==小tips：ctrl+alt+T:可以用来包裹代码==

*案例：手机号屏蔽*

```java
String substring(int beginIndex,int endIndex)    //表示截取的意思（包头不包尾）
    只有返回值才是截取的小串

重载的方法如下
String substring(int beginIndex)		//截取到末尾
```

```java
package JAVAAPI.String;

public class demo9 {
    public static void main(String[] args) {
//        1.获取一个手机号码
        String phoneNumber = "13545826987";
//        2.截取手机号码前面的三位
        String phoneNumberBeginThree = phoneNumber.substring(0, 3);
//        3.截取手机号码后面四位
        String phoneNumberEndFour = phoneNumber.substring(7);
//        4.拼接
        String res=phoneNumberBeginThree+"****"+phoneNumberEndFour;
        System.out.println(res);
    }
}
```

输出结果

```java
135****6987
```


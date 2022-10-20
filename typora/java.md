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
- 引用数据类型



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

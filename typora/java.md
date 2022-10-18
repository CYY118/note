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

### 注释

说明性的信息

```java
单行注释			//注释信息
多行注释			/*注释信息*/
文档注释			/**注释信息*/
```

### 关键字

被Java赋予了特定含义的英文单词

```tex
关键字的字母全部小写
常用的代码编辑器，对关键字有特殊颜色标记
```

例如：

class：用于创建/定义一个类，类是java的最基本的组成单元

### 字面量

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


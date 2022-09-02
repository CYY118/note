# 一、线程简介

## （一）任务

1、多任务

例如：边吃饭边玩手机（实际大脑在同一个时间只做了一件事情）

2、多线程

例如：打游戏时一个人可以有两个账号

3、普通方法调用和多线程

![image-20220715110144100](D:\Typora\pritrue\image-20220715110144100.png)





普通方法：只有一条执行路径

多线程：多条路径各走各的（注意：将图二多线程中的run改为start），主线程和子线程交替执行

4、程序.进程.线程

一个进程可以有多个线程，如视频中同时听到声音，看图像，看弹幕，等等



![image-20220715110625223](D:\Typora\pritrue\image-20220715110625223.png)



5、Process与Thread

进程（Process）：是程序执行的过程

线程（Thread）：进程里面分为若干个线程

##### 核心

线程就是独立的执行路径；

在程序运行时，即使没有自己创建的线程，后台也会有多个线程，如主线程，gc线程；

main（）称之为主线程，是系统的入口，用于整个程序的执行；

线程的运行由调度器安排调度

资源强度问题，需要加入并发控制

#### 

# 二、线程实现（重点）

## （一）、线程创建

三种创建的方式：

thread class	继承thread类（重点）

runnable接口	实现runnable接口（重点）

callable接口		实现callable接口（了解）

#### **创建线程第一种方式（Thread）**

```
创建线程方式一：继承Thread类，重写run（）方法，调用start开启线程
```

自定义一个线程类继承Thread类

重写run()方法，编写线程执行体

创建线程对象，调用start()方法启动线程

```java
package com.yang.demo01;

//创建线程方式一：继承Thread类，重写run（）方法，调用start开启线程
public class TestThread1 extends Thread{
    @Override
    public void run() {
        //run方法线程体
//        super.run();
        for (int i = 0; i < 20; i++) {
            System.out.println("我在看代码---"+i);
        }
    }

    public static void main(String[] args) {
        //main线程，主线程

        //创建一个线程对象
        TestThread1 testThread1 = new TestThread1();
        //调用start方法开启线程
        testThread1.start();

        for (int i = 0; i < 20; i++) {
            System.out.println("我在学习多线程---"+i);
        }
    }
}

```



![image-20220715121836683](D:\Typora\pritrue\image-20220715121836683.png)



如上图可以看出他们是交替执行的

**例子：**java实现多线程同步下载图片

```java
package com.yang.demo01;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.net.URL;

//练习Thread。实现多线程同步下载图片
public class TestThread2 extends Thread{
    private String url; //网络图片地址
    private String name;    //保存的文件名

    //构造器
    public TestThread2(String url,String name){
        this.url=url;
        this.name=name;
    }
    //
    @Override
    public void run() {
        WebDownloader webDownloader = new WebDownloader();
        webDownloader.downloader(url,name);
        System.out.println("下载文件名为："+name);
    }

    public static void main(String[] args) {
        TestThread2 testThread1 = new TestThread2("http://39.106.62.65:8089/cyy/softproject/wenjian/202256121940_.jpg","1.jpg");
        TestThread2 testThread2 = new TestThread2("http://39.106.62.65:8089/cyy/softproject/wenjian/202256121940_.jpg","2.jpg");
        TestThread2 testThread3 = new TestThread2("http://39.106.62.65:8089/cyy/softproject/wenjian/202256121940_.jpg","3.jpg");
        //自我感觉下载顺序：1，2，3，其实不然。实际下载顺序是不确定的，因为线程不一定立即执行，而是由CPU安排调度
        testThread1.start();
        testThread2.start();
        testThread3.start();
    }
}

//下载器
class WebDownloader{
    //下载方法
    public void downloader(String url,String name){
        try {
            FileUtils.copyURLToFile(new URL(url),new File(name));
        }catch (IOException e){
            e.printStackTrace();
            System.out.println("IO异常，downloader方法出现问题");
        }


    }
}
```



自我感觉下载顺序：1，2，3，其实不然。实际下载顺序是不确定的，因为线程不一定立即执行，而是由CPU安排调度

实际下载顺序如下：

![image-20220715140513632](D:\Typora\pritrue\image-20220715140513632.png)

#### **创建线程第二种方式（Runnable）**

定义MyRunnable类实现Runnable接口

实现run（）方法，编写线程执行体

创建线程对象，调用start()方法启动线程

```java
package com.yang.demo01;

//创建线程方式二：实现runnable接口，重写run方法，执行线程需要丢入runnable接口实现类，调用start方法

public class TestThread3 implements Runnable{
    @Override
    public void run() {
        //run方法线程体
//        super.run();
        for (int i = 0; i < 20; i++) {
            System.out.println("我在看代码---"+i);
        }
    }

    public static void main(String[] args) {
        //main线程，主线程

        //创建runnable接口实现类对象
        TestThread3 testThread3 = new TestThread3();
        //创建线程对象,通过线程对象来开启我们的线程，代理
//        Thread thread = new Thread(testThread3);
//        thread.start();
        //上面两行代码简写如下：
        new Thread(testThread3).start();

        for (int i = 0; i < 20; i++) {
            System.out.println("我在学习多线程---"+i);
        }
    }
}

```

此方式和第一种方式差不多是一样的，只是该方法需要将接口实现类对象丢入到线程对象中并调用start()方法即可。

**小结:**

1. 继承Thread类

   - 子类继承Thread类具备多线程能力

   - 启动线程：子类对象.start()

   - <p style="color:red">不建议使用：避免OOP单继承局限性</p>

2. 实现Runnable接口

   - 实现接口Runnable具有多线程能力

   - 启动线程：传入目标对象+Thread对象start()

   - <p STYLE="color:red">推荐使用：避免单继承局限性，灵活方便，方便同一个对象被多个线程使用</p>

例子：简单的买票问题

```java
package com.yang.demo01;
//多个线程同时操作同一个对象
//买火车票的问题

//发现问题：多个线程操作同一个资源的情况下，线程不安全，数据紊乱
public class TestThread4 implements Runnable{
    //票数
    private int ticktNums = 10;

    @Override
    public void run() {
        while (true){
            if (ticktNums<=0){
                break;
            }
            //模拟延时
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(Thread.currentThread().getName()+"-->拿到了第--"+ticktNums+"--票");
            ticktNums--;
        }
    }

    public static void main(String[] args) {
        TestThread4 testThread4 = new TestThread4();
        new Thread(testThread4,"小明").start();
        new Thread(testThread4,"小黄").start();
        new Thread(testThread4,"小兰").start();
        new Thread(testThread4,"小红").start();
    }
}

```

发现问题：多个线程操作同一个资源的情况下，线程不安全，数据紊乱,如下图：

![image-20220715151053078](D:\Typora\pritrue\image-20220715151053078.png)



例子：龟兔赛跑-Race

1. 首先来一个赛道距离，然后要离终点越来越近（用for循环写）
2. 判断比赛是否结束（写一个gameOver的方法）
3. 打印出胜利者
4. 龟兔赛跑开始
5. 故事中是乌龟赢得，兔子需要睡觉，所以我们来模拟兔子睡觉
6. 终于，乌龟赢得比赛

```java
package com.yang.demo01;


//模拟龟兔赛跑
//实现了Runnable接口的多线程方法：将对象丢入到Thread线程对象中
public class Race implements Runnable{

    //胜利者
    private static String winner;


    @Override
    public void run() {
        for (int i = 0; i <= 100; i++) {
            //模拟兔子休息
            if (Thread.currentThread().getName().equals("兔子") && i%10==0){
                try {
                    Thread.sleep(1);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            //判断比赛是否结束
            boolean flag=gameOver(i);
            //如果比赛结束了，就停止程序
            if (flag){
                break;
            }
            System.out.println(Thread.currentThread().getName()+"-->跑了"+i+"步");
        }
    }

    //判断是否完成比赛
    private boolean gameOver(int steps){
        //判断是否有胜利者
        if (winner!=null){  //已经存在胜利者
            return true;
        }{
            if (steps>=100){
                winner=Thread.currentThread().getName();
                System.out.println("winner is "+winner);
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        Race race = new Race();
        new Thread(race,"兔子").start();
        new Thread(race,"乌龟").start();
    }
}

```

#### **创建线程第三种方式（Callable）**了解即可

1. 实现callable接口，需要返回值类型
2. 重写call方法，需要抛出异常
3. 创建目标对象
4. 创建执行服务 Executor Service ser =Executors.newFixedThreadPool(1);
5. 提交执行：Future<Boolean> result1 = ser.submit(t1);
6. 获取结果： boolean r1=result1.get();
7. 关闭服务：ser.shutdownNow();

例子：利用callable改造下载图片案例

```java
package com.yang.demo02;

import org.apache.commons.io.FileUtils;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.concurrent.*;

//线程创建方式三：实现Callable接口
/*
callable的好处
    1.可以定义返回值
    2.可以抛出异常
 */
public class TestCallable implements Callable<Boolean> {
    private String url; //网络图片地址
    private String name;    //保存的文件名

    //构造器
    public TestCallable(String url,String name){
        this.url=url;
        this.name=name;
    }
    //
    @Override
    public Boolean call() {
        WebDownloader webDownloader = new WebDownloader();
        webDownloader.downloader(url,name);
        System.out.println("下载文件名为："+name);
        return true;
    }

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        TestCallable testThread1 = new TestCallable("http://39.106.62.65:8089/cyy/softproject/wenjian/202256121940_.jpg","1.jpg");
        TestCallable testThread2 = new TestCallable("http://39.106.62.65:8089/cyy/softproject/wenjian/202256121940_.jpg","2.jpg");
        TestCallable testThread3 = new TestCallable("http://39.106.62.65:8089/cyy/softproject/wenjian/202256121940_.jpg","3.jpg");

        //1. 创建执行服务
        ExecutorService ser = Executors.newFixedThreadPool(3);
        //2. 提交执行：
        Future<Boolean> result1 = ser.submit(testThread1);
        Future<Boolean> result2 = ser.submit(testThread2);
        Future<Boolean> result3 = ser.submit(testThread3);
        //3. 获取结果：
        boolean r1=result1.get();
        boolean r2=result2.get();
        boolean r3=result3.get();
        //4. 关闭服务：
        ser.shutdownNow();
    }
}
//下载器
class WebDownloader{
    //下载方法
    public void downloader(String url,String name){
        try {
            FileUtils.copyURLToFile(new URL(url),new File(name));
        }catch (IOException e){
            e.printStackTrace();
            System.out.println("IO异常，downloader方法出现问题");
        }


    }
}

```

## （二）静态代理

```java
package com.yang.demo03;

public class StacticProxy {
    public static void main(String[] args) {
        You you = new You();    //你要结婚

        WeddingCompany weddingCompany = new WeddingCompany(you);    //把你交给结婚公司

        weddingCompany.HappyMarry();    
    }

}

interface Marry{
    /*
    人间四大喜事：
        1.久旱逢甘露
        2.他乡遇故知
        3.洞房花烛夜
        4.金榜题名时
     */
    void HappyMarry();
}
//真实角色，你去结婚
class You implements Marry{
    @Override
    public void HappyMarry() {
        System.out.println("小明要结婚了，超开心");
    }
}
//代理角色，帮助你去结婚
class WeddingCompany implements Marry{
    //代理谁--》真实目标角色
    private Marry target;

    public WeddingCompany(Marry target) {
        this.target = target;
    }

    @Override
    public void HappyMarry() {
        before();
        this.target.HappyMarry();	//这就是真实对象
        after();
    }

    private void after() {
        System.out.println("结婚之后，收尾款");
    }

    private void before() {
        System.out.println("结婚之前，布置现场");
    }
}
```

**静态代理模式总结：**

真实对象和代理对象都要实现同一个接口

代理对象要代理真实角色

**好处**

代理对象可以做很多真实对象做不了的事情

真实对象专注做自己的事情

## （三）Lambda表达式

- **为什么要使用Lambda表达式**
  - ​	避免匿名内部类定义过多
  - 可以让代码看起来更简洁
  - 去掉一堆没有意义的代码，只留下核心的逻辑

- 也许你会说，看了Lambda表达式，不但觉得不简洁，反而觉得更乱了，看不懂了。那是因为我们还没有使用习惯，用的多了，看习惯了，就好了

  

函数式接口：

​	任何接口，如果只包含唯一一个抽象方法，那么它就是一个函数式接口

​	对于函数式接口，我们可以通过Lambda表达式来创建该接口的对象

例子1：

```java
package com.yang.LambdaShow;

/*
推导lambda表达式
 */
public class TestLambda1 {
    //3.静态内部类
    static class Like2 implements ILike{
        //重写lambda方法
        @Override
        public void lambda() {
            System.out.println("I like lambda2");
        }
    }

    public static void main(String[] args) {
        ILike like = new Like();
        like.lambda();

        Like2 like2 = new Like2();
        like2.lambda();
        
        //4.局部内部类
        class Like3 implements ILike{
            //重写lambda方法
            @Override
            public void lambda() {
                System.out.println("I like lambda3");
            }
        }

        Like3 like3 = new Like3();
        like3.lambda();
        
        
        //5.匿名内部类，没有类的名称，必须借助接口或者父类
        like = new Like() {
            @Override
            public void lambda() {
                System.out.println("I like lambda4");
            }
        };
        like.lambda();

        //6.用lambda简化
        like = ()->{
            System.out.println("I like lambda5");
        };
        like.lambda();

    }

}
//1.定义一个接口
interface ILike{
    void lambda();
}
//2.实现类
class Like implements ILike{
    //重写lambda方法
    @Override
    public void lambda() {
        System.out.println("I like lambda");
    }
}
```



例子2：

```java
package com.yang.LambdaShow;

public class TestLambda2 {
    public static void main(String[] args) {
        ILove love;
        //lambda表达式简化
        love=(int a)->{
            System.out.println("I Love You2!-->"+a);
        };
        //简化1：去掉参数类型
        love=(a)->{
            System.out.println("I Love You3!-->"+a);
        };
        //简化2：去掉括号
        love=a->{
            System.out.println("I Love You4!-->"+a);
        };
        //简化3：去掉大括号
        love=a->System.out.println("I Love You5!-->"+a);
        //总结：
        /*
        lambda表达式只能有一行代码的情况下才能简化成为一行，如果有多行，那么就用代码块包裹
        前提是接口为函数式接口
        多个参数也可以去掉参数类型，要去掉就都去掉
         */
        love.love(520);

        //多个参数也可以去掉参数类型，要去掉就都去掉,必须加上括号
        ILoveTest loveTest;
        loveTest=(a,b,c)->System.out.println("I Love You6!-->"+a+"||"+b+"||"+c);
        loveTest.loveTest(520,521,"小美");
    }
}

interface ILove{
    void love(int a);
}

interface ILoveTest{
    void loveTest(int a,int b,String c);
}
```



# 三、线程状态

## （一）线程停止

例子：

```java
package com.yang.state;

public class TestStop implements Runnable{
    //设置一个标志位
    private boolean flag=true;

    @Override
    public void run() {
        int i=0;
        while (flag){
            System.out.println(Thread.currentThread().getName()+"--run.....Thread"+i++);
        }
    }
    //2.设置一个公开的方法停止线程，转换标志位
    public void stop(){
        this.flag=false;
    }

    public static void main(String[] args) {
        TestStop testStop = new TestStop();
        new Thread(testStop,"测试").start();

        for (int i = 0; i <=1000; i++) {
            System.out.println("main"+i);
            if (i==900){
                testStop.stop();
                System.out.println("该线程停止了！");
            }

        }


    }
}

```

输出结果：

```java
main892
main893
main894
main895
main896
main897
main898
main899
main900
测试--run.....Thread233
该线程停止了！
main901
main902
main903
```



# 四、线程同步（重点）

# 五、线程通信问题

# 六、高级主题
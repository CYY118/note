# Zookeeper介绍

zookeeper是一个开源的分布式的，伟分布式框架提供协调服务的Apache项目

![image-20230607090659032](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306070906119.png)

zookeeper理解：

> 是一个基于观察者模式设计的分布式服务管理框架，它负责存储和管理大家都关心的数据，然后接受观察者的注册，一旦这些数据的状态发生变化，zookeeper就将负责通知已经在zookeeper上注册的那些观察者做出相应的反应

zookeeper=文件系统+通知机制

## zookeeper特点

![image-20230607091625511](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306070916575.png)

1. Zookeeper：一个领导者（Leader），多个跟随者（Follower）组成的集群。
2. 集群中只要有半数以上节点存活，zookeeper集群就能正常服务，所以zookeeper适合安装奇数台服务器（效率更高）
3. 全局数据一致：每个server保存一份相同的数据副本，Client无论连接到哪个Server，数据都是一样的
4. 更新请求顺序执行，来自同一个Client的更新请求按其发送顺序依次执行
5. 数据更新原子性，一次数据更新要么成功，要么失败
6. 实时性，在一定时间范围内，Cilent能读到最新数据

## 数据结构

![image-20230607093250377](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306070932432.png)

zookeeper数据模型的结构与Unix文件系统很类似，整体上可以看作是一棵树，每个节点称作一个ZNode，meiyigeZNode默认能够存储MB的数据，每个ZNode都可以通过其路径唯一标识

## 应用场景

### 统一命名服务

在分布式环境下，经常需要对应用/服务进行统一命名，便于识别。（当然Nginx也可以实现同样的功能）

例如：IP不容易记住，而域名容易记忆

![image-20230607093553797](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306070935864.png)

### 统一配置管理

1. 分布式环境下，配置文件同步非常常见
   1. 一般要求一个集群中，所有节点的配置信息是一致的，比如Kafka集群
   2. 对配置文件修改后，希望能够快速同步到各个节点上
2. 配置管理可交由zookeeper实现
   1. 可将配置信息写入zookeeper上的一个ZNode
   2. 各个客户端服务器监听这个ZNode
   3. 一旦ZNode中的数据被修改，Zookeeper将通知各个客户端服务器

![image-20230607094108701](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306070941769.png)

### 统一集群管理

1. 分布式环境中，实时掌握每个结点的状态是必要的
   1. 可根据节点实时状态做出一些调整
2. zookeeper可以实现实时监控节点状态变化
   1. 可将节点信息写入Zookeeper上的一个ZNode
   2. 监听这个ZNode可获取它的实时状态变化

![image-20230607094743371](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306070947452.png)

### 服务器动态上下线

客户端能实时洞察到服务器上下线的变化

![image-20230607095017565](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306070950631.png)

### 软负载均衡

在zookeeper中记录每台服务器的访问数，让访问数最少的服务器去处理最新的客户端请求

![image-20230607095155968](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306070951026.png)

## 下载地址

官网首页

https://zookeeper.apache.org

# Zookeeper本地安装


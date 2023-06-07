# SpringCloud

> 三层架构 + MVC
>
> 框架：
>
> Spring	IOC	AOP
>
> SpringBoot，新一代的JavaEE开发标准，自动装配

微服务架构4个核心问题？

1. 服务很多，客户端该怎么访问？
2. 这么多服务？服务之间如何通信
3. 这么多服务，如何治理
4. 服务挂了怎么办

解决方案：

Spring Cloud	生态！ 		SpringBoot

1. Spring Cloud NetFlix 一站式解决方案！

   api网关，zuul组件

   Feign -----HttpClinet	---- Http通信方式，同步，阻塞

   服务注册发现：Eureka

   熔断机制：Hystrix

   .......

2. Apache Dubbo Zookeeper 半自动，需要整合别人的！

   API：没有，找第三方组件。或者自己实现

   Dubbo

   Zookeeper

   Dubbo这个方案并不是很完善

3. Spring Cloud Alibaba 一站式解决方案！更简单



新概念：服务网格~ Server Mesh

​	istio

1. API
2. HTTP,RPC
3. 注册和发现
4. 熔断机制
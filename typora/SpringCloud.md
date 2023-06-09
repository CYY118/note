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

SpringCloud,基于SpringBoot提供了一套微服务解决方案，包括服务注册与发现，配置中心，全链路监控，服务网关，负载均衡，熔断器等组件，除了基于NetFlix的开源组件做高度抽象封装之外，还有一些选型中立的开源组件

SpringCloud利用SpringBoot的开发便利性，巧妙地简化了分布式系统基础设施的开发，SpringCloud为开发人员提供供了快速构建分布式系统的一些工具，包括配置管理，服务发现，断路器，路由，微代理，事件总线，全局锁，决策竞选，分布式会话等等，他们都可以用SpringBoot的开发风格做到一键启动和部署。

SpringBoot并没有重复造轮子，它只是将目前各家公司开发的比较成熟，经得起实际考验的服务框架组合起来，通过SpringBoot风格进行再封装，屏蔽掉了复杂的配置和实现原理，最终给开发者留出了一套简单易懂，易部署和易维护的分布式系统开发工具包

SpringCloud是分布式微服务架构下的一站式解决方案，是各个微服务架构落地技术的集合体，俗称微服务全家桶

## SpringCloud和SpringBoot关系

- SpringBoot专注于快速方便的开发单个个体微服务
- SpringCloud是关注全局的微服务协调整理治理框架，它将SpringBoot开发的一个个单体微服务整合并管理起来，为各个微服务之间提供：配置管理，服务发现，断路器，路由，微代理，事件总线，全局锁，决策竞选，分布式会话等等集成服务
- SpringBoot可以离开SpringCloud独立使用，开发项目，但是SpringCloud离不开SpringBoot，属于依赖关系
- **SpringBoot专注于快速、方便的开发单个个体微服务，SpringCloud关注全局的服务治理框架****

## Dubbo和SpringCloud技术选型

1. 分布式+服务治理Dubbo

   目前成熟的互联网架构：应用服务化拆分+消息中间件

   ![image-20230607172745162](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202306071727358.png)

**对比**

| 名称         | Dubbo         | Spring                     |
| ------------ | ------------- | -------------------------- |
| 服务注册中心 | Zookeeper     | Spring Cloud Netfix Eureka |
| 服务调用方式 | RPC           | REST API                   |
| 服务监控     | Dubbo-monitor | SpringBoot Admin           |
| 断路器       | 不完善        | SpringCloud Netfix Hystrix |
| 服务网关     | 无            | Spring Cloud Netstrix Zuul |
| 分布式配置   | 无            | Spring Cloud Config        |
| 服务跟踪     | 无            | Spring Cloud Sleuth        |
| 消息总线     | 无            | Spring Cloud Bus           |
| 数据流       | 无            | Spring Cloud Stream        |
| 批量任务     | 无            | Spring Cloud Task          |

**最大区别：**SpringCloud抛弃了Dubbo的RPC通信，采用的是基于HTTP的REST方式

严格来说，这两种方式各有优劣，虽然从一定程度上来说，后者牺牲了服务调用的性能，但也避免了上面提到的原生RPC带来的问题，而且REST相比RPC更为灵活，服务提供方和调用方的依赖只依靠一纸契约，不存在代码级别的强依赖，这在强调快速演化的微服务环境下，显得更加合适。
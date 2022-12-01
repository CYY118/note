## SpringSecurity(安全)

在网站的开发中，安全是第一位的！过滤器，拦截器

功能性需求：否

==设计网站之初就需要考虑到安全性能==

![image-20221010214744102](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210102147269.png)

```te
Spring Security是一个功能强大、高度可定制的身份验证和访问控制框架。它是保护基于spring的应用程序的事实上的标准。
```

- 功能权限
- 访问权限
- 菜单权限
- 拦截器，过滤器，需要用到大量的原生代码 ~ 冗余太大

shiro、springSecurity：很像，除了类不一样，名字不一样

认证、授权（vip1、vip2...）

[Spring Security官网](https://spring.io/projects/spring-security)

记住这几个类：

- WebSecurityConfigurerAdapter：自定义Security策略
- AuthenticationManagerBuilder：自定义认证策略
- @EnableWebSecurity：开启认证WebSecurity模式，@EnableXXXXX  开启某个功能

SpringSecurity的两个主要目标是“认证”和“授权”（控制访问）

“认证”（Authentication）

“授权”（Authorization）

这个概念是通的，而不是只在SpringSecurity中存在


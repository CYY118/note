![image-20221128223451207](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211282234407.png)

[Apache Shiro 官网| Simple. Java. Security.](https://shiro.apache.org/)

## shiro中的认证

### 认证测试

一个简单的shiro小demo测试

```java
package com.yang;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.text.IniRealm;
import org.apache.shiro.subject.Subject;
/**
 * @author cyy
 * @ProjectName springboot-shiro
 * @Description
 * @time 2022/11/30 20:26
 */
public class ShiroAuthenticatorTest {
    public static void main(String[] args){
        // 1、创建安全管理器对象
        DefaultSecurityManager securityManager = new DefaultSecurityManager();
        // 2、给安全管理器设置realm
        securityManager.setRealm(new IniRealm("classpath:shiro.ini"));
        // 3、给全局安全工具类SecurityUtils设置安全管理器
        SecurityUtils.setSecurityManager(securityManager);
        // 4、拿到当前的subject
        Subject subject = SecurityUtils.getSubject();
        // 5、创建令牌
        AuthenticationToken token = new UsernamePasswordToken("lisi","l4");

        try {
            // 6、用户认证
            System.out.println("认证状态："+subject.isAuthenticated());
            subject.login(token);
            System.out.println("认证状态："+subject.isAuthenticated());
        } catch (UnknownAccountException e){
            e.printStackTrace();
            System.out.println("认证失败：用户不存在！");
        } catch (IncorrectCredentialsException e){
            e.printStackTrace();
            System.out.println("认证失败：密码不正确！");
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
```

```java
认证的几种状态

UnknownAccountException：用户名错误

IncorrectCredentialsException：密码错误

DisabledAccountException：账号被禁用

LockedAccountException：账号被锁定

ExcessiveAttemptsException：登录失败次数过多

ExpiredCredentialsException：凭证过期
```



**Shiro使用自定义Relam实现认证**

自定义realm

```java
package com.yang;


import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
/**
 * @author cyy
 * @ProjectName springboot-shiro
 * @Description 自定义realm 作用是将认证/授权数据的来源转为数据库实现
 * @time 2022/11/30 20:31
 */

public class CustomerRealm extends AuthorizingRealm {


    /*认证*/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        return null;
    }

    /*授权*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        /*在token中获取用户名*/
        Object principal = token.getPrincipal();
        /*根据身份信息使用jdbc/mybatis查询相关数据库信息*/
        if ("lisi".equals(principal)){
            /*参数1：返回数据库中正确的用户名，参数2：返回数据库中正确的密码，参数3：提供当前realm的名字 this.getName()*/
            SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(principal,"123",this.getName());
            return simpleAuthenticationInfo;
        }

        return null;
    }
}
```



测试类

```java
package com.yang;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;

/**
 * @author cyy
 * @ProjectName springboot-shiro
 * @Description 使用自定义Realm
 * @time 2022/12/1 11:07
 */
public class TestCustomerRealm {
    public static void main(String[] args) {
        /*创建securityManager*/
        DefaultSecurityManager securityManager = new DefaultSecurityManager();
        /*设置自定义Realm*/
        securityManager.setRealm(new CustomerRealm());
        /*将安全工具类设置为安全工具*/
        SecurityUtils.setSecurityManager(securityManager);
        /*通过安全工具类获取subject*/
        Subject subject = SecurityUtils.getSubject();
        /*创建token*/
        UsernamePasswordToken token = new UsernamePasswordToken("lisi", "123");

        try {
            subject.login(token);
            System.out.println("认证成功！"+subject.isAuthenticated());
        }catch (UnknownAccountException e){
            e.printStackTrace();
            System.out.println("认证失败：用户不存在！"+subject.isAuthenticated());
        } catch (IncorrectCredentialsException e){
            e.printStackTrace();
            System.out.println("认证失败：密码不正确！"+subject.isAuthenticated());
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
```



### 使用MD5和salt(随机盐)

MD5算法：

[MD5在线加密/解密/破解—MD5在线 (sojson.com)](https://www.sojson.com/md5/)

生成的结果始终是一个16进制的32位长度的字符串

tomcat.zip 	 tomcat.md5 用于校验tomcat是否下载完整

- 作用：一般用来加密 或者 签名（校验和）
- 特点：
  - MD5算法不可逆
  - 内容相同无论执行多少次md5生成的结果始终是一致的

练习：

```java
package com.yang;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * @author cyy
 * @ProjectName springboot-shiro
 * @Description 练习
 * @time 2022/12/1 16:20
 */
public class TestShiroMD5 {

    public static void main(String[] args) {
        /*创建一个md5算法*/
/*        Md5Hash md5Hash = new Md5Hash();
        md5Hash.setBytes("123".getBytes());
        String s = md5Hash.toHex();
        System.out.println("s = " + s);*/

        /*使用md5*/
        Md5Hash md5Hash1 = new Md5Hash("123");
        System.out.println(md5Hash1.toHex());

        /*使用md5+salt处理*/
        /*默认是将salt加在 123 的后面*/
        Md5Hash md5Hash2 = new Md5Hash("123","x0*7ps");
        System.out.println(md5Hash2.toHex());

        /*使用md5+salt+hash散列*/
        Md5Hash md5Hash3 = new Md5Hash("123","x0*7ps",1024);
        System.out.println(md5Hash3.toHex());
    }
}
```

练习：

```java
package com.yang.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

/**
 * @author cyy
 * @ProjectName springboot-shiro
 * @Description 使用自定义realm 并且加入md5+salt+hash
 * @time 2022/12/1 16:30
 */
public class CustomerMd5Realm extends AuthorizingRealm {
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        /*获取身份信息*/
        String principal = (String) token.getPrincipal();
        /*根据用户名查询数据库*/
        if ("lisi".equals(principal)){
/*            *//*使用md5*//*
            return new SimpleAuthenticationInfo(principal,"202cb962ac59075b964b07152d234b70",this.getName());*/

            /*使用md5+salt*/
//            参数1：数据库用户名，参数2：数据库md5+salt之后的密码，参数3：注册时的随机盐，参数4：realm的名字
/*            return new SimpleAuthenticationInfo(principal,
                    "c15be9a15a0a238084e0c5a846f3a7b4",
                    ByteSource.Util.bytes("x0*7ps"),
                    this.getName());*/

            /*使用md5+salt+hash散列*/
            return new SimpleAuthenticationInfo(principal,
                    "44c42bc682c33a4dae2af47eba4c8011",
                    ByteSource.Util.bytes("x0*7ps"),
                    this.getName());
        }
        return null;
    }
}
```

测试类：

```java
package com.yang;

import com.yang.realm.CustomerMd5Realm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;

/**
 * @author cyy
 * @ProjectName springboot-shiro
 * @Description
 * @time 2022/12/1 16:32
 */
public class TestCustomerMd5RealmAuthenicator {

    public static void main(String[] args) {
        /*创建安全管理器*/
        DefaultSecurityManager securityManager = new DefaultSecurityManager();
        /*注入realm*/
        CustomerMd5Realm realm = new CustomerMd5Realm();
        /*设置realm使用hash凭证匹配器*/
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        /*使用的算法*/
        credentialsMatcher.setHashAlgorithmName("md5");
        /*散列的次数*/
        credentialsMatcher.setHashIterations(1024);
        realm.setCredentialsMatcher(credentialsMatcher);
        securityManager.setRealm(realm);
        /*将安全管理器注入安全工具*/
        SecurityUtils.setSecurityManager(securityManager);
        /*通过安全工具类获取subject*/
        Subject subject = SecurityUtils.getSubject();

        /*认证*/
        UsernamePasswordToken token = new UsernamePasswordToken("lisi", "123");

        try {
            subject.login(token);
            System.out.println("登录成功！");
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            System.out.println("用户名错误，认证状态："+subject.isAuthenticated());
        }catch (IncorrectCredentialsException e){
            e.printStackTrace();
            System.out.println("密码错误，认证状态："+subject.isAuthenticated());
        }
    }
}
```

## shiro中的授权

### 授权

授权，即访问控制，控制谁可以访问哪些资源。主题进行身份认证后需要分配权限方可访问系统资源，对于某些资源没有权限是无法访问的。

### 关键对象

授权可以简单理解为who对what（which）进行How操作

who，即主体（subject），主题需要访问系统中的资源

what，即资源（Resource），如系统菜单，页面、按钮、类方法、系统商品。资源包括资源类型和资源实例，比如商品信息为资源类型，类型为t01的商品为资源实例，编号为001的商品信息也属于资源实例

How，权限/许可（Permission），规定了主体对资源的操作许可，==权限离开资源没有意义==，如用户查询权限、用户添加权限、某个类方法的调用权限、编号为001用户的修改权限等，通过权限可知主体对哪些资源都有都有哪些操作许可。

### 授权方式

- 基于角色的访问控制

  - RBAC基于角色的访问控制（Role-Based Access Control） 是以角色为中心进行访问控制

  ```java
  if(subject.hasRole("admin")){
    //操作什么资源  
  }
  ```

  

- 基于资源的访问控制

  - RBAC基于资源的访问控制（Resource-Based Access Control）  是以资源为中心进行访问控制

  ```java
  if(subject.isPermission("user:*:create")){
    //对所有的用户具有创建的权限
  }
  
  if(subject.isPermission("user:*:find")){
    //对所有的用户具有查看的权限
  }
  
  if(subject.isPermission("user:update:01")){
    //对01用户进行修改
  }
  ```

  

### 权限字符串

权限字符串的规则是：==资源标识符：操作：资源实例标识符==，意思是对哪个资源的哪个实例具有什么操作，”：“：是资源/操作/实例的分割符，权限字符串也可以使用 ”*“ 通配符

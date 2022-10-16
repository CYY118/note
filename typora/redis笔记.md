## 连接

使用命令：

`redis-cli -p 6379`

![image-20221007204309307](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210072043341.png)

如果设置了密码

```bash
root@iZ85rsdbnoqwbcZ:~# redis-cli -p 6379	#首先先去连接
127.0.0.1:6379> auth password			#使用auth命令后面跟密码回车即可登录成功
OK										#表示登录成功
127.0.0.1:6379>
```



## 性能测试

测试：`redis-benchmark -h localhost -p 6379 -c 100 -n 100000`

性能分析：

![image-20221007203709039](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210072037095.png)

## 基础的知识

redis默认是有16个数据库的（可以在redis.conf文件里面查看）

![image-20221007204059530](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210072040571.png)

默认使用的是第0个数据库

我们可以使用select进行切换数据库

如下使用：

![image-20221007204427330](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210072044369.png)

一些基础的命令：

```bash
127.0.0.1:6379> ping	#用来测试是否连接成功
PONG					#返回PONG表示连接成功
127.0.0.1:6379>
127.0.0.1:6379> select 5	#切换数据库
OK
127.0.0.1:6379[5]> bdsize
(error) ERR unknown command 'bdsize', with args beginning with:
127.0.0.1:6379[5]> dbsize	#查看数据库的大小
(integer) 0
127.0.0.1:6379[5]> set name yang	#向该数据库里面放入key value值（key：name；value：yang）
127.0.0.1:6379[5]> dbsize
(integer) 1
127.0.0.1:6379[5]> keys *	#查看所有的key
1) "name"
127.0.0.1:6379[5]> get name	 #获取key为name的值
"yang"
127.0.0.1:6379[5]> flushdb	#清空当前数据库
OK
127.0.0.1:6379[5]> keys *
(empty list or set)
127.0.0.1:6379> flushall	#清空所有数据库
OK
127.0.0.1:6379> exists name	#exists用于判断某个值是否存在 1：存在； 0：不存在
(integer) 1
127.0.0.1:6379> exists nameone
(integer) 0
127.0.0.1:6379> move name 1	#移除某个key值（后面的 1 表示的是当前的数据库）
(integer) 1
127.0.0.1:6379> keys *
(empty list or set)
127.0.0.1:6379> expire name 20	#设置key的过期时间 为20秒
(integer) 1
127.0.0.1:6379> ttl name 	#查看剩余过期时间
(integer) 15
127.0.0.1:6379> ttl name	#查看剩余过期时间
(integer) 3
127.0.0.1:6379> ttl name
(integer) -2				#当剩余国企时间为-2时表示 value已经过期了，没有了
127.0.0.1:6379> ttl name
(integer) -2
127.0.0.1:6379> get name	#当剩余国企时间为-2时表示 value已经过期了，没有了，
(nil)
127.0.0.1:6379> set name yang
OK
127.0.0.1:6379> type name	#查看当前key的类型
string
127.0.0.1:6379>
```



思考一个问题：为什么redis使用的是6379端口号？（了解一下）

```tex
Alessia Merz 是一位意大利舞女、女演员。 Redis 作者 Antirez 早年看电视节目，觉得 Merz 在节目中的一些话愚蠢可笑，Antirez 喜欢造“梗”用于平时和朋友们交流，于是造了一个词 "MERZ"，形容愚蠢，与 "stupid" 含义相同。

后来 Antirez 重新定义了 "MERZ" ，形容”具有很高的技术价值，包含技艺、耐心和劳动，但仍然保持简单本质“。

到了给 Redis 选择一个数字作为默认端口号时，Antirez 没有多想，把 "MERZ" 在手机键盘上对应的数字 6379 拿来用了。
```



> redis是单线程的！

redis十分快的，官方表示，redis是基于内存操作，cpu不是redis性能的瓶颈。redis的瓶颈是根据机器的内存和网络带宽，

redis是c语言写的  100000+的QPS

**reids为什么单线程还这么快？**

1. 误区一：高性能的服务器一定是多线程的！
2. 误区二：多线程一定比单线程效率高！

核心：redis是将所有的数据全部放在内存中的，所以说使用单线程操作的话效率是最高的，多线程（cpu上下文切换是一个耗时的操作）



![image-20221007211223400](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210072112477.png)

Redis是一个开源（BSD许可），内存存储的数据结构服务器，可用作==数据库==，==高速缓存==和==消息队列代理==。它支持[字符串](https://www.redis.net.cn/tutorial/3508.html)、[哈希表](https://www.redis.net.cn/tutorial/3509.html)、[列表](https://www.redis.net.cn/tutorial/3510.html)、[集合](https://www.redis.net.cn/tutorial/3511.html)、[有序集合](https://www.redis.net.cn/tutorial/3512.html)，[位图](https://www.redis.net.cn/tutorial/3508.html)，[hyperloglogs](https://www.redis.net.cn/tutorial/3513.html)等数据类型。内置复制、[Lua脚本](https://www.redis.net.cn/tutorial/3516.html)、LRU收回、[事务](https://www.redis.net.cn/tutorial/3515.html)以及不同级别磁盘持久化功能，同时通过Redis Sentinel提供高可用，通过Redis Cluster提供自动[分区](https://www.redis.net.cn/tutorial/3524.html)。

==[redis中文网](https://www.redis.net.cn/)==



## 五大基本数据类型

**redis-key**：

### String（字符串）

90%的java程序员使用redis只会使用一个String类型

```bash
127.0.0.1:6379> keys *
1) "name"
2) "key1"
127.0.0.1:6379> get name
"yang"
127.0.0.1:6379> append name "test"	#向key里面追加字符串，
									#如果当前key不存在，则新建key（相当于 set key）
(integer) 8							#返回的是key的长度
127.0.0.1:6379> get name
"yangtest"
############################################################################
127.0.0.1:6379> set test 0	#初始值
OK
127.0.0.1:6379> get test
"0"
127.0.0.1:6379> incr test	#加1操作
(integer) 1
127.0.0.1:6379> get test
"1"
127.0.0.1:6379> decr test	#减1操作
(integer) 0
127.0.0.1:6379> get test
"0"
127.0.0.1:6379> incrby test 10	#增加指定的步长
(integer) 10
127.0.0.1:6379> get test
"10"							#最终结果
127.0.0.1:6379> decrby test 5	#减去指定的步长
(integer) 5
127.0.0.1:6379> get test
"5"								#最终结果
127.0.0.1:6379>
############################################################################
127.0.0.1:6379> set msg "hello,world"
OK
127.0.0.1:6379> get msg
"hello,world"
127.0.0.1:6379> getrange msg 2 6	#截取指定字符串
"llo,w"
127.0.0.1:6379> getrange msg 0 -1	#查看所有字符串（和get key是一样的）
"hello,world"
127.0.0.1:6379> set keys abcdefg	#初始化key
OK
127.0.0.1:6379> get keys
"abcdefg"
127.0.0.1:6379> setrange keys 1 xx	#替换（相当于java中的re'plea）
(integer) 7
127.0.0.1:6379> get keys
"axxdefg"							#替换后的结果
127.0.0.1:6379>
#################################################################################
#setex(set with expire)			#设置过期时间
#setnx(set if not exist)		#不存在设置（在分布式锁中经常使用）
127.0.0.1:6379> setex key3 20 "caoyangyang"		#设置key3在20秒后过期
"OK"
127.0.0.1:6379> ttl key3
(integer) 13
127.0.0.1:6379> ttl key3
(integer) 3
127.0.0.1:6379> ttl key3
(integer) -2
127.0.0.1:6379> setnx mykey redis	#如果mykey不存在的话，设置mykey的值为redis（若不存在创建成功）
(integer) 1							#1表示设置成功
127.0.0.1:6379> keys *
1) "mykey"
2) "36f1680b-f1f2-45dc-870e-5956c704bcd7"
127.0.0.1:6379> setnx mykey test	#如果mykey不存在的话，设置mykey的值为test（若存在创建shi'b）
(integer) 0							#0表示设置失败
127.0.0.1:6379> get mykey			#查看mykey的值
"redis"
127.0.0.1:6379>
#################################################################################

#################################################################################
```



### Lits（列表）

![image-20221012104331376](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210121043492.png)

在redis里面，我们可以把list玩成、栈、队列、阻塞队列

所有的list命令都是用“l”开头的，redis不区分大小写命令

```bash
127.0.0.1:6379> keys *
(empty list or set)
127.0.0.1:6379> lpush list one	#将一个或者多个值，插入到列表的头部（左边）
(integer) 1
127.0.0.1:6379> lpush list two	#将一个或者多个值，插入到列表的头部（左边）
(integer) 2
127.0.0.1:6379> lpush list three	#将一个或者多个值，插入到列表的头部（左边）
(integer) 3
127.0.0.1:6379> get list			#不可以使用这样方法去获取列表中的值
(error) WRONGTYPE Operation against a key holding the wrong kind of value
127.0.0.1:6379> keys *
1) "list"
127.0.0.1:6379> lrange list 0 -1		#使用该方法获取列表中的值
1) "three"
2) "two"
3) "one"
127.0.0.1:6379> lrange list 0 1			#也可以获取指定区间的值
1) "three"
2) "two"
127.0.0.1:6379> rpush list right		#将一个或者多个值，插入到列表的尾部（右边）
(integer) 4
127.0.0.1:6379> lrange list 0 -1		
1) "three"
2) "two"
3) "one"
4) "right"
127.0.0.1:6379>
####################################################################
127.0.0.1:6379> lpop list		#移除列表的第一个元素（左边的第一个值）
"three"
127.0.0.1:6379> rpop list		#移除列表的最后一个元素（右边的第一个值）
"right"
127.0.0.1:6379> lrange list 0 -1	#查看list的所有的值
1) "two"
2) "one"
####################################################################
127.0.0.1:6379> lrange list 0 -1
1) "two"
2) "one"
127.0.0.1:6379> lindex list 1	#通过下标获取元素（下标从0开始）
"one"
127.0.0.1:6379> lindex list 0	#通过下标获得元素（下标从0开始）
"two"
####################################################################
127.0.0.1:6379> lpush list one
(integer) 3
127.0.0.1:6379> llen list		#返回列表的长度
(integer) 3						#列表的长度
127.0.0.1:6379>
####################################################################
移除指定的值：lrem
127.0.0.1:6379> lrange list 0 -1
1) "three"
2) "one"
3) "two"
4) "one"
127.0.0.1:6379> lrem list 1 three	#移除list集合中指定个数的value（移除一个指定的值）精确匹配
(integer) 1
127.0.0.1:6379> lrange list 0 -1
1) "one"
2) "two"
3) "one"
127.0.0.1:6379> lrem list 2 one		#移除list集合中指定个数的value（移除两个指定的值）精确匹配
(integer) 2
127.0.0.1:6379> lrange list 0 -1
1) "two"
127.0.0.1:6379>
####################################################################
trim 修剪：list截断！
127.0.0.1:6379> lrange list 0 -1
1) "four"
2) "three"
3) "one"
4) "two"
127.0.0.1:6379> ltrim list 1 2	#利用ltrim截取了下标从1到2的元素（截取指定的长度），已被修改
OK
127.0.0.1:6379> lrange list 0 -1	#如下是截取的结果
1) "three"
2) "one"
127.0.0.1:6379>

####################################################################
rpoplpush: #移除列表的最后一个元素，并将他移动到新的列表中
127.0.0.1:6379> lrange list 0 -1
1) "four"
2) "two"
3) "three"
4) "one"
127.0.0.1:6379> rpoplpush list mylist	#移除列表的最后一个元素，并将他移动到新的列表中
"one"
127.0.0.1:6379> lrange list 0 -1	#查看
1) "four"
2) "two"
3) "three"
127.0.0.1:6379> lrange mylist 0 -1		#查看目标列表
1) "one"
####################################################################
lset：将列表中指定下标值替换为另外一个值
127.0.0.1:6379> exists list			#exists判断list是否是存在的
(integer) 1							# 1：表示存在
127.0.0.1:6379> exists listone
(integer) 0							# 0：表示不存在
127.0.0.1:6379> lrange list 0 -1	#输出查看
1) "four"
2) "two"
3) "three"
127.0.0.1:6379> lset list 0 value	#如果存在的话，修改list下标为0的元素的值
OK
127.0.0.1:6379> lrange list 0 -1	#查看修改结果
1) "value"
2) "two"
3) "three"
127.0.0.1:6379> lset listone 0 123	#如果不存在的话，报错不存在
(error) ERR no such key
127.0.0.1:6379>
####################################################################
linsert：将某一个具体的value插入到列表某个元素的前面或者是后面
127.0.0.1:6379> keys *
(empty list or set)
127.0.0.1:6379> rpush lisy one
(integer) 1
127.0.0.1:6379> rpush lisy two
(integer) 2
127.0.0.1:6379> keys *
1) "lisy"
127.0.0.1:6379> lrange lisy 0 -1
1) "one"
2) "two"
127.0.0.1:6379> linsert lisy before one other	#往“one”的前面插入“other”
(integer) 3
127.0.0.1:6379> lrange lisy 0 -1
1) "other"
2) "one"
3) "two"
127.0.0.1:6379> linsert lisy after one oneafter		#往“one”的后面插入“oneafter”
(integer) 4
127.0.0.1:6379> lrange lisy 0 -1
1) "other"
2) "one"
3) "oneafter"
4) "two"
127.0.0.1:6379>

####################################################################
```

==小结==

- 它实际上是一个链表，before Node after 、left、right都可以插入值
- 如果key不存在，就会创建新的链表
- 如果key存在的话，就会新增内容
- 如果移除了所有的值，就是一个空链表，也代表是不存在！
- 在两边插入或者改动值，效率会比较高！如果是操作中间元素的话，相对来说效率会低一点~

可以用来消息排队！消息队列  `lpush rpop`

### Set（集合）

set中的值是不能重复的！

==无序不重复集合==

```bash
127.0.0.1:6379> keys *
(empty list or set)
127.0.0.1:6379> sadd myset hello		#set集合中添加元素
(integer) 1
127.0.0.1:6379> sadd myset yangstudy
(integer) 1
127.0.0.1:6379> sadd myset loveyangstudy
(integer) 1
127.0.0.1:6379> smembers myset			#查看指定的set的所有值
1) "hello"
2) "loveyangstudy"
3) "yangstudy"
127.0.0.1:6379> sismember myset hello	#判断某一个set值是不是在set集合中
(integer) 1								# 1：表示存在
127.0.0.1:6379> sismember myset world	
(integer) 0								# 0；表示不存在
127.0.0.1:6379> scard myset				#获取set集合的长度（内容元素个数）
(integer) 3
127.0.0.1:6379> sadd myset hello		#set中的值是不能重复添加的
(integer) 0								#返回 0 表示添加失败
####################################################################
127.0.0.1:6379> SREM myset hello		#移除myset中的hello
(integer) 1								#表示成功了
127.0.0.1:6379> SMEMBERS myset			#查看myset的值
1) "loveyangstudy"
2) "yangstudy"
####################################################################
127.0.0.1:6379> SRANDMEMBER myset		#随机抽选出一个元素
"yangstudy"
127.0.0.1:6379> SRANDMEMBER myset		#随机抽选出一个元素
"loveyangstudy"
127.0.0.1:6379> SRANDMEMBER myset 2		#随机抽选出指定个数的元素
1) "loveyangstudy"
2) "yangstudy"
127.0.0.1:6379>
####################################################################
移除一个key，随机的删除key
127.0.0.1:6379> SMEMBERS myset
1) "test"
2) "loveyangstudy"
3) "yangstudy"
127.0.0.1:6379> SPOP myset		#随即删除一些set集合中的元素
"loveyangstudy"
127.0.0.1:6379> SPOP myset
"yangstudy"
127.0.0.1:6379> SMEMBERS myset
1) "test"
127.0.0.1:6379>
####################################################################
将一个指定的值，移动到另外一个集合中
127.0.0.1:6379> sadd myset one
(integer) 1
127.0.0.1:6379> sadd myset two
(integer) 1
127.0.0.1:6379> sadd myset three
(integer) 1
127.0.0.1:6379> sadd myset2 one2
(integer) 1
127.0.0.1:6379> smove myset myset2 two		#将一个指定的值，移动到另外一个集合中
(integer) 1
127.0.0.1:6379> SMEMBERS myset2
1) "two"
2) "one2"
127.0.0.1:6379> SMEMBERS myset
1) "three"
2) "one"
####################################################################
127.0.0.1:6379> SMEMBERS myset
1) "three"
2) "test"
3) "one"
127.0.0.1:6379> SMEMBERS myset2
1) "two"
2) "test"
3) "one2"
127.0.0.1:6379> SDIFF myset myset2		#求两个集合的差集
1) "three"
2) "one"
127.0.0.1:6379> SINTER myset myset2		#求两个集合的交集
1) "test"
127.0.0.1:6379> SUNION myset myset2		#求两个集合的并集
1) "test"
2) "one"
3) "three"
4) "two"
5) "one2"
127.0.0.1:6379>
微博，A用户将所有关注的人放在一个set集合中！将它地粉丝也放在一个集合中！
共同关注，共同爱好，二度好友（六度分割理论），推荐好友
####################################################################
```

### Hash（哈希）

Map集合，key-<key,value>  ,key-map! 这个值是一个map集合！本质和String类型没有太大的区别！

```bash
127.0.0.1:6379> hset myhash fieldd1 yangstudy	#往myhash里面存放键值对fieldd1 yangstudy
(integer) 1
127.0.0.1:6379> hget myhash fieldd1
"yangstudy"
127.0.0.1:6379>hset myhash fieldd2 yangstudy2  #往myhash里面存放键值对fieldd2 yangstudy2
(integer) 1
127.0.0.1:6379> hget myhash fieldd1		#获取到某一个键！
"yangstudy"								#结果
127.0.0.1:6379> hget myhash
(error) ERR wrong number of arguments for 'hget' command
127.0.0.1:6379> hget myhash fieldd2		#获取到某一个键！
"yangstudy2"							#结果
127.0.0.1:6379> HMSET myhash test1 test1 test2 test2	#存放多个键值对
OK
127.0.0.1:6379> HMGET myhash test1 test2	#获取多个键
1) "test1"
2) "test2"
127.0.0.1:6379> HGETALL myhash		#获取hash中所有的值
1) "fieldd1"						#key
2) "yangstudy"						#value
3) "fieldd2"						#key
4) "yangstudy2"						#value
5) "test1"							#key
6) "test1"							#value
7) "test2"							#key
8) "test2"							#value
127.0.0.1:6379> HDEL myhash test1	#删除hash指定的key字段，对应的value值也就没有了
(integer) 1
127.0.0.1:6379> HGETALL myhash
1) "fieldd1"
2) "yangstudy"
3) "fieldd2"
4) "yangstudy2"
5) "test2"
6) "test2"
####################################################################
127.0.0.1:6379> HLEN myhash		#获取hash表的字段数量
(integer) 3
####################################################################
127.0.0.1:6379> HEXISTS myhash test2		#判断hash中的指定字段是否存在
(integer) 1
####################################################################
127.0.0.1:6379> HKEYS myhash	#获取hash的所有key
1) "fieldd1"
2) "fieldd2"
3) "test2"
127.0.0.1:6379> HVALS myhash	#获取hash的所有value
1) "yangstudy"
2) "yangstudy2"
3) "test2"
####################################################################
incr  decr
127.0.0.1:6379> hset myhash field 5		#指定增量
(integer) 1
127.0.0.1:6379> HKEYS myhash
1) "field"
127.0.0.1:6379> HINCRBY myhash field 1
(integer) 6
127.0.0.1:6379> HINCRBY myhash field -1
(integer) 5
127.0.0.1:6379> HSETNX myhash field4 hello		#如果不存在则可以设置
(integer) 1
127.0.0.1:6379> HSETNX myhash field4 world		#如果存在则不能设置（可以用在分布式锁里面）
(integer) 0
####################################################################
```

hash变更的数据 user name age，尤其是用户信息之类的，经常变动的信息！hash更适合于对象的存储，而String更适合字符串的使用

### Zset（有序集合）

在set的基础，增加了一个值，set k1 v1 zset k1 score1 v1

score1 ：1 2 3 ...

```bash
127.0.0.1:6379> ZADD myset 1 one		#添加一个值
(integer) 1
127.0.0.1:6379> ZADD myset 2 two 3 three		#添加多个值
(integer) 2
127.0.0.1:6379> zrange myset 0 -1
1) "one"
2) "two"
3) "three"
####################################################################
排序如何实现
#ZRANGEBYSCORE key min max
127.0.0.1:6379> ZADD salary 2500 xiaohong		#添加三个用户
(integer) 1
127.0.0.1:6379> ZADD salary 5000 zhangsan
(integer) 1
127.0.0.1:6379> ZADD salary 500 cyy
(integer) 1
127.0.0.1:6379> ZRANGEBYSCORE salary -inf +inf	#显示全部的用户，从小到大的排序
1) "cyy"
2) "xiaohong"
3) "zhangsan"
127.0.0.1:6379> ZREVRANGE salary 0 -1		#显示全部的用户，从大到小的排序
1) "zhangsan"
2) "cyy"
127.0.0.1:6379> ZRANGEBYSCORE salary -inf +inf withscores #显示全部的用户并且是附带成绩的，从小到大的排序
1) "cyy"
2) "500"
3) "xiaohong"
4) "2500"
5) "zhangsan"
6) "5000"
127.0.0.1:6379> ZRANGEBYSCORE salary -inf 2500 withscores #显示工资小于2500员工的升序排列
1) "cyy"
2) "500"
3) "xiaohong"
4) "2500"
####################################################################
移除元素（zrem）
127.0.0.1:6379> zrange salary 0 -1	#显示所有的用户
1) "cyy"
2) "xiaohong"
3) "zhangsan"
127.0.0.1:6379> zrem salary xiaohong	#移除有序集合中的指定元素
(integer) 1
127.0.0.1:6379> zrange salary 0 -1		#显示所有的用户
1) "cyy"
2) "zhangsan"
127.0.0.1:6379> ZCARD salary		#获取有序集合中的个数
(integer) 2
####################################################################
127.0.0.1:6379> ZADD myset 4 world 5 yangstudy
(integer) 2
127.0.0.1:6379> zrange myset 0 -1
1) "one"
2) "two"
3) "three"
4) "world"
5) "yangstudy"
127.0.0.1:6379> zcount myset 1 3		#获取指定区间的成员数量
(integer) 3
####################################################################
```

其余的一些API，如果工作中有需要，此时需要去查看官方文档

案例思路：set 排序 存储班级成绩表 工资表排序！、

普通消息：1.重要消息 2.带权重进行判断！

排行榜应用实现



## 三种特殊数据类型

### geospatial地理位置

朋友的定位，附近的人，打车距离计算

Redis的Geo在redis3.2版本就推出了！这个功能可以推算地理位置的信息，两地之间距离，方圆几里地人

可以查询一些测试数据 [城市经纬度查询-国内城市经度纬度在线查询工具 (jsons.cn)](http://www.jsons.cn/lngcode/)

![image-20221013160901468](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210131609605.png)

> getadd

```bash
#getadd 添加地理位置
#规则：两极是无法添加的，一般会下载城市数据，直接通过java程序一次性导入！
#有效的经度：-180°~180°
#有效的纬度：-85.0511°~85.0511°
								# 经度		纬度		名称
127.0.0.1:6379> GEOADD china:city 106.278179 38.46637 yinchuan
(integer) 1
127.0.0.1:6379> GEOADD china:city 116.405285 39.904989 beijing
(integer) 1
127.0.0.1:6379> GEOADD china:city 121.472644 31.231706 shanghai
(integer) 1
127.0.0.1:6379> GEOADD china:city 106.504962 29.533155 chongqi
(integer) 1
127.0.0.1:6379> GEOADD china:city 120.153576 30.287459 hangzhou
(integer) 1
127.0.0.1:6379> GEOADD china:city 108.948024 34.263161 xian
(integer) 1
```

> getpos

获得当前定位：一定是一个坐标

```bash
127.0.0.1:6379> GEOPOS china:city beijing		#获取指定城市的经度和纬度！
1) 1) "116.40528291463851929"
   2) "39.9049884229125027"
127.0.0.1:6379> GEOPOS china:city xian
1) 1) "108.94802302122116089"
   2) "34.2631604414749944"
127.0.0.1:6379> GEOPOS china:city yinchuan
1) 1) "106.27817898988723755"
   2) "38.46636940811229266"
127.0.0.1:6379>

```

> geodist

两人之间的距离

```bash
127.0.0.1:6379> GEODIST china:city beijing shanghai
"1067597.9668"
127.0.0.1:6379> GEODIST china:city beijing shanghai km		#查询北京到上海的直线距离（单位km）
"1067.5980"
```

![image-20221013164156362](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210131641442.png)

两者相比差不多

> georedius

我附近的人？（获取所有附近的人的地址，定位！）

获得指定数量的人

```bash
127.0.0.1:6379> GEORADIUS china:city 110 30 1000 km	#获取以110 30这个经纬度为中心，寻找方圆1000km内的城市（所有的数据应该都要录入）
1) "chongqi"
2) "xian"
3) "hangzhou"
127.0.0.1:6379> GEORADIUS china:city 110 30 500 km	#显示周围的人
1) "chongqi"
2) "xian"
127.0.0.1:6379> GEORADIUS china:city 110 30 500 km withdist	#显示到中间距离的位置
1) 1) "chongqi"
   2) "341.4052"
2) 1) "xian"
   2) "484.4073"
127.0.0.1:6379> GEORADIUS china:city 110 30 500 km withdist withcoord count 1  #显示到中间距离的位置，并且显示周围人的定位信息
1) 1) "chongqi"
   2) "341.4052"
   3) 1) "106.50495976209640503"
      2) "29.53315530684997015"
127.0.0.1:6379>
```

>GEORADIUSBYMEMBER

```bash
#找出位于指定元素周围的其他元素
127.0.0.1:6379> GEORADIUSBYMEMBER china:city beijing 1000 km
1) "beijing"
2) "xian"
3) "yinchuan"
127.0.0.1:6379>
```

> geohash

将二维的经纬度转换为一维的字符串，如果两个字符串长得越像，则地理位置越接近

该命令将返回11个字符的geohash字符串

```bash
127.0.0.1:6379> GEOHASH china:city beijing
1) "wx4g0b7xrt0"
127.0.0.1:6379> GEOHASH china:city beijing shanghai
1) "wx4g0b7xrt0"
2) "wtw3sjt9vg0"
127.0.0.1:6379>
```

> geo的原理就是使用zset！所以我们也可使用zset来操作这个命令

```bash
127.0.0.1:6379> ZRANGE china:city 0 -1		3可以使用zrange
1) "chongqi"
2) "xian"
3) "yinchuan"
4) "hangzhou"
5) "shanghai"
6) "beijing"
127.0.0.1:6379>
```

### hyperloglog基数统计

> 什么是基数？

```tex
A{1,3,5,7,8,7}	B{1,3,5,7,8}
```

基数（不重复的元素），是可以接收误差的

所以A和B的基数=5

redis hyperloglog基数统计的算法！

优点：占用的内存是固定的，2^64不同元素的技术，只需要花费12KB内存！如果从内存的角度来比较的话hyperloglog是首选

**网页的UV（一个人访问一个网站多次，但是还是算作一个人！）**网站的访问量

传统的方式，set保存用户的id，然后统计set中的元素数量作为标准判断！

这个时候如果保存大量的用户id，就会比较麻烦！此处的目的是为了计数，而不是为了保存用户id；

0.81%的错误率！统计UV任务，可以忽略不计的

```bash
							#测试使用#
127.0.0.1:6379> PFADD mykey a b c d e f g h i j		#创建第一组元素mykey
(integer) 1
127.0.0.1:6379> PFCOUNT mykey						#统计mykey中元素的基数数量
(integer) 10
127.0.0.1:6379> PFADD mykey2 i j z x c v b n m		#创建第一组元素mykey2
(integer) 1
127.0.0.1:6379> PFCOUNT mykey2
(integer) 9
127.0.0.1:6379> PFMERGE mykey3 mykey mykey2			#合并两组mykey mykey2 =>mykey3 并集数量
OK
127.0.0.1:6379> PFCOUNT mykey3						#查看并集的数量
(integer) 15
127.0.0.1:6379>
```

如果允许容错那么就可以使用hyperloglog，反之亦然！可以使用传统方式

### Bitmaps

> 位存储

**应用场景：**

统计疫情感染人数：0 1 0 1 1 0

统计用户信息（活跃，不活跃！登录，未登录！打卡，未打卡），例如这样两个状态的都可以使用Bitmaps！

bitmap位图，数据结构！都是操作二进制位来进行记录，就只有0 和 1 两个状态！

365天=365bit	1字节=8bit  大约46个字节左右！

```bash
#使用Bitmaps来记录周一到周日的打卡！
127.0.0.1:6379> SETBIT sign 0 1		#周一
(integer) 0
127.0.0.1:6379> SETBIT sign 1 0		#周二
(integer) 0
127.0.0.1:6379> SETBIT sign 2 0		#周三
(integer) 0
127.0.0.1:6379> SETBIT sign 3 1
(integer) 0
127.0.0.1:6379> SETBIT sign 4 1
(integer) 0
127.0.0.1:6379> SETBIT sign 5 0
(integer) 0
127.0.0.1:6379> SETBIT sign 6 0
```

查看某一天是否有打卡

```bash
127.0.0.1:6379> getbit sign 3		#查看周四有没有打卡
(integer) 1
127.0.0.1:6379> getbit sign 1		#查看周二有没有打卡
(integer) 0
```

统计操作，统计打卡的天数

```bash
127.0.0.1:6379> BITCOUNT sign		#统计该周的打卡记录
(integer) 3
127.0.0.1:6379>
```

## 事务

在MySQL中事务是具有原子性：要么同时成功，要么同时失败！

==Redis单挑命令式保存原子性的，但是事务不保证原子性！==

Redis事务的本质：一组命令的集合！一个事务中的所有命令都会被序列化，在事务执行过程中，会按照顺序执行！

一次性、顺序性、排他性  执行一系列的命令

==Redis事务没有隔离级别的概念==

所有的命令在事务中，并没有直接执行，只有发起执行命令的时候才会执行！ exec

锁：redis可以实现乐观锁

Redis的事务：

- 开启事务（MULTI）
- 命令入队（....）
- 执行事务（exec）

> 正常执行事务

```bash
127.0.0.1:6379> MULTI			#开启事务
OK
127.0.0.1:6379> set k1 v1		#命令入队
QUEUED
127.0.0.1:6379> set k2 v2		#命令入队
QUEUED
127.0.0.1:6379> get k2			#命令入队
QUEUED
127.0.0.1:6379> set k3 v3		#命令入队
QUEUED
127.0.0.1:6379> exec			#执行事务
1) OK							#结果如下
2) OK
3) "v2"
4) OK
127.0.0.1:6379>
```

> 放弃事务

```bash
127.0.0.1:6379> MULTI			#开启事务
OK
127.0.0.1:6379> set k1 v1		#命令入队
QUEUED
127.0.0.1:6379> set k2 v2		#命令入队
QUEUED
127.0.0.1:6379> set k4 v4		#命令入队
QUEUED
127.0.0.1:6379> DISCARD			#放弃事务（取消事务），事务中的命令都不会被执行
OK
127.0.0.1:6379> get k4
(nil)
127.0.0.1:6379>
```

> 编译型异常（java中是代码有问题！redis中是命令有错），事务中所有的命令都不会被执行！

```bash
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379> set k1 v1
QUEUED
127.0.0.1:6379> set k2 v2
QUEUED
127.0.0.1:6379> getset k3		#命令错误，出现错误
(error) ERR wrong number of arguments for 'getset' command
127.0.0.1:6379> set k3 v3
QUEUED
127.0.0.1:6379> set k4 v4
QUEUED
127.0.0.1:6379> EXEC			#事务执行时报错！所有都不会被执行
(error) EXECABORT Transaction discarded because of previous errors.
127.0.0.1:6379>
```

> 运行时异常（1/0），如果事务队列中存在语法性，那么执行命令的时候，其他命令是可以正常执行的，错误命令抛出异常

```bash
127.0.0.1:6379> set k1 "v1"		#
OK
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379> incr k1			#字符串类型不能加一操作，在执行的时候会报错失败
QUEUED
127.0.0.1:6379> set k2 v2
QUEUED
127.0.0.1:6379> set k3 v3
QUEUED
127.0.0.1:6379> get v3
QUEUED
127.0.0.1:6379> EXEC
1) (error) ERR value is not an integer or out of range	#虽然第一条命令报错了，但是依旧正常执行成功了！
2) OK
3) OK
4) (nil)
127.0.0.1:6379> keys *
1) "k1"
2) "k2"
3) "k3"
127.0.0.1:6379>
```

> 监控！	watch（面试常问）

**悲观锁：**

- 很悲观，认为什么时候都会出问题，无论什么时候都会加锁！用完之后会解锁

**乐观锁：**

- 很乐观，认为什么都不会出现问题，所以不会上锁！更i性能数据的时候去判断一下，在此期间是否有人修改过这个数据，version
- 获取version
- 更新的时候比较version

> Redis监视测试

```bash
#正常执行成功
127.0.0.1:6379> set money 100
OK
127.0.0.1:6379> set out 0
OK
127.0.0.1:6379> WATCH money			#监视money
OK
127.0.0.1:6379> MULTI		#事务
OK
127.0.0.1:6379> DECRBY money 20
QUEUED
127.0.0.1:6379> INCRBY out 20
QUEUED
127.0.0.1:6379> EXEC	#事务正常结束，数据期间没有发生变动，这个时候就正常执行成功了
1) (integer) 80
2) (integer) 20
127.0.0.1:6379>
```

测试多线程修改值！使用watch充当乐观锁操作

```bash
127.0.0.1:6379> WATCH money		#监视money
OK
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379> DECRBY money 10
QUEUED
127.0.0.1:6379> INCRBY out 10
QUEUED
127.0.0.1:6379> EXEC		#执行之前另外一个线程修改了money的值，这个时候就会导致事务执行失败
(nil)
```

应该这样做

```bash
127.0.0.1:6379> UNWATCH			#1.如果发现事务执行失败，就先解锁
OK
127.0.0.1:6379> WATCH money		#2.获取最新的值，再次监视 select version
OK
127.0.0.1:6379> MULTI
OK
127.0.0.1:6379> DECRBY money 10
QUEUED
127.0.0.1:6379> INCRBY out 10
QUEUED
127.0.0.1:6379> EXEC			#3.对比监视的值是否发生变化，如果没有变化，那么可以执行成功，如果变化了就执行失败
1) (integer) 990
2) (integer) 30
127.0.0.1:6379>
```

如果修改失败，获取最新的值可以了

## Jedis

需要使用Java来操作Redis

> 什么是Jedis  是redis官方推荐的java连接开发工具！使用Java来操作Redis中间件！如果你要使用java操作redis，那么一定要十分的熟悉！（慢慢来吧，很快的！）

1.导入对应的依赖

```xml
        <!-- https://mvnrepository.com/artifact/redis.clients/jedis -->
        <dependency>
            <groupId>redis.clients</groupId>
            <artifactId>jedis</artifactId>
            <version>3.3.0</version>
        </dependency>
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>fastjson</artifactId>
            <version>1.2.67_noneautotype2</version>
        </dependency>
```

2.编码测试：

- 连接数据库
- 操作命令
- 断开连接！

```java
package com;

import redis.clients.jedis.Jedis;

public class TetsPing {
    public static void main(String[] args) {
//        1.new Jedis对象即可
        Jedis jedis = new Jedis("xx.xx.xx.xx",6379);
        jedis.auth("xxxx");	//输入密码
//        jedis所有的命令就是我们之前学习的所有指令
        System.out.println(jedis.ping());	//测试链接
        jedis.close();/*关闭连接*/
    }
}

```

输出：

![image-20221014153554234](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210141535429.png)

常用的API

>jedis所有的命令就是我们之前学习的所有指令

==jedis所有的命令就是我们之前学习的所有指令==

```java
package com.yang;

import redis.clients.jedis.Jedis;

import java.util.concurrent.TimeUnit;

/**
 * Created by cyy
 * Time on 2022-10-14
 */
public class TestString {
    public static void main(String[] args) {
        Jedis jedis = new Jedis(""xx.xx.xx.xx", 6379);
        jedis.auth("xxxx");	//输入密码
        jedis.flushDB();
        System.out.println("===========增加数据===========");
        System.out.println(jedis.set("key1","value1"));
        System.out.println(jedis.set("key2","value2"));
        System.out.println(jedis.set("key3", "value3"));
        System.out.println("删除键key2:"+jedis.del("key2"));
        System.out.println("获取键key2:"+jedis.get("key2"));
        System.out.println("修改key1:"+jedis.set("key1", "value1Changed"));
        System.out.println("获取key1的值："+jedis.get("key1"));
        System.out.println("在key3后面加入值："+jedis.append("key3", "End"));
        System.out.println("key3的值："+jedis.get("key3"));
        System.out.println("增加多个键值对："+jedis.mset("key01","value01","key02","value02","key03","value03"));
        System.out.println("获取多个键值对："+jedis.mget("key01","key02","key03"));
        System.out.println("获取多个键值对："+jedis.mget("key01","key02","key03","key04"));
        System.out.println("删除多个键值对："+jedis.del("key01","key02"));
        System.out.println("获取多个键值对："+jedis.mget("key01","key02","key03"));

        jedis.flushDB();
        System.out.println("===========新增键值对防止覆盖原先值==============");
        System.out.println(jedis.setnx("key1", "value1"));
        System.out.println(jedis.setnx("key2", "value2"));
        System.out.println(jedis.setnx("key2", "value2-new"));
        System.out.println(jedis.get("key1"));
        System.out.println(jedis.get("key2"));

        System.out.println("===========新增键值对并设置有效时间=============");
        System.out.println(jedis.setex("key3", 2, "value3"));
        System.out.println(jedis.get("key3"));
        try {
            TimeUnit.SECONDS.sleep(3);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(jedis.get("key3"));

        System.out.println("===========获取原值，更新为新值==========");
        System.out.println(jedis.getSet("key2", "key2GetSet"));
        System.out.println(jedis.get("key2"));

        System.out.println("获得key2的值的字串："+jedis.getrange("key2", 2, 4));
    }
}
```

> ==如果不知道哪个方法了就去到五大基本数据类型去查找方法==

### 事务

```java
package com.yang;

import com.alibaba.fastjson.JSONObject;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

public class TestTX {
    public static void main(String[] args) {
//        1.new Jedis对象即可
        Jedis jedis = new Jedis("39.106.62.65",6379);
        jedis.auth("caoyangyang");
//        jedis所有的命令就是我们之前学习的所有指令
        System.out.println(jedis.ping());       //测试链接

        JSONObject jsonObject = new JSONObject();   /*new一个JSONObject*/
        jsonObject.put("msg","hello,world");
        jsonObject.put("name","yang");
        /*开启事务*/
        Transaction multi = jedis.multi();
        /*开始事务的操作*/
        String s = jsonObject.toJSONString();

        try {
            multi.set("user1",s);
            multi.set("user2",s);
            //int i=1/0;  /*此处代码抛出异常，事务执行失败*/
            multi.exec();       /*提交并执行事务*/
        }catch (Exception e){
            multi.discard();    /*放弃事务*/
            e.printStackTrace();
        }finally {
            System.out.println(jedis.get("user1")); /**/
            System.out.println(jedis.get("user2"));
            jedis.close();/*关闭连接*/
        }
    }
}
```

输出：

![image-20221014155942997](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210141559106.png)

解开：int i=1/0;

输出如下：

![image-20221014160104623](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210141601726.png)

## SpringBoot整合

SpringBoot操作数据：spring-data 

SpringData也是和SpringBoot齐名的项目

说明：在SpringBoot2.x之后，原来使用的jedis被替换成了lettuce

jedis：采用的是直连多个线程操作的话，是不安全的，如果想要避免不安全的，就需要使用jedis pool连接池！更像BIO模式

lettuce：采用netty，实力可以在多个线程中共享，不存在线程不安全的情况！可以减少线程数量。更像NIO模式

> 整合测试一下

1. 导入依赖

   ```xml
   <!--        操作redis-->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-data-redis</artifactId>
           </dependency>
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-web</artifactId>
           </dependency>
   
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-devtools</artifactId>
               <scope>runtime</scope>
               <optional>true</optional>
           </dependency>
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-configuration-processor</artifactId>
               <optional>true</optional>
           </dependency>
           <dependency>
               <groupId>org.projectlombok</groupId>
               <artifactId>lombok</artifactId>
               <optional>true</optional>
           </dependency>
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-test</artifactId>
               <scope>test</scope>
           </dependency>
   ```

   

2. 配置连接

   ```yaml
   # SpringBoot所有的配置类，都有一个自动配置类
   # 自动配置类都会绑定一个properties配置文件
   # 配置redis
   spring:
     redis:
       host: xx.xx.xx.xx
       port: 6379
       password: xxxxxxxx
   
   ```

   

3. 测试

   ```java
   package com.yang;
   
   import org.junit.jupiter.api.Test;
   import org.springframework.boot.test.context.SpringBootTest;
   import org.springframework.data.redis.core.RedisTemplate;
   
   import javax.annotation.Resource;
   
   @SpringBootTest
   class Redis02SpringbootApplicationTests {
   
       @Resource
       private RedisTemplate<String, String> redisTemplate;
   
       @Test
       void contextLoads() {
   //        redisTemplate     操作不同类型的数据，api和我们的指令是一样的
   //        redisTemplate.opsForValue()       操作字符串  类似于String
   //        redisTemplate.opsForList()        操作List   类似于List
           
   //        获取redis的连接对象
   //        RedisConnection connection = redisTemplate.getConnectionFactory().getConnection();
   //        connection.flushDb();
   //        connection.flushAll();
           
           redisTemplate.opsForValue().set("Spring","test");
       }
   }
   ```

效果：

![image-20221014163255950](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210141632060.png)

出现乱码是因为没有序列化

如下是一些默认的序列化配置

![image-20221014164058944](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210141640067.png)

所以我们在这里自定义  `RedisTemplate`  进行序列化

具体代码如下：

```java
package com.yang.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {
    /**
     * 自定义 RedisTemplate
     * 固定模板，以后可以直接使用
     * @param factory
     * @return
     */
    @Bean
    @SuppressWarnings("all")
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        // 为开发方便，一般直接使用 <String, Object>
        RedisTemplate<String, Object> template = new RedisTemplate<String, Object>();
        template.setConnectionFactory(factory);

        // Json序列化配置
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);

        // String 的序列化
        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();
        // key采用String的序列化方式
        template.setKeySerializer(stringRedisSerializer);
        // hash的key也采用String的序列化方式
        template.setHashKeySerializer(stringRedisSerializer);
        // value序列化方式采用jackson
        template.setValueSerializer(jackson2JsonRedisSerializer);
        // hash的value序列化方式采用jackson
        template.setHashValueSerializer(jackson2JsonRedisSerializer);
        template.afterPropertiesSet();
        return template;
    }
}

```

配置了序列化的redis的存储结果为：

![image-20221014164947621](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210141649723.png)




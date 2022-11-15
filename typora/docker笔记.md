# Docker学习笔记

[docker中文文档 (coonote.com)](https://www.coonote.com/docker/docker-tutorial.html)

==弱小和无知不是生存的障碍，傲慢才是==

即使再小的帆也能远航

知道的越多，不知道的就越多（卷卷卷...）

> 学前准备
>
> linux基础，springboot基础

# Docker概述

> Docker学习

- docker概述
- docker安装
- docker命令
  - 镜像命令
  - 容器命令
  - 操作命令
- docker镜像
- 容器数据卷
- dockerFile
- docker网络原理（计算机网络原理的基础）
- Idea整合docker
- docker compose （集群）
- docker swarm
- CI / CD Jenkins

## Docker为什么会出现？

一款产品：开发--上线 两套环境！应用环境，应用配置！

运维人员：

java开发：开发即运维！

环境配置十分麻烦，每一台机器都要部署环境（集群redis）,费时费力

现在：开发打包部署上线，一套流程完成！

docker的方案，提出解决这种费时费力的工作的解决方案

![image-20221110112620003](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101126182.png)

docker通过隔离机制，可以将服务器利用到极致

本质：所有的技术都是因为出现了一些问题，我们需要去解决，去学习

## Docker的历史

2010年，美国成立了一家公司`dotCloud`

做一些pass的云计算服务！LXC有关的容器技术！

该公司将自己的技术（容器化技术）命名 就是Docker！

Docker诞生的时候，没有引起行业的注意！dotCloud公司变的困难

选择`开源`

开放源码！

2013年，Docker开源！慢慢的越来越多的人发现了docker的优点，所以就火了

2014年4月，Docker1.0发布！

火的原因：相对于虚拟机技术，更加的轻巧

虚拟机：在window中装一个Vmware，通过这个软件可以虚拟出一个或者多台电脑！笨重！

虚拟机也是属于虚拟化技术，Docker容器技术，也是一种虚拟化技术！

```java
Vmware：隔离，需要开启多个虚拟机！几个G   启动需要几分钟 笨重
docker:隔离，镜像（最核心的环境 4BM + jdk + mysql）十分的小巧，运行镜像就可以了！小巧！ 秒级启动
```

到现在，所有开发人员都必须要会的一种技术（重要）

Docker是基于go语言开发的

[Docker官方文档](https://docs.docker.com/)![image-20221110114535177](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101145234.png)

## Docker能干嘛

虚拟机技术缺点：

- 资源占用十分多
- 荣誉步骤多
- 启动慢

容器化技术：

==也是一个虚拟机，但是并不是一个完整的虚拟机==

这个虚拟机是用到什么虚拟机里面就安装什么

比较docker和虚拟机技术的不同：

- 传统虚拟机，虚拟出一条硬件，运行一个完整的操作系统，然后在这个系统上安装和运行软件
- 容器内的应用直接运行在宿主机的内容，容器是没有自己的内核的，也灭虚拟我们的硬件，所以就轻便了
- 每个容器间是相互隔离的，每个容器内都有一个属于自己的文件系统，互不影响

> DevOps(开发，运维)

更快速的交付和部署

传统：一堆帮助文档，安装程序

docker：一键运行，打包镜像，发布测试

**更便捷的升级和扩缩容**

使用了docker之后，我们部署应用就和搭积木一样！

项目打包为一个镜像，扩展 服务器A！服务器B

**更简单的系统运维**

在容器化之后，我们的开发，测试环境都是高度一致的。

**更高效的计算资源利用**

1核 2g的服务器  使用了docker之后，就可以运行很多的项目了

docker 是 内核级别的虚拟化，可以在一个物理机器上可以运行很多的容器实例！

docker  可以将服务器的性能压榨到极致！

# Docker安装

## Docker的基本组成

![image-20221110120641852](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101206962.png)



​					客户端													服务器														仓库

**镜像（image）:**

docker镜像就好比是一个模板，可以通过这个模板来创建容器服务，tomcat镜像===》run=》tomcat01容器（提供服务器），通过这个奖项可以创建多个容器（最终服务项目运行或者项目运行就是在容器中的）

**容器（container）**：

目前就可以把这个容器理解为一个简易的linux系统

**仓库（repository）**：

仓库就是存放镜像的地方！

仓库分为公有仓库和私有仓库！

Docker Hub（默认是国外的）

阿里云  ...都有容器服务器（配置镜像加速！）



## 安装docker

> 环境准备

- 需要linux的基础
- ubuntu

> 环境查看

```bash
系统版本
root@iZ85rsdbnoqwbcZ:~# uname -r
5.4.0-47-generic
```

安装

宝塔面板安装

验证 Docker 是否被正确的安装

```ba
 docker run hello-world
```

![image-20221110123542813](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101235889.png)

如果是阿里云上的linux

那么可以配置一个镜像加速器

第一步：

![image-20221110124021370](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101240456.png)

找到加速地址

![image-20221110124113192](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101241252.png)

![image-20221110124331265](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101243346.png)

```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://xxxxxxxxx.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

Docker的运行流程图

![image-20221110125518633](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101255712.png)

## 原理

docker是怎么工作的？

docker是一个C/S结构的系统，docker的守护进程运行在主机上，通过socket从客户端访问！

dockerServer接收到Docker——client的指令，就会执行这个命令！

# Docker常用的命令

## 帮助命令

```bash
docker version		#显示docker的一些信息
docker info			#显示docker的一些详细信息
docker 命令 --help    #万能命令 帮助命令
```

## 镜像命令

**docker images**

查看所有本地的主机上的镜像

![image-20221110131540617](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101315674.png)

```bash
root@iZ85rsdbnoqwbcZ:~# docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
hello-world   latest    feb5d9fea6a5   13 months ago   13.3kB

# 解释
REPOSITORY	镜像的仓库源
TAG			镜像的标签
IMAGE ID	镜像的id
CREATED		镜像的创建时间
SIZE		镜像的大小

```

**docker search**

搜索命令

```bash
root@iZ85rsdbnoqwbcZ:~# docker search --help

Usage:  docker search [OPTIONS] TERM

Search the Docker Hub for images

Options:
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print search using a Go template
      --limit int       Max number of search results (default 25)
      --no-trunc        Don't truncate output
root@iZ85rsdbnoqwbcZ:~#

```

例如：

![image-20221110132229624](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101322684.png)

**docker pull**

下载镜像

- docker pull  镜像

- docker pull  镜像[:tag]		带版本号的下载

如果不写tag，默认就是latest

```bash
docker pull mysql		#最新版本
docker pull mysql:5.7	#指定版本
```

![image-20221110133134688](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101331747.png)

**docker rmi**

删除镜像

`i`:表示镜像

```bash
root@iZ85rsdbnoqwbcZ:~# docker rmi --help

Usage:  docker rmi [OPTIONS] IMAGE [IMAGE...]

Remove one or more images

Options:
  -f, --force      Force removal of the image
      --no-prune   Do not delete untagged parents
root@iZ85rsdbnoqwbcZ:~#
```

```bash
docker rmi -f 镜像id					   #删除指定容器
docker rmi -f 镜像id1 镜像id2 镜像id3		#删除多个容器
docker rmi -f $(docker images -aq)		#删除全部的容器
```

如下测试表示删除成功

![image-20221110133305723](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101333789.png)

## 容器命令

说明：我们有了镜像才可以创建容器，linux，下载一个linux（ubuntu）镜像来测试学习

```bash
docker pull ubuntu
```

下载成功

![image-20221110134102497](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211101341553.png)

新建容器并启动

```bash
docker run [可选参数] image

#参数说明
-a stdin: 指定标准输入输出内容类型，可选 STDIN/STDOUT/STDERR 三项；
-d: 后台运行容器，并返回容器ID；
-i: 以交互模式运行容器，通常与 -t 同时使用；
-P: 随机端口映射，容器内部端口随机映射到主机的端口
-p: 指定端口映射，格式为：主机(宿主)端口:容器端口
	ip:主机端口：容器端口
	主机端口：容器端口（常用）
	容器端口
-t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
--name="nginx-lb": 为容器指定一个名称；
--dns 8.8.8.8: 指定容器使用的DNS服务器，默认和宿主一致；
--dns-search example.com: 指定容器DNS搜索域名，默认和宿主一致；
-h "mars": 指定容器的hostname；
-e username="ritchie": 设置环境变量；
--env-file=[]: 从指定文件读入环境变量
--cpuset="0-2" or --cpuset="0,1,2": 绑定容器到指定CPU运行；
-m :设置容器使用内存最大值；
--net="bridge": 指定容器的网络连接类型，支持 bridge/host/none/container: 四种类型；
--link=[]: 添加链接到另一个容器；
--expose=[]: 开放一个端口或一组端口；
--volume , -v: 绑定一个卷
```

测试：

```bash
docker run -it ubuntu /bin/bash    #交互模式运行
```

```bash
root@iZ85rsdbnoqwbcZ:~# docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
ubuntu       latest    ba6acccedd29   13 months ago   72.8MB

root@iZ85rsdbnoqwbcZ:~# docker run -it ubuntu /bin/bash			#启动并进入容器
root@93049143a95f:/#											#表示进入成功
root@93049143a95f:/# ls								#基础镜像很多命令是不完善的
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@93049143a95f:/# exit							退出容器
exit
root@iZ85rsdbnoqwbcZ:~# docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
ubuntu       latest    ba6acccedd29   13 months ago   72.8MB
root@iZ85rsdbnoqwbcZ:~#
```

```bash
root@iZ85rsdbnoqwbcZ:~# docker ps				#列出当前正在运行的容器
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
root@iZ85rsdbnoqwbcZ:~# docker ps -a			#列出当前正在运行的容器+历史运行过的容器
CONTAINER ID   IMAGE          COMMAND       CREATED             STATUS                          PORTS     NAMES
93049143a95f   ubuntu         "/bin/bash"   3 minutes ago       Exited (0) About a minute ago             optimistic_montalcini
6677e1598e88   feb5d9fea6a5   "/hello"      About an hour ago   Exited (0) About an hour ago              sharp_pascal
root@iZ85rsdbnoqwbcZ:~# docker ps -aq			#显示所有容器编号
93049143a95f
6677e1598e88

```

**退出容器**

```bash
exit		#直接容器停止并退出
ctrl + P + Q	#容器不停止退出
```

**删除容器**

```bash
docker rm 容器id		#删除指定的容器，不能删除正在运行的容器，如果要强制删除  rm -f
docker rm -f $(docker ps -aq)	#删除所有的容器
```

**启动和停止容器的操作**

```bash
docker start 容器id		#启动容器
docker restart 容器id		#重启容器
docker stop	容器id		#停止容器当前运行
docker kill 容器id		#强制停止当前容器
```

## 常用的其他命令

**后台启动容器**

```bash
#命令 docker run -d 镜像名
root@iZ85rsdbnoqwbcZ:~# docker run -d ubuntu
5b58f8031121885b6d6aa3375b26fed759edc04646107fb34ce43c949cfc7eeb
root@iZ85rsdbnoqwbcZ:~# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
root@iZ85rsdbnoqwbcZ:~#

#问题 docker ps，发现ubuntu停止了
#常见的坑，docker容器使用后台运行，就必须要有一个前台进程，docker发现没有应用，就会自动停止
#nginx,容器启动后，发现自己没有提供服务，就会立刻停止，就是没有程序了

```

**查看日志**

**docker logs**

```bash
root@iZ85rsdbnoqwbcZ:~# docker logs --help

Usage:  docker logs [OPTIONS] CONTAINER

Fetch the logs of a container

Options:
      --details        Show extra details provided to logs
  -f, --follow         Follow log output
      --since string   Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
  -n, --tail string    Number of lines to show from the end of the logs (default "all")
  -t, --timestamps     Show timestamps
      --until string   Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
root@iZ85rsdbnoqwbcZ:~#
```

测试

```bash
root@iZ85rsdbnoqwbcZ:~# docker run -d ubuntu /bin/sh -c "while true;do echo cyystudy;sleep 1;done"
a51106c6171da126a7c66fd222a6149affe1546d0f6f6db64c6e362f06d5fb76
root@iZ85rsdbnoqwbcZ:~# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES
a51106c6171d   ubuntu    "/bin/sh -c 'while t…"   11 seconds ago   Up 10 seconds             jovial_galileo

#显示日志
#-tf			显示日志
#--tail number	要显示的日志条数
root@iZ85rsdbnoqwbcZ:~# docker logs -tf --tail 10 a51106c6171d
2022-11-10T06:19:47.693925326Z cyystudy
2022-11-10T06:19:48.694837898Z cyystudy
2022-11-10T06:19:49.695865492Z cyystudy
2022-11-10T06:19:50.696876115Z cyystudy
2022-11-10T06:19:51.698358646Z cyystudy
2022-11-10T06:19:52.699335391Z cyystudy
2022-11-10T06:19:53.700686776Z cyystudy
2022-11-10T06:19:54.701587497Z cyystudy
2022-11-10T06:19:55.702820748Z cyystudy
2022-11-10T06:19:56.703884777Z cyystudy
2022-11-10T06:19:57.704889610Z cyystudy
2022-11-10T06:19:58.705990520Z cyystudy
2022-11-10T06:19:59.706981823Z cyystudy
2022-11-10T06:20:00.707925361Z cyystudy
2022-11-10T06:20:01.709393347Z cyystudy
^C
root@iZ85rsdbnoqwbcZ:~#
```

**查看容器中的进程信息**

**docker top**

```bash
root@iZ85rsdbnoqwbcZ:~# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS     NAMES
a51106c6171d   ubuntu    "/bin/sh -c 'while t…"   3 minutes ago   Up 3 minutes             jovial_galileo
root@iZ85rsdbnoqwbcZ:~# docker top a51106c6171d
UID                 PID                 PPID                C                   STIME               TTY
TIME                CMD
root                73994               73969               0                   14:19               ?
00:00:00            /bin/sh -c while true;do echo cyystudy;sleep 1;done
root                74297               73994               0                   14:23               ?
00:00:00            sleep 1
root@iZ85rsdbnoqwbcZ:~#
```

**查看镜像的元数据**

**docker inspect  容器id**

```bash
root@iZ85rsdbnoqwbcZ:~# docker inspect a51106c6171d
[
    {
        "Id": "a51106c6171da126a7c66fd222a6149affe1546d0f6f6db64c6e362f06d5fb76",
        "Created": "2022-11-10T06:19:22.125723854Z",
        "Path": "/bin/sh",
        "Args": [
            "-c",
            "while true;do echo cyystudy;sleep 1;done"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 73994,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2022-11-10T06:19:22.669755564Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:ba6acccedd2923aee4c2acc6a23780b14ed4b8a5fa4e14e252a23b846df9b6c1",
        "ResolvConfPath": "/var/lib/docker/containers/a51106c6171da126a7c66fd222a6149affe1546d0f6f6db64c6e362f06d5fb76/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/a51106c6171da126a7c66fd222a6149affe1546d0f6f6db64c6e362f06d5fb76/hostname",
        "HostsPath": "/var/lib/docker/containers/a51106c6171da126a7c66fd222a6149affe1546d0f6f6db64c6e362f06d5fb76/hosts",
        "LogPath": "/var/lib/docker/containers/a51106c6171da126a7c66fd222a6149affe1546d0f6f6db64c6e362f06d5fb76/a51106c6171da126a7c66fd222a6149affe1546d0f6f6db64c6e362f06d5fb76-json.log",
        "Name": "/jovial_galileo",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "docker-default",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "host",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "KernelMemory": 0,
            "KernelMemoryTCP": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/c699e92df6245e48dc83bab3f77b0e25f58575e3eec32b85b879b09b37da5187-init/diff:/var/lib/docker/overlay2/c4523ada5935ab16eee87cd32b8cf848c34faadc2c34aa96cb01ea5d5eed8341/diff",
                "MergedDir": "/var/lib/docker/overlay2/c699e92df6245e48dc83bab3f77b0e25f58575e3eec32b85b879b09b37da5187/merged",
                "UpperDir": "/var/lib/docker/overlay2/c699e92df6245e48dc83bab3f77b0e25f58575e3eec32b85b879b09b37da5187/diff",
                "WorkDir": "/var/lib/docker/overlay2/c699e92df6245e48dc83bab3f77b0e25f58575e3eec32b85b879b09b37da5187/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "a51106c6171d",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "while true;do echo cyystudy;sleep 1;done"
            ],
            "Image": "ubuntu",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "fae6aa311ad0195624e6885f6a49e8a87acf32b7c20d1274c41a3cdb0aeabce2",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {},
            "SandboxKey": "/var/run/docker/netns/fae6aa311ad0",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "27b58102f2e7ef439432aa62334a48044153ecd189830cb5b72a5ae7dcf7fc51",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "d92e916d1a6a42a18e46faff6a80adae540fc20ba500f51f68b10177e6f1e5a4",
                    "EndpointID": "27b58102f2e7ef439432aa62334a48044153ecd189830cb5b72a5ae7dcf7fc51",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null
                }
            }
        }
    }
]
```

**进入当前正在运行的容器**

通常容器都是使用后台方式运行的，需要进入容器，修改一些配置

方式一

docker exec

进入容器后开启一个新的终端

```bash
root@iZ85rsdbnoqwbcZ:~# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS         PORTS     NAMES
a51106c6171d   ubuntu    "/bin/sh -c 'while t…"   12 minutes ago   Up 5 seconds             jovial_galileo
root@iZ85rsdbnoqwbcZ:~# docker exec -it a51106c6171d /bin/bash
root@a51106c6171d:/# ls
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@a51106c6171d:/#
```

方式二

docker attach

进入容器正在执行的终端

```bash
root@iZ85rsdbnoqwbcZ:~# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS         PORTS     NAMES
a51106c6171d   ubuntu    "/bin/sh -c 'while t…"   14 minutes ago   Up 2 minutes             jovial_galileo
root@iZ85rsdbnoqwbcZ:~# docker attach a51106c6171d
cyystudy
cyystudy
cyystudy
cyystudy
^Croot@iZ85rsdbnoqwbcZ:~#
```

**从容器内拷贝文件到主机上**

```bash
docker cp 容器id:容器内路径  目的主机路径
```

测试

```bash
root@iZ85rsdbnoqwbcZ:/home# docker run -it ubuntu /bin/bash
root@7c90e02c94ee:/# ls
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@7c90e02c94ee:/# cd /home
root@7c90e02c94ee:/home# touch test.java
root@7c90e02c94ee:/home# exit
exit

root@iZ85rsdbnoqwbcZ:/home# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
root@iZ85rsdbnoqwbcZ:/home# docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS                      PORTS     NAMES
7c90e02c94ee   ubuntu    "/bin/bash"   About a minute ago   Exited (0) 11 seconds ago             jolly_kowalevski
d66ef37012dd   ubuntu    "/bin/bash"   39 minutes ago       Exited (0) 39 minutes ago             amazing_pascal

root@iZ85rsdbnoqwbcZ:/home# docker cp 7c90e02c94ee:/home/test.java /home
root@iZ85rsdbnoqwbcZ:/home# ls
admin  test.java  www
root@iZ85rsdbnoqwbcZ:/home#
```

## 作业练习

> docker 安装nginx

```bash
#1.搜索镜像   search	
#2.下载镜像   pull
#3.运行测试
```

如下：

![image-20221110212609808](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211102126150.png)

![image-20221110212655864](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211102126961.png)

```bash
# -d	后台运行
# --name	该容器命名
# -p 宿主机端口：容器内部端口
run -d --name nginx01 -p 3344:80 nginx
```

端口暴露的概念

![image-20221110213543917](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202211102135027.png)

进入该容器

```bash
root@iZ85rsdbnoqwbcZ:~# docker exec -it nginx01 /bin/bash
root@043af3854c08:/# ls
bin   dev                  docker-entrypoint.sh  home  lib64  mnt  proc  run   srv  tmp  var
boot  docker-entrypoint.d  etc                   lib   media  opt  root  sbin  sys  usr
root@043af3854c08:/# cd /etc/nginx
root@043af3854c08:/etc/nginx# ls
conf.d  fastcgi_params  mime.types  modules  nginx.conf  scgi_params  uwsgi_params
root@043af3854c08:/etc/nginx#
```

每次进入容器去修改配置很是麻烦，后面会用到数据卷的技术来解决这个问题

> docker安装tomcat

```bash
#	官方的使用
docker run -it --rm tomcat
#我们之前的启动都是后台，停止了容器之后，容器还是可以查到
#docker run -it --rm tomcat 一般用来测试，用完即删

#下载后启动
docker pull tomcat
#启动
docker run -d -p 3355:8080 --name tomcat01 tomcat

#进入容器
docker exec -it tomcat01 /bin/bash
#发现问题：
#1.linux命令少了，2.没有webapps。阿里云镜像的原因，默认是最小的镜像，所以不必要的都会剔除掉
#保证最小可以运行的环境！

```

思考问题：我们每次要部署项目，如果每次都要进入容器太过于麻烦，我们需要在容器外部提供一个映射路径，webapps我们在外部放置项目，就自动同步到内部就好了

## 可视化

- portainer（先用这个）

  ```bash
  docker run -d -p 8088:9000 \
  ```

- Rancher(CI/CD再用)

**什么portainer？**

# Docker镜像讲解

## 镜像是什么



## Docker镜像加载原理

### UnionFS（联合文件系统）

原理





## 分层原理


# 一、基础

## 1、新建文档

像素：最小单位。

分辨率：分辨率的数值越大，像素越多

常用的是：像素/英寸

#### 颜色模式：

RGB：8位

背景内容：

前景色

背景色

## 2、修改文档

图像----》图像大小（CTRL+alt+i）

约束比例：限定宽高

画面的总像素值=宽度像素值 x  高度像素值

​						   =高（英寸） X 宽（英寸） X 分辨率（像素/英寸）2

## 3、打开文档

文件--》打开		或者  双击工作区		或者		ctrl+O

## 4、保存文档

1.文件--》存储/存储为（选择存储的位置）

psd：phtotshop的标准文件格式

psb：phtotshop的大型文件格式

jpg：最常见的图片格式

gif：最常见动画格式

## 5、调节相关设置



## 6、图层的操作

1.菜单栏的图层菜单

2.菜单栏的窗口选择图层

## 7、画面操作

1.工具栏——》抓手工具

2.工具栏——》缩放工具

![image-20220711134746439](C:\Users\caoyangyang\AppData\Roaming\Typora\typora-user-images\image-20220711134746439.png)

3.按住空格键不松出现抓手工具

可以用来移动画布

4.鼠标滚动放大缩小

## 8、选区

![image-20220711165717992](C:\Users\caoyangyang\AppData\Roaming\Typora\typora-user-images\image-20220711165717992.png)

**新选区**：每次都保留新做的选区，而舍弃旧的选区

**添加到选区**：新选区和旧选区并存或者是吞并（新选区模式下 按住shift键也可以实现）

**从选区减去**：和添加到选区相反（新选区模式下 按住alt键也可以实现）

**与选区交叉**：（新选区模式下 按住shift和alt键也可以实现）

**羽化**：选区边缘部分实现过渡式虚化，从而起到渐变的作用，达到选区内外自然衔接的效果（单位：像素）快捷键shift+F6

**消除锯齿**：不选择的话图像边缘会有锯齿、选的话则会变得柔和（但是在做像素图的时候就不用该功能）

**样式**：固定比例、固定大小、

<h4 style="color:red;">shift+M可以切换不同的选区工具。</h4>

单行选框工具只是选择了一行像素块

## 9、套索工具组

快捷键：L

它又叫：自由选区工具

点击鼠标左键移动选择

**多边形套索工具**：点到点的操作；delete删除上一个点；esc退出该操作（适合选取一些边缘是直线的图像）

**磁性套索工具**：自动的识别图像并添加锚点进行选区（delete可以删除锚点）

## 10、魔棒工具组

**魔棒工具**：可以快速地将颜色相近的区域变成选区

​				取样大小：取样点以但像素色彩信息取样

​									3X3平均为多点取样取平均值

​				容差：调节识别的范围（值越大范围越大）

​				连续：选择的话只能选取互为相邻的相似像素，否则选区的像素就极为多

​				对所有图层取样：勾选的话可以选择没有选中图层的颜色

<h4 style="color:red;">具有一定的局限性</h4>

**快速选择工具**：

​				画笔的大小：识别范围

​				*<u>ctrl+J可以抠出选区的图像</u>*



#### 编辑：

​		画出选区--》鼠标右键--》变换选区

![image-20220712174745957](C:\Users\caoyangyang\AppData\Roaming\Typora\typora-user-images\image-20220712174745957.png)



**反向命令**：反向选取选区

**羽化**：可以制作出一些边缘比较柔和的选区

**填充前景色快捷键：alt+delete**

**平滑**：菜单栏--》选择--》修改--》平滑

​			作用：使选区的边角变得平滑 ，如下图：

![image-20220712212308127](C:\Users\caoyangyang\AppData\Roaming\Typora\typora-user-images\image-20220712212308127.png)

**扩展/收缩**：菜单栏--》选择--》修改--》扩展

​		作用：扩展和收缩来对选区进行周边缩放，如下图：

![image-20220712212631733](C:\Users\caoyangyang\AppData\Roaming\Typora\typora-user-images\image-20220712212631733.png)

选区也可以变成路径

## 11、历史工具

![image-20220712213143386](C:\Users\caoyangyang\AppData\Roaming\Typora\typora-user-images\image-20220712213143386.png)

**复制**：ctrl+alt+鼠标左键

![image-20220712214611226](D:\Typora\pritrue\image-20220712214611226.png)

**创建新快照**：

![image-20220712214746376](D:\Typora\pritrue\image-20220712214746376.png)

# 二、图像编辑

## 1、画笔工具

![image-20220712215043710](D:\Typora\pritrue\image-20220712215043710.png)

相当于用铅笔画画

按住**shift+点击鼠标左键**可以画直线

**改变画笔的颜色**：改变前景色可以改变画笔的颜色

**硬度**：

![image-20220712223328022](D:\Typora\pritrue\image-20220712223328022.png)

不同硬度的画笔效果：

![image-20220712223738172](D:\Typora\pritrue\image-20220712223738172.png)

**注意**：这两个 “ [  ] ” 键可以改变画笔的大小

​			shift+“ [  ] ”可以改变按画笔的硬度

**画笔预设**：菜单栏——》窗口——》画笔/画笔设置

**导入画笔**：在网上搜索相关的笔刷导入

![image-20220713175032206](D:\Typora\pritrue\image-20220713175032206.png)

**自定义画笔**：菜单栏——》编辑——》定义画笔预设

**模式**：对画笔进行更改，又叫做混合模式

**不透明度**：

**流量**：设定画笔里面颜料流出来多少

​			不同的流量可使得我们的绘制工作更加细腻

**喷枪样式**：越按住鼠标左键不松，颜色会越多

![image-20220713180826091](D:\Typora\pritrue\image-20220713180826091.png)

![image-20220713181100622](D:\Typora\pritrue\image-20220713181100622.png)

两个按钮分别代表：对不透明度；大小使用压力，如下图(随着用力的大小改变)：

![image-20220713181404893](D:\Typora\pritrue\image-20220713181404893.png)

## 2、铅笔工具

该工具画出来的效果是带有锯齿的，例如：

![image-20220713181946251](D:\Typora\pritrue\image-20220713181946251.png)

其他内容和画笔工具不相上下，这里省略

## **3、橡皮擦工具**

擦除图层上的东西

![image-20220713182244386](D:\Typora\pritrue\image-20220713182244386.png)

**模式**：有画笔/铅笔/块

**抹到历史记录**：相当于历史工具

<h4 style="color:red">注意：在学习了蒙版之后几乎是不用橡皮擦工具的</h4>

##### **1、背景橡皮擦工具**

可以智能擦除背景，得到主体图像

##### **2、魔术橡皮擦工具**

相当于魔棒工具，可以智能的选择相似的颜色区域

## 4、模糊工具

主要功能就是把图像变的模糊，例如下图：

![image-20220713183620957](D:\Typora\pritrue\image-20220713183620957.png)

<h5 style="color:red">可以更好的突出画面中的主体，容易营造出画面的空间、层次感。给人更好的既视感</h5>

##### **1、锐化工具**

锐化工具与模糊工具对立，它可以使图像变得锐利清晰，如图：

![image-20220713184431648](D:\Typora\pritrue\image-20220713184431648.png)

##### **2、涂抹工具**

该工具用法和画笔一样，直接在画面上画就可以

<h5 style="color:red">强度越高涂抹的效果就越强</h5>

## **5、减淡/加深工具**

![image-20220713185443438](D:\Typora\pritrue\image-20220713185443438.png)

减淡和加深工具用法是一样的，效果是相反的

![image-20220713185637748](D:\Typora\pritrue\image-20220713185637748.png)

**曝光度**：相当于减淡/加深的强度

**保护色调**：可以保护图像在使用减淡时色调方面失真

![image-20220713185945074](D:\Typora\pritrue\image-20220713185945074.png)

##### **1、海绵工具**

局部增加饱和度或者是降低饱和度（俗话讲就是加色或者减色）

**饱和度**：先简单来理解为色彩的鲜艳程度

**模式**：加色/去色

## 6、仿制图章工具

![image-20220713190736381](D:\Typora\pritrue\image-20220713190736381.png)

刚点击时不可以使用需要有仿制源，如图提示

![image-20220713191007158](D:\Typora\pritrue\image-20220713191007158.png)

按住alt键，光标变成靶心形状后代表可以寻找仿制源（仿制对象）了

仿制效果如下图所示：

![image-20220713191356257](D:\Typora\pritrue\image-20220713191356257.png)

**防制源**

![image-20220713191614435](D:\Typora\pritrue\image-20220713191614435.png)

![image-20220713191737180](D:\Typora\pritrue\image-20220713191737180.png)

方便使用不同的仿制源

##### **1、图案图章工具**

用法是直接在画面上画图案

仿制图章进行的仿制是很严格的，一板一眼

## **7、修复画笔**

修复画笔有一定智能性，可以和周围环境进行融合

<h5 style="color:red">两者（仿制图章工具和修复画笔）区别在于一个比较智能，一个比较准确</h5>

##### **1、污点修复画笔**

该工具在污点上点击、绘画就可以了

（人像的祛斑祛痘可以使用该画笔来实现）

##### **2、修补工具**

该工具可以快速地对画面进行修复

使用方法：画出一个选区然后拖动就可修复

##### **3、内容感知移动工具**

**模式**：移动模式代表的是移走

​			扩展模式代表的是复制

**适应**：

**移动模式**：移动所选内容并修补好被移动的区域

![image-20220714112738657](D:\Typora\pritrue\image-20220714112738657.png)

**扩展模式**：做出选区移动后会复制出选取里的内容

![image-20220714113702374](D:\Typora\pritrue\image-20220714113702374.png)

##### **4、红眼工具**

拍照片的时候眼睛会在闪光灯的作用下扩张，而毛细血管就会呈现出红色，这个时候就会被相机拍下红眼的效果。该工具可以快速地帮助我们消除红眼的效果。

<h5 style="color:red">用法：框住眼睛中红色的部分</h5>

![image-20220714115202107](D:\Typora\pritrue\image-20220714115202107.png)

## 8、油漆桶工具

选取可以界定填充的范围，建立选取后则只可以填充选取里面的东西

**填充模式**：前景/图案

![image-20220714115850340](D:\Typora\pritrue\image-20220714115850340.png)

**填充命令**：

编辑——》填充（shift+F5或者shift+后退键）

![image-20220714120257599](D:\Typora\pritrue\image-20220714120257599.png)

**内容识别**：内容识别具有智能计算的功能

需要结合选区才能够使用

##### **1、渐变工具**

用法是点线拖拽

![image-20220714135737848](D:\Typora\pritrue\image-20220714135737848.png)

一号游标代表的是不透明度

二号游标代表的是色标

鼠标点击可以添加更多的色标

**五种不同的渐变方式**

![image-20220714140254998](D:\Typora\pritrue\image-20220714140254998.png)

**填充图层**

![image-20220714140538545](D:\Typora\pritrue\image-20220714140538545.png)

选中图层点击如上图标便可以填充图层（纯色/渐变/图案。。。。）

![image-20220714140722808](D:\Typora\pritrue\image-20220714140722808.png)

双击填充好的图层之后还可以修改填充的颜色

## 9、变换

##### **1、自由变换**

编辑——》自由变换(ctrl+T)

旋转时需要用到的参考点（按住alt可以移动参考点）

![image-20220714141856100](D:\Typora\pritrue\image-20220714141856100.png)

![image-20220714141810913](D:\Typora\pritrue\image-20220714141810913.png)

##### **2、再次变换**

编辑——》变换——》再次（ctrl+shift+T）

效果：再次执行一次自由变换命令

##### **3、再次变换并复制**（ctrl+shift+alt+T）

##### **4、对象缩放**

作用在图形上的

<h5 style="color:red">注意：位图进行缩放的时候，图片会变得模糊</h5>

##### **5、旋转**

##### **6、斜切**

改变以下的角度

![image-20220714145234574](D:\Typora\pritrue\image-20220714145234574.png)

##### **7、变形**

鼠标右键——》变形

![image-20220714145425201](D:\Typora\pritrue\image-20220714145425201.png)

效果

![image-20220714145732507](D:\Typora\pritrue\image-20220714145732507.png)

类似于贝塞尔曲线

##### **8、扭曲**

![image-20220714150540328](D:\Typora\pritrue\image-20220714150540328.png)

移动控点，定位控点，完成变换操作

在自由变换模式下按住ctrl+鼠标左键也可以实现扭曲的操作

##### **9、透视**

概念：简单来说就是人眼或者是镜头对立体世界的一种二维的识别（镜大人小）

透视也是直接拖拽控点定位，但其遵循透视法则

![image-20220714151414579](D:\Typora\pritrue\image-20220714151414579.png)

扭曲只是移动某一个控点，而透视则会移动移动与透视相关的点

## 10、通道

![image-20220714152318623](D:\Typora\pritrue\image-20220714152318623.png)

**认识面板**

（1）将通道作为选区载入

（2）将选区存储为通道

（3）创建新通道

（4）删除通道

**RGB**：又叫做复合通道（它是原色通道的合成效果）。

**原色通道**：红/绿/蓝；原色通道用灰度图像表示，示意发光强弱（如果觉得灰度图像看着不够直观，我们可以将原色通道调节成彩色的。ctrl+K打开首选项——》界面——》勾选”用彩色显示通道“）。

**注意**：RGB色彩模式下，白色代表色光强度最高，最高值为：255；黑色代表色光强度最低，不发光，值为：0。

色彩模式不同，通道构成也不同（改变色彩模式的方法：图像——》模式——》选择色彩模式）

通道面板里面最多只能创建56个

##### **1、Alpha通道**

该通道需要自己创建

创建的方式有：通过存储选区、面板按钮、面板菜单、都可以创建Alpha通道

**黑色**不包含像素信息，代表着透明

**白色**乃100%的像素覆盖，代表着此处是不透明的区域

一般情况下，我们使用8位通道，即2的8次方=256种色阶

单个通道0-255灰阶

0	=	黑	=	透明

1-254	=	灰	=	半透明

255	=	白	=	不透明

不同灰度表示不同的透明度

**编辑Alpha通道**




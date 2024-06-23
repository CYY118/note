## IOC入门案例思路分析

1. 管理什么？（Service与Dao）
2. 如何将被管理的对象告知IOC容器？（配置）
3. 被管理的对象交给IOC容器，如何获取到IOC容器？（接口）
4. IOC容器得到后，如何从容器中获取bean？（接口方法）
5. 使用Spring导入哪些坐标？（pom.xml）



## DI入门案例思路分析

1. 基于IOC管理bean
2. Service中使用new形式创建的Dao对象是否保留？（否）
3. Service中需要的Dao的对象如何进入到Service中？（提供方法）
4. Service与Dao间的关系如何描述



## Bean生命周期

- 生命周期：从创建到消亡的完整过程
- bean生命周期：bean从创建到销毁的整体过程
- bean生命周期控制：bean创建后到销毁前做一些事情

 

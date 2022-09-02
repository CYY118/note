# vue模板语法有2大类：

1. 插值语法
   - 功能：用于解析标签体内容
   - 写法：{{xxx}}，xxx是js表达式，且可以直接读取到data中的所有属性
2. 指令语法
   - 功能：用于解析标签（包括：标签属性、标签体内容、绑定事件。。。。）
   - 举例：v-bind：href=“xxx” 或者简写为：href=“xxx”.xxx同样是js表达式，且可以直接读取到data中的所有属性。
   - 备注：vue中有很多的指令，且形式都是：v-？？？，此处我们只是拿v-bind举个例子。

小写字母转大写用“toUpperCase()”  例如："url.toUpperCase()"

# vue中有2种数据绑定的方式：

1. 单向数据绑定：v-bind   数据只能从data流向页面
2. 双向数据绑定：v-model    数据不仅能从data流向页面，还可以从页面流向data。

​			备注：

​				1.v-model这个指令一般都应用在表单类元素上（针对value）

​				2.v-model:value  可以简写为 v-model，因为v-model默认收集的就是value值



# data与el的2种写法：

1. el有2种写法：

   - new Vue的时候配置el属性
   - 先创建Vue实例，随后再通过vm.mount('#root'指定el的值)

2. data有2种写法：

   - 对象式
   - 函数式

   如何选择：目前那种写法都可以，以后学习到组件的时候，data必须使用函数式，否则会报错

   

   ```html
   <script>
      Vue.config.productionTip= false; //阻止vue在启动时产生提示
   
      var v = new Vue({
          // el:'#root',  //el的第一种写法
          // data的第一种写法：对象式
          // data: {
          //     name:'测试',
          // }
      //    data的第二种写法：函数式1
      //     data:function () {
      //         console.log("==>",this)  //此处的this是vue实例对象
      //         return {
      //             name:'测试二',
      //         }
      //     },
          //    data的第二种写法：函数式2
          data() {
              return {
                  name:'测试二'
              }
          }
      })
      setTimeout(()=>{
          v.$mount('#root')        //mount的第二种写法
      },1000);
   </script>
   ```

   

MVVM

1. M：模型（Model）：对应data中的数据
2. V：视图（View）：模板
3. VM：视图模型（ViewModel）：Vue实例对象

![image-20220815131505485](H:\typora\pritrue\image-20220815131505485.png)

数据代理：

![image-20220815164920959](H:\typora\pritrue\image-20220815164920959.png)



![image-20220815170741381](H:\typora\pritrue\image-20220815170741381.png)



1. Vue中的数据代理：
   - 通过vm对象来代理data对象中属性的操作（读/写）
2. Vue中数据代理的好处：
   - 更加方便的操作data中的数据
3. 基本原理：
   - 通过Object.defineProperty()把data对象中所有属性添加到vm上。
   - 为每一个添加到vm上的属性，都指定一个getter/setter
   - 在getter/setter内部去操作（读/写）data中对应的属性
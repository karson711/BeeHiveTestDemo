# BeeHiveTestDemo
学习BeeHive组件化框架Demo

一、通过构建中间层来组件化项目，共需要三步：
1. 创建protocol
2. 创建impClass
3. 存储protocol-impClass映射关系


1. 创建protocol
protocol表示模块对外暴露的接口，需要继承BeeHive中的协议BHServiceProtocol。

2. 创建impClass
impClass是protocol对应的响应类，它需要遵守这个protocol协议，它可以是模块中一个已经存在的业务类，也可以是这个模块的一个封装类。
如果模块对外暴露的方法全部来自于同一个业务类，则可以将这个业务类设置成impClass； 如果模块对外暴露的方法全部来自于多个不同的业务类，则需要给这个模块创建一个封装类，通过这个封装类来实现对模块的调用，impClass指向这个封装类。

3. 设置protocol-impClass映射关系
在BeeHive中，所有protocol-impClass的映射关系都由BHServiceManager管理，在BHServiceManager类中，有一个叫做allServicesDict的属性，它保存了所有的protocol-impClass的映射关系。allServicesDict是一个可变字典，其中key是protocol的字符串名称，value是impClass的字符串名称。

具体注册方式有下列三种
a. 使用BeeHive类的-[registerService:service:]
b. 使用宏BeeHiveService
c. 使用plist文件  [BHContext shareInstance].serviceConfigName = @"BeeHive.bundle/BHService";

# plistTest
plist文件使用练习

## overview
plist文件是一种用来储存数组或者基础数据类型的文件，一般我们会在swift中使用到他们。
## 使用方法
创建plist文件：在Xcode中左键选中想要在此创建plist文件的文件夹，选择穿件新文件，在iOS类别或者macOS类别中选择property list文件类型并创建

其中的plist文件的预览界面一共会展示三种信息，分别是：

    Key -- 如果元素位于Dictionary类型的文件下，Key可以被命名为你需要的标识符，位于Array类型的文件下，只会显示当前元素的索引
    Type -- 元素的类型，便于开发者对其类型进行转换
    Value -- 值

在新创建的plist文件中固有的`root`目录下添加元素，其中可以添加的元素类型包括,以及转换后的接收类型

    在plist文件中被声明用Array类型使用 -> NSArray接收 -> as! 或 as? 转换成Array类型 
    在plist文件中被声明用Dictionary类型使用 -> NSDictionary接收 -> as! 或 as? 转换成Dictionary类型 
    在plist文件中被声明用Number类型使用 -> NSNumber接收 -> as! 或 as? 转换成Number类型 
    在plist文件中被声明用String类型使用 -> NSString接收 -> as! 或 as? 转换成String类型 
    在plist文件中被声明用Boolean类型使用 -> NSBoolean接收 -> as! 或 as? 转换成Boolean类型 
    在plist文件中被声明用Data类型使用 -> NSData接收 -> as! 或 as? 转换成Data类型 
    在plist文件中被声明用Date类型使用 -> NSDate接收 -> as! 或 as? 转换成Date类型 

在方法层面实现文件的调用：在这里使用到了Bundle的调用方法

如果我们创建的plist文件的`root`类型为`Dictionary`，它的子元素的类型是Array<String>，Key类型为String

    func foo() {
        let Path = Bundle.main.path(forResource: "fileName", ofType: ".suffix")
        let DataStream = NSDictionary(contensOfFile: Path!)! as! Dictionary
    }
在实现类中声明`DataStream`作为接收容器

    //如果子元素键值对的值类型不确定，或者很复杂，我们可以将值类型声明为AnyObject类型
    var DataStream = [String: AnyObject]()
    //如果你确定，可以将值类型全面的描述出来
    var DataStream = [String: Array<String>]()
使用plist文件中的数据：我们已经创建类plist文件的输出流，接下来我们需要在方法中将需要的数据剥离出来

    
    

#Bundle
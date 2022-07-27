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
Bundle是一种储存资源的文件包，他可以用来统一管理调用编程时需要使用的图片等等资源。
## 在mainBundle下得到文件
我们需要明白一件事，我们整个工程相当于一个总的Bundle因此我们在调用工程下的资源时，需要使用以下方式：

    let path = Bundle.main.path(forResource: String, ofType: String)
for example

    let path = Bundle.main.path(forResource: "hello", ofType: ".png")
##在mainBundle下得到subBundle
当你在mainBundle下建立了一个新的subBundle ，你又想取得subBundle里的文件，那么就需要使用统一资源定位符`url`来定位

    let url = Bundle.main.url(forSource: String, withExtension: String) -> URL?
    let subBundle = Bundle(url: URL)
我们因此获得了一个subBundle，使用内部资源与使用mainBundle中的方法一样：

    let path = subBundle.path(forResource: String, ofType: String)

# CG Draw 

详见https://developer.apple.com/documentation/uikit/drawing
## 方法使用：
`draw(_ rect: CGRect)`方法和`setNeedsDisplay(_ rect: CGRect)`

    draw(_ rect: CGRect) -> 在初始化时就将自定义类的样式加载好
    setNeedsDisplay(_ rect: CGRect) -> 在之后重新加载自定义类的新样式
    redraw(_ rect: CGRect)

## 可以应用到函数中的类：
以下提及到的类必须写在`draw()`或者`setNeedsDisplay()`下，或者将自定义函数体加到以上方法中

    UIBezierPath -> 自定义绘制图形
    NSShadow -> 自定义加载阴影
###关于`UIBezierPath`的创建与使用
    //创建一个路径画笔，它可以在应用界面上移动
    let path = UIBezierPath()
    //让画笔移动到(x80, y50)
    path.move(to: CGPoint(x: 80, y: 50))
    //在(x80，y50)与(x140, y150)之间添加一条线
    path.addLine(to: CGPoint(x: 140, y: 150))
    path.addLine(to: CGPoint(x: 10, y: 150))
    //闭合路径
    path.close()

    //设置绘画路径的属性
    //填充颜色
    UIColor.green.setFill()
    //描边颜色
    UIColor.red.setStroke()
    //设置路径宽度
    path.lineWidth = 3.0
    //填充
    path.fill()
    //描边
    path.stroke()
    //在path里修剪保证内部绘图不会超出边界
    path.addClip()
    //检查某个点是否在path里面
    let isInside = path.contains(CGPoint(x: 123, y: 145))


# UIColor
`UIColor`是一种用来定义颜色的对象，我们一般使用它来为自己创建的元素定义自己的颜色。
###可用的方法：
对象方法：

设置成填充颜色的方法：`setFill()`

设置成描边颜色的方法：`setStroke()`

设置透明度的方法(透明度是位于0-1之间的)：`withAlphaComponent(float: Float)` -> 在使用前需要在自定义类中声明`override var isOpaque = false`
    
    //声明一个半透明黄色的变量：
    let semitransparentYellow = UIColor.Yellow.withAlphaComponent(0.5)
    //告知编译器在绘图时注意透明度：
    override var isOpaque: Bool = false 

##Layers
对于一个View，他会有一个数组用来储存在自己中展现的所有元素，其中由内及外的将包括背景在内的所有元素按照顺序填入数组中，我们可以通过代码调整他们的顺序。

    isHidden: Bool
##Layout

    override func layoutSubviews() {
        super.layoutSubviews()
    }
## Drawing Text

    let text = NSAttributedString(String: "hello")
    text.draw(at: aCGPoint)
    let textSize: CGSize = text.size
### NSRange：如何将普通的范围转换成`NSRange`
以字符串为例，字符串是一个有范围的结构
    
    let myString = "cafe pesto"
获得`myString`的范围

    let myStringRange = myString.startIndex..<myString.endIndex
这里需要一个`attrString`的初始化器

    var attrString = NSMutableAtrributedString(String: myString)
转换

    let nsrange = NSRange(myStingRange, in: myString)
    attrString.addAttribute(.strokeColor, value: UIColor.orange, range: nsrange)
## Fonts
参见：

https://developer.apple.com/documentation/uikit/uifont

https://developer.apple.com/documentation/uikit/uifontdescriptor
###使用
选择一个特定的字体形式：使用`UIFont`创建

    let font = UIFont(name: "fontName", size: 36.0)
也可以使用一个`UIFontDescriptor`来创建：如果存在字体，那么返回字体；如果不存在字体，那么创建一个新字体并返回。
    
    lae font = UIFontDescriptor(name: "fontName", size: 36.0)
设置字体标准：

    let metric = UIFontMetrics(forTextStyle: .body)
    let fontToUse = metric.scaleFont(for: font)
关于`UIFontMetrics(forTextStyle: <#T##UIFont.TextStyle#> )`：其中的`UIFont.TextStyle`泛型涵盖了在日常使用时遇到的所有情况，其中有正文使用的`body`，角标使用的`footnote`，大标题时使用的`headline`等

#枚举
在swift中我们一般使用枚举来表示某些情景：
###枚举的格式

    enum enumeration: <T> {
        case case1 = instanceOf<T>
    }

    enum enumeration {
        case case1
        case case2(<T>)
    }

在枚举中可以有case，var，func

    enum enumeration {
        case case1
        case case2(<T>)

        var var1: <T> = instanceOf<T>
        var var2: <T> {
            #body#
        }
        
        
    }
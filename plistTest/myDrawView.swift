//
//  myDrawView.swift
//  plistTest
//
//  Created by DemoCardla on 2022/7/25.
//

import Foundation
import UIKit



class myDrawView: UIView{
    
     var rect = CGRect(x: 100, y: 100, width: 0, height: 0)
    //想要在一开始自定义自定义类的样式：重写draw方法
    override func draw(_ rect: CGRect) {
        createUIBezierPath()
    }
    
    let semitranparentYellow = UIColor.yellow.withAlphaComponent(5.0)
    
    
    
    //想要在之后重新定义自定义类的样式：重写setNeedsDisplay方法，传入参数可有可无
//    override func setNeedsDisplay(_ rect: CGRect) {
//        <#code#>
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func createUIBezierPath() {
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
//        UIColor.green.setFill()
        semitranparentYellow.setFill()
            //描边颜色
        UIColor.red.setStroke()
            //设置路径宽度
        path.lineWidth = 3.0
            //填充
        path.fill()
            //描边
        path.stroke()
            //在path里修剪保证内部绘图不会超出边界
        let myImage = path.addClip()
            //检查某个点是否在path里面
        let isInside = path.contains(CGPoint(x: 123, y: 145))
        
        
//        let font = UIFont(name: "Helvetica", size: 36.0)
//        let metric = UIFontMetrics(forTextStyle: .body)
//        let metricFont = metric.scaledFont(for: font!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        draw(rect)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        draw(rect)

    }
}

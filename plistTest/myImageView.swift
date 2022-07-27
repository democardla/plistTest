//
//  myImageView.swift
//  plistTest
//
//  Created by DemoCardla on 2022/7/27.
//

import Foundation
import UIKit

class myImageView: UIView{
    
//    weak var ImageView: UIImageView?
//    weak var Image: UIImage?
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func setup() {
        let Image = UIImage(named: "th")
//        let Image = UIImage(systemName: "heart.fill")
        let ImageView = UIImageView(image: Image)
        self.addSubview(ImageView)
        self.backgroundColor = UIColor.gray
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

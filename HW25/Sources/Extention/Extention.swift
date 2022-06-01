//
//  Extention.swift
//  25test
//
//  Created by Александр Петрович on 29.05.2022.
//

import UIKit

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
    
    
    func withImage(image: UIImage){
        
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        view.backgroundColor = .clear
        view.clipsToBounds = true
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)
        
        self.leftViewMode = .always
        self.leftView = mainView
        
    }
    
}

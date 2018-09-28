//
//  CatView.swift
//  AutoLayoutExample
//
//  Created by Abraham Quezada on 9/28/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class CatView: UIView {

    let imageView: UIImageView = {
       let iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "tacocat")!
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAutoLayout()
       // fatalError("init(coder:) has not been implemented")
    }
    
    func setupAutoLayout(){
        backgroundColor = UIColor(named: "IntenseRed")!
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
}

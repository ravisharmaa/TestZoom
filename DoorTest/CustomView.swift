//
//  CustomView.swift
//  DoorTest
//
//  Created by Ravi Bastola on 5/24/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable
    var labelText: String = "" {
        didSet {
            configure()
        }
    }
    
    @IBInspectable
    var imageName: String? {
        didSet {
            configure()
        }
    }
    
    fileprivate lazy var softView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var innerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var innerImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(labelText: String, imageName: String?) {
        self.labelText = labelText
        self.imageName = imageName
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
    
    func configure() {
        
        addSubview(softView)
        
        NSLayoutConstraint.activate([
            softView.topAnchor.constraint(equalTo: topAnchor),
            softView.leadingAnchor.constraint(equalTo: leadingAnchor),
            softView.trailingAnchor.constraint(equalTo: trailingAnchor),
            softView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        if let _ = self.imageName {
            let stackView = UIStackView(arrangedSubviews: [
                innerLabel, innerImage
            ])
            
            stackView.axis = .horizontal
            stackView.alignment = .fill
            softView.addSubview(stackView)
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: softView.topAnchor),
                stackView.leadingAnchor.constraint(equalTo: softView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: softView.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: softView.bottomAnchor)
            ])
        }
        
        innerLabel.text = labelText
        softView.addSubview(innerLabel)
        innerLabel.centerXAnchor.constraint(equalTo: softView.centerXAnchor).isActive = true
        innerLabel.centerYAnchor.constraint(equalTo: softView.centerYAnchor).isActive = true
        
        
    }
}





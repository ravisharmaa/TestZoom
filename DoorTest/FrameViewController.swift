//
//  FrameViewController.swift
//  DoorTest
//
//  Created by Ravi Bastola on 5/30/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class FrameViewController: UIViewController {
    
    
     let dummyView = UIView()
    
    var topWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        
        let frameView = UIView()
        frameView.backgroundColor = .systemGray2
        
        
        
        view.addSubview(frameView)
        frameView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        frameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        frameView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        frameView.heightAnchor.constraint(equalToConstant: 800).isActive = true
        frameView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        
        let topFrame = UIView()
        topFrame.backgroundColor = .green
        
        
        topWidthConstraint = topFrame.widthAnchor.constraint(equalTo: frameView.widthAnchor, multiplier: 0)
        topWidthConstraint.isActive = true
        
        frameView.addSubview(topFrame)
        topFrame.translatesAutoresizingMaskIntoConstraints = false
        topFrame.heightAnchor.constraint(equalToConstant: 20).isActive = true
        topFrame.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 16).isActive = true
        topFrame.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -16).isActive = true
        topFrame.topAnchor.constraint(equalTo: frameView.topAnchor).isActive = true
        
        
        let bottomFrame = UIView()
        bottomFrame.backgroundColor = .green
        
        frameView.addSubview(bottomFrame)
        bottomFrame.translatesAutoresizingMaskIntoConstraints = false
        bottomFrame.heightAnchor.constraint(equalToConstant: 20).isActive = true
        bottomFrame.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 16).isActive = true
        bottomFrame.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -16).isActive = true
        bottomFrame.bottomAnchor.constraint(equalTo: frameView.bottomAnchor).isActive = true
        
        
        let rightFrame = UIView()
        rightFrame.backgroundColor = .red
        
        frameView.addSubview(rightFrame)
        rightFrame.translatesAutoresizingMaskIntoConstraints = false
        rightFrame.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightFrame.leadingAnchor.constraint(equalTo: frameView.leadingAnchor).isActive = true
        rightFrame.topAnchor.constraint(equalTo: topFrame.bottomAnchor).isActive = true
        rightFrame.bottomAnchor.constraint(equalTo: bottomFrame.topAnchor).isActive = true
        
        
        
        let leftFrame = UIView()
        leftFrame.backgroundColor = .red
        
        frameView.addSubview(leftFrame)
        leftFrame.translatesAutoresizingMaskIntoConstraints = false
        leftFrame.widthAnchor.constraint(equalToConstant: 20).isActive = true
        leftFrame.trailingAnchor.constraint(equalTo: frameView.trailingAnchor).isActive = true
        leftFrame.topAnchor.constraint(equalTo: topFrame.bottomAnchor).isActive = true
        leftFrame.bottomAnchor.constraint(equalTo: bottomFrame.topAnchor).isActive = true
        
        
        
        
       
        dummyView.backgroundColor = .clear
        dummyView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "1"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        dummyView.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: dummyView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: dummyView.centerXAnchor).isActive = true
        
        
        
        
        let scrollView = UIScrollView()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bouncesZoom = false
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(dummyView)
        
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topFrame.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: rightFrame.trailingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: leftFrame.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomFrame.topAnchor),
            
            
            
            dummyView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            dummyView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            dummyView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            dummyView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            dummyView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            dummyView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
        ])
    }
    
    
    
}


extension FrameViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
         return dummyView
    }
}

//
//  ViewController.swift
//  DoorTest
//
//  Created by Ravi Bastola on 5/19/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {
    
    let tab = UITabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        
        tab.delegate = self
        
        
        tab.items = [
            UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0),
            UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        ]
        
        view.addSubview(tab)
        
        tab.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tab.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tab.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tab.heightAnchor.constraint(equalToConstant: 80)
            
        ])
        
        
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            let c = UIViewController()
            c.view.backgroundColor = .red
            addChild(c)
            
            view.addSubview(c.view)
            c.view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                c.view.heightAnchor.constraint(equalToConstant: 200),
                c.view.widthAnchor.constraint(equalToConstant: 200),
                c.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                c.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
            
            c.didMove(toParent: self)
        case 1:
            let d = UIViewController()
            d.view.backgroundColor = .green
            addChild(d)
            view.addSubview(d.view)
            
            
            view.addSubview(d.view)
            d.view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                d.view.heightAnchor.constraint(equalToConstant: 200),
                d.view.widthAnchor.constraint(equalToConstant: 200),
                d.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                d.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
            d.didMove(toParent: self)
            
        default:
            print("hello")
        }
    }
    
    
    func setupTabBasrs() {
        
        let test = UIView()
        test.backgroundColor = .yellow
        
        view.addSubview(test)
        
        
        test.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let dummy = UIViewController()
        dummy.view.backgroundColor = .red
        
        
        dummy.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        dummy.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        let b = UIViewController()
        b.view.backgroundColor = .green
        
        b.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        test.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    
}


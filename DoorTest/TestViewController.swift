//
//  TestViewController.swift
//  DoorTest
//
//  Created by Ravi Bastola on 5/19/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

enum Section {
    case main
}

class TestViewController: UIViewController {
    
    
    
    var dataSource: DataSource!
    
    
    lazy var collection: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        return cv
    }()
    
    fileprivate lazy var topView: UIView =  {
        
        let baseView = UIView()
        
        
        
        let label1 = UILabel()
        
        
        let label2 = UILabel()
        
        let label3 = UILabel()
        
        
        let label4 = UILabel()
        
        
        let label5 = UILabel()
       
        
        let label6 = UILabel()
        
        
        let label7 = UILabel()
        
        
        let label8 = UILabel()
        
        
        
        for (index, element) in [label1, label2, label3, label4, label5, label6, label7,label8].enumerated() {
            element.text = "\(index + 1)"
            element.textAlignment = .center
            baseView.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        
        label1.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        label1.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20).isActive = true
        
        label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 20).isActive = true
        label2.widthAnchor.constraint(equalTo: label1.widthAnchor, multiplier: 1.0).isActive = true
        
        label3.leadingAnchor.constraint(equalTo: label2.trailingAnchor, constant: 20).isActive = true
        label3.widthAnchor.constraint(equalTo: label1.widthAnchor, multiplier: 1.0).isActive = true
            
        label4.leadingAnchor.constraint(equalTo: label3.trailingAnchor, constant: 20).isActive = true
        label4.widthAnchor.constraint(equalTo: label1.widthAnchor, multiplier: 1.0).isActive = true
        
        label5.leadingAnchor.constraint(equalTo: label4.trailingAnchor, constant: 20).isActive = true
        label5.widthAnchor.constraint(equalTo: label1.widthAnchor, multiplier: 1.0).isActive = true
        
        label6.leadingAnchor.constraint(equalTo: label5.trailingAnchor, constant: 20).isActive = true
        label6.widthAnchor.constraint(equalTo: label1.widthAnchor, multiplier: 1.0).isActive = true
        
        label7.leadingAnchor.constraint(equalTo: label6.trailingAnchor, constant: 20).isActive = true
        label7.widthAnchor.constraint(equalTo: label1.widthAnchor, multiplier: 1.0).isActive = true
        
        label8.leadingAnchor.constraint(equalTo: label7.trailingAnchor, constant: 20).isActive = true
        label8.widthAnchor.constraint(equalTo: label1.widthAnchor, multiplier: 1.0).isActive = true
        
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        return baseView
        
    }()
    
    fileprivate lazy var bottomView: UIView =  {
        
        let baseView = UIView()
        let stackView = UIStackView()
        for number in 1...8 {
            
            let label = UILabel()
            
            label.text = "\(number)"
            stackView.addArrangedSubview(label)
            
            
        }
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        baseView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        
        
        return baseView
        
    }()
    
    fileprivate lazy var rightView: UIView =  {
        
        let baseView = UIView()
        let stackView = UIStackView()
        for number in 1...10 {
            
            let label = UILabel()
            
            label.text = "\(number)"
            stackView.addArrangedSubview(label)
            
        }
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        baseView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 40).isActive = true
        
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        return baseView
        
    }()
    
    
    fileprivate lazy var leftView: UIView =  {
        
        let baseView = UIView()
        let stackView = UIStackView()
        for number in 1...10 {
            
            let label = UILabel()
            
            label.text = "\(number)"
            stackView.addArrangedSubview(label)
            
        }
        
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        
        baseView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 60).isActive = true
        
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        return baseView
        
    }()
    
    lazy var dummyView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bouncesZoom = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    var topWidthConstraint: NSLayoutConstraint!
    
    var rightHeightConstraint: NSLayoutConstraint!
    
    var bottomWidthConstraint: NSLayoutConstraint!
    
    var leftHeightConstraint: NSLayoutConstraint!
    
    lazy var screenWidth: CGFloat = {
        let width = view.frame.width
        return width
        
    }()
    
    lazy var screenHeight: CGFloat = {
        let height = view.frame.height
        return height
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        view.backgroundColor = .systemBackground
        
        
        
        
        view.addSubview(topView)
        
        view.addSubview(rightView)
        view.addSubview(bottomView)
        
        view.addSubview(leftView)
        
        
        topWidthConstraint = topView.widthAnchor.constraint(equalToConstant: screenWidth)
        topWidthConstraint.isActive = true
        
        rightHeightConstraint = rightView.heightAnchor.constraint(equalToConstant: screenHeight - 100)
        rightHeightConstraint.isActive = true
        
        bottomWidthConstraint = bottomView.widthAnchor.constraint(equalToConstant: screenWidth)
        bottomWidthConstraint.isActive = true
        
        leftHeightConstraint = leftView.heightAnchor.constraint(equalToConstant: screenHeight - 100)
        leftHeightConstraint.isActive = true
        
        //heightConstraint = rightView.heightAnchor.constraint(equalToConstant: screenHeight - 100)
        //heightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            //topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            //topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //topView.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            rightView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            // rightView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            //rightView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            //rightView.widthAnchor.constraint(equalToConstant: 200),
            //rightView.heightAnchor.constraint(equalToConstant: view.frame.height - 100),
            
            
            //bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //bottomView.heightAnchor.constraint(equalToConstant: 200),
            // bottomView.widthAnchor.constraint(equalToConstant: view.frame.width),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            leftView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //leftView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            //leftView.heightAnchor.constraint(equalToConstant: view.frame.height - 100)
            //leftView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20)
            
        ])
        
        
        
        
        collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //view.addSubview(collection)
        
        collection.backgroundColor = .systemBackground
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(MyCell.self, forCellWithReuseIdentifier: "reuseMe")
        
        collection.contentInsetAdjustmentBehavior = .never
        
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(dummyView)
        
        dummyView.addSubview(collection)
        
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: rightView.trailingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: leftView.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            
            
            
            dummyView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            dummyView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            dummyView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            dummyView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            dummyView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            dummyView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            collection.topAnchor.constraint(equalTo: dummyView.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: dummyView.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: dummyView.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: dummyView.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
        
        configureDataSource()
        
    }
    
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .absolute(80))
        
        let items = NSCollectionLayoutItem(layoutSize: itemSize)
        
        items.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: items, count: 8)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    func configureDataSource() {
        
        dataSource = DataSource(collectionView: collection, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, item: Int) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseMe", for: indexPath) as? MyCell else { fatalError()}
            
            cell.backgroundColor = .red
            cell.layer.cornerRadius = 8
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<100))
        dataSource.apply(snapshot)
    }
}


class DataSource: UICollectionViewDiffableDataSource<Section, Int> {
    
    //    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    
    //    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //        guard let source = itemIdentifier(for: sourceIndexPath) else {return}
    //
    //        guard sourceIndexPath != destinationIndexPath else { return }
    //
    //        let destinationIdentifier = itemIdentifier(for: destinationIndexPath)
    //
    //        var snapshot = self.snapshot()
    //
    //        if let destinationIdentifier = destinationIdentifier {
    //            if let sourceIndex = snapshot.indexOfItem(source),
    //                let destinationIndex = snapshot.indexOfItem(destinationIdentifier) {
    //                let isAfter = destinationIndex > sourceIndex &&
    //                    snapshot.sectionIdentifier(containingItem: source) ==
    //                    snapshot.sectionIdentifier(containingItem: destinationIdentifier)
    //                snapshot.deleteItems([source])
    //                if isAfter {
    //                    snapshot.insertItems([source], afterItem: destinationIdentifier)
    //                } else {
    //                    snapshot.insertItems([source], beforeItem: destinationIdentifier)
    //                }
    //            }
    //        } else {
    //            let destinationSectionIdentifier = snapshot.sectionIdentifiers[destinationIndexPath.section]
    //            snapshot.deleteItems([source])
    //            snapshot.appendItems([source], toSection: destinationSectionIdentifier)
    //        }
    //        apply(snapshot, animatingDifferences: false)
    //    }
    
}

//MARK:- Scroll View Delegate
extension TestViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.dummyView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
        view?.layoutIfNeeded()
        
        //topWidthConstraint.constant = screenWidth * scale
        
        //rightHeightConstraint.constant = (screenHeight - 100) * scale
        
        //bottomWidthConstraint.constant = screenWidth * scale
        
        //leftHeightConstraint.constant = (screenHeight - 100) * scale
        
        //print(scale)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
        view?.layoutIfNeeded()
        
        topWidthConstraint.constant = screenWidth * scrollView.zoomScale
        
        rightHeightConstraint.constant = (screenHeight - 100) * scrollView.zoomScale
        
        bottomWidthConstraint.constant = screenWidth * scrollView.zoomScale
        
        leftHeightConstraint.constant = (screenHeight - 100) * scrollView.zoomScale
        
        
        //topView.center.y = scrollView.center.y
        
        
        print(scrollView.center.x)
        
    }
}

class MyCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

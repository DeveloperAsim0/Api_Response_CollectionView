//
//  firstcell.swift
//  Fency
//
//  Created by Tarun Meena on 05/03/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit

class firstcell: UICollectionViewCell {
    
    let collection: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 30
        flowlayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        return cv
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        addSubview(collection)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  CustomCollectionView.swift
//  CameraFilter
//
//  Created by Carl Wainwright on 28/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit
import Photos

class CustomCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{

    var cellImage: [PHAsset] = []

    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width - 10
        layout.estimatedItemSize = CGSize(width: width, height: 900)
        return layout
    }()
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
        self.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")

        
        self.collectionViewLayout = layout
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellImage.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else {
            fatalError ("PhotoCollectionViewCell not found")
        }
        
        let asset = self.cellImage[indexPath.row]
        let manager = PHImageManager.default()
        
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { (image, _) in
            
            DispatchQueue.main.async {
                cell.cellImage.image = image
            }
        }
        

        return cell
        }

        
    }


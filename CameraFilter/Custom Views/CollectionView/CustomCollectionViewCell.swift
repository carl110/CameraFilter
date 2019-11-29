//
//  CustomCollectionViewCell.swift
//  CameraFilter
//
//  Created by Carl Wainwright on 29/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var cellImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellBackground.backgroundColor = UIColor.Reds.standardRed

    }
        
    override func prepareForReuse() {
        super.prepareForReuse()

    }

}

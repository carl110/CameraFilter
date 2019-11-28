//
//  ScondScreenFactory.swift
//  CameraFilter
//
//  Created by Carl Wainwright on 28/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class PhotosCollectionFactory {
    
    static func PushIn(navigationController: UINavigationController) {
        
        let storyBoard = UIStoryboard(name: "PhotosCollection", bundle: nil).instantiateInitialViewController() as! PhotosCollectionViewController
        let flowController = PhotosCollectionFlowController(navigationController: navigationController)
        let viewModel = PhotosCollectionViewModel()
        
        storyBoard.assignDependancies(photosCollectionFlowController: flowController, photosCollectionViewModel: viewModel)
        
        
        navigationController.pushViewController(storyBoard, animated: true)
        
    }
    
}

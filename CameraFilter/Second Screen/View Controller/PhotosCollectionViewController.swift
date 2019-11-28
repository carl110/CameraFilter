//
//  PhotosCollectionViewController.swift
//  CameraFilter
//
//  Created by Carl Wainwright on 28/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UIViewController {
    
    fileprivate var photosCollectionFlowController: PhotosCollectionFlowController!
    fileprivate var photosCollectionViewModel: PhotosCollectionViewModel!
    
    func assignDependancies(photosCollectionFlowController: PhotosCollectionFlowController, photosCollectionViewModel: PhotosCollectionViewModel) {
        self.photosCollectionViewModel = photosCollectionViewModel
        self.photosCollectionFlowController = photosCollectionFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  PhotosCollectionViewController.swift
//  CameraFilter
//
//  Created by Carl Wainwright on 28/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit
import Photos

class PhotosCollectionViewController: UIViewController {
    
    fileprivate var photosCollectionFlowController: PhotosCollectionFlowController!
    fileprivate var photosCollectionViewModel: PhotosCollectionViewModel!
    
    private var images = [PHAsset]()
    
    func assignDependancies(photosCollectionFlowController: PhotosCollectionFlowController, photosCollectionViewModel: PhotosCollectionViewModel) {
        self.photosCollectionViewModel = photosCollectionViewModel
        self.photosCollectionFlowController = photosCollectionFlowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatePhotos()
    }
    
    func populatePhotos() {
        //This checks and requests access to the uses photo library
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let status = PHPhotoLibrary.authorizationStatus()
            let noPermissionMessage = "Gridy does not have access to your Photo Library. To enable, please go to Settings -> Gridy and enable Photos"
            switch status {
            case.notDetermined:
                PHPhotoLibrary.requestAuthorization({ [weak self] (newStatus) in
                    if newStatus == .authorized {
                        //Access Photo Library
                        self?.getPhoto()
                    }
                    else {
                        self?.accessErrer(message: noPermissionMessage)
                    }
                })
            case .authorized:
                self.getPhoto()
                //Access Photo library
                print ("Photo Library authorized")
            case . denied, .restricted:
                self.accessErrer(message: noPermissionMessage)
            @unknown default:
                self.accessErrer(message: noPermissionMessage)
            }
        }
        else {
            accessErrer(message: "Gridy is unable to access your PhortoLibrary at this time")
        }
    }
    
    func getPhoto() {
        let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
        
        assets.enumerateObjects { [weak self] (object, count, error) in
            self?.images.append(object)
        }
        
        self.images.reverse()
        print (self.images)
//        self.reloadData
    }
    
    //Error box if unable to access camera or library
    func accessErrer(message: String?){
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .cancel)
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
}

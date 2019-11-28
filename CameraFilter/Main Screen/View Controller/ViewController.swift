//
//  ViewController.swift
//  CameraFilter
//
//  Created by Carl Wainwright on 28/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    fileprivate var mainFlowController: MainFlowController!
//    fileprivate var mainViewModel: MainViewModel!
    
    func assignDependancies(mainFlowController: MainFlowController) {
//        self.mainViewModel = mainViewModel
        self.mainFlowController = mainFlowController
    }

//    let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(barButtonAction))

    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var filterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationBarSetUp()
        buttonSetUp()
        
    }
    
    func navigationBarSetUp() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonAction))
        self.title = "Camera Filter"
 
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.Blues.lightBlue
    }
    
    func buttonSetUp(){
        filterButton.titleButtonSetup()
        filterButton.setTitle("Filter Photo", for: .normal)
    }
    
    @objc func barButtonAction() {
        mainFlowController.showPhotosCollection()
       
    }

    @IBAction func filterButton(_ sender: Any) {

    }
    
    
}


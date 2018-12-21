//
//  LoadAnimationVC.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/9/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//
import UIKit


class PulsatingHeartVC: UIViewController, URLSessionDelegate {
    
    let heartView = HeartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeartView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        heartView.animatePulsatingLayer()
    }
    
    
    fileprivate func setupHeartView() {
        view.addSubview(heartView)
        heartView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        heartView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        heartView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func downloadMockData() {
        guard let url = NetworkManager.mockURL() else {return}
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
}

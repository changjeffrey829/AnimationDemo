//
//  LoadAnimationVC.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/9/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//
import UIKit


class LoadAnimationVC: UIViewController, URLSessionDelegate {
    
    let heartView = HeartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeartView()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            //            self.percentageLabel.text = "\(Int(percentage * 100))%"
            //            self.shapeLayer.strokeEnd = percentage
        }
        
        print(percentage)
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

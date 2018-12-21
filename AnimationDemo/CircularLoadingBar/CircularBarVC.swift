//
//  CircularBarVC.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/9/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//

import UIKit

class CircularBarVC: UIViewController, URLSessionDownloadDelegate {
    
    let circularView = CircularBarView()
    
    let urlString = "https://firebasestorage.googleapis.com/v0/b/firestorechat-e64ac.appspot.com/o/intermediate_training_rec.mp4?alt=media&token=e20261d0-7219-49d2-b32d-367e1606500c"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotificationObservers()
        setupView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupView() {
        circularView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        view = circularView
        view.backgroundColor = UIColor.white
    }
    
    fileprivate func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        circularView.animatePulsatingLayer()
    }
    
    @objc private func handleEnterForeground() {
        circularView.animatePulsatingLayer()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            self.circularView.percentageLabel.text = "\(Int(percentage * 100))%"
            self.circularView.shapeLayer.strokeEnd = percentage
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Finished downloading file")
    }
    
    fileprivate func beginDownloadingFile() {
        
        circularView.shapeLayer.strokeEnd = 0
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        
        guard let url = URL(string: urlString) else { return }
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
    
    @objc fileprivate func handleTap() {
        print("tapped")
        beginDownloadingFile()
    }
    
}

















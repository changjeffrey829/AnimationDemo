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
        view.backgroundColor = .green
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
//        heartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
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
    
//    fileprivate func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
//        let layer = CAShapeLayer()
//        let circularPath = UIBezierPath(arcCenter: .zero, radius: 50, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
//        layer.path = circularPath.cgPath
//        layer.strokeColor = strokeColor.cgColor
//        layer.lineWidth = 20
//        layer.fillColor = fillColor.cgColor
//        layer.lineCap = CAShapeLayerLineCap.round
//        return layer
//    }
    
}

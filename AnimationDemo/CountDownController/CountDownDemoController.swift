//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/6/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//

import UIKit

class CountDownDemoController: UIViewController {
    
    var timer: Timer?
    var maxTime = 10
    var timeRemaining = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupStackViewAnchors(stackView: returnStackView())
        
    }
    
    func setupStackViewAnchors(stackView: UIStackView) {
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height / 5).isActive = true
    }
    
    @objc func startCountDown() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [unowned self] (timer) in
            self.timeRemaining -= 1
            let maxTimeFloat = Float(self.maxTime)
            let timeRemainingFloat = Float(self.timeRemaining)
            let result = timeRemainingFloat / maxTimeFloat
            self.progressView.setProgress(result, animated: true)
            let labelText = self.timeRemaining == 1 ? "\(self.timeRemaining) second" : "\(self.timeRemaining) seconds"
            self.countDownLabel.text = labelText
            if self.timeRemaining <= 0 {
                self.countDownLabel.text = "Time's up!"
                timer.invalidate()
            }
        })
    }
    
    @objc func resetCountDown() {
        timer?.invalidate()
        countDownLabel.text = "Count Down"
        timeRemaining = 10
        progressView.progress = 1
    }
    
    private func returnStackView() -> UIStackView {
        let buttonStackView = UIStackView(arrangedSubviews: [resetButton, startButton])
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 5
        let stackView = UIStackView(arrangedSubviews: [countDownLabel, progressView, buttonStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }
    
    //MARK: UI OBJECTS
    lazy var progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.progress = 1
        return view
    }()
    
    var countDownLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Count Down"
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("START", for: .normal)
        button.backgroundColor = .green
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(startCountDown), for: .touchUpInside)
        return button
    }()
    
    var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RESET", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(resetCountDown), for: .touchUpInside)
        return button
    }()
}


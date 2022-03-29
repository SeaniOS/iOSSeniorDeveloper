//
//  StepCountController.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 29/03/2022.
//

import UIKit

class StepCountController: UIViewController {
    var startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundColor()
        
        startButton = UIButton()
        updateButton()
        startButton.addTarget(self, action: #selector(startStopPause(_:)), for: .touchUpInside)
    }
    
    @objc func startStopPause(_ sender: Any?) {
        AppModel.instance.start()
        
        updateButton()
    }
    
    private func updateButton() {
        let title = AppModel.instance.appState.nextStateButtonLabel
        startButton.setTitle(title, for: .normal)
    }
    
    private func setupBackgroundColor() {
        view.backgroundColor = .systemBlue
    }
}

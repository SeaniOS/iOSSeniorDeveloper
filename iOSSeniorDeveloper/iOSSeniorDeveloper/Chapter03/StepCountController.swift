//
//  StepCountController.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 29/03/2022.
//

import UIKit

class StepCountController: UIViewController {
    var startButton = UIButton()
    var chaseView = ChaseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundColor()
        setupStartButton()
    }
    
    func updateGoal(newGoal: Int) {
        AppModel.instance.dataModel.goal = newGoal
    }
}

// MARK: - Setup
extension StepCountController {
    private func setupBackgroundColor() {
        view.backgroundColor = .systemBlue
    }
    
    private func setupStartButton() {
        updateButton()
        startButton.addTarget(self, action: #selector(startStopPause(_:)), for: .touchUpInside)
    }
}

// MARK: - Update UI
extension StepCountController {
    func updateUI() {
        updateButton()
        updateChaseView()
    }
    
    private func updateButton() {
        let state = AppModel.instance.appState
        let title = state.nextStateButtonLabel
        startButton.setTitle(title, for: .normal)
    }
    
    func updateChaseView() {
        let state = AppModel.instance.appState
        chaseView.state = state
    }
}

// MARK: - Action
extension StepCountController {
    @objc func startStopPause(_ sender: Any?) { // @IBAction
        do {
            try AppModel.instance.start()
        } catch {
            showNeedGoalAlert()
        }
        updateUI()
    }
    
    private func showNeedGoalAlert() {
        print("needGoalAlert")
    }
}

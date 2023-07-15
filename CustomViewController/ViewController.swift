//
//  ViewController.swift
//  CustomViewController
//
//  Created by Egor Mezhin on 15.07.2023.
//

import UIKit

class ViewController: UIViewController {
    private struct Constants {
        static var buttonTitle = "Present"
        static var viewSize = CGSize(width: 300, height: 280)
    }
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        let configuration = UIButton.Configuration.plain()
        button.configuration = configuration
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(presentVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - Private methods
extension ViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(presentButton)
        
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    @objc
    private func presentVC() {
        let compactVC = CompactViewController()
        compactVC.view.backgroundColor = .secondarySystemBackground
        compactVC.preferredContentSize = Constants.viewSize
        compactVC.modalPresentationStyle = .popover
        
        compactVC.popoverPresentationController?.sourceView = presentButton
        compactVC.popoverPresentationController?.sourceRect = presentButton.bounds
        
        compactVC.popoverPresentationController?.delegate = self
        present(compactVC, animated: true)
    }
}

//MARK: - UIPopoverPresentationControllerDelegate
extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

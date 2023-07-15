//
//  CompactViewController.swift
//  CustomViewController
//
//  Created by Egor Mezhin on 15.07.2023.
//

import UIKit

class CompactViewController: UIViewController {
    private struct Constants {
        static var maxHeightItem = "280pt"
        static var minHeightItem = "150pt"
        static var closeImage = "xmark.circle.fill"
        
        static var viewDefaultSize = CGSize(width: 300, height: 280)
        static var viewCompactSize = CGSize(width: 300, height: 150)
        
        static var topInset: CGFloat = 20
        static var trailingInset: CGFloat = -10
    }
    
    private lazy var segmentedControl: UISegmentedControl = {
        var segmentedControl = UISegmentedControl(items: [Constants.maxHeightItem, Constants.minHeightItem])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmetedControlValueChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private lazy var closeButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(systemName: Constants.closeImage), for: .normal)
        button.tintColor = .systemGray
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - Private methods
extension CompactViewController {
    private func setupUI() {
        view.addSubview(segmentedControl)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topInset),
            
            closeButton.centerYAnchor.constraint(equalTo: segmentedControl.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingInset)
        ])
    }
    
    @objc
    private func segmetedControlValueChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            preferredContentSize = Constants.viewDefaultSize
        case 1:
            preferredContentSize = Constants.viewCompactSize
        default:
            return
        }
    }
    
    @objc
    private func closeButtonTapped() {
        dismiss(animated: true)
    }
}

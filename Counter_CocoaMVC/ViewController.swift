//
//  ViewController.swift
//  Counter_CocoaMVC
//
//  Created by 横山新 on 2019/02/06.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private(set) lazy var myView: TestView = TestView()
    private(set) lazy var myModel: Model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = myView
        myView.label.text = myModel.count.description
        myView.minusButton.addTarget(self, action: #selector(onMinusTapped), for: .touchUpInside)
        myView.plusButton.addTarget(self, action: #selector(onPlusTapped), for: .touchUpInside)
        
        myModel.notificationCenter.addObserver(
            forName: .init(rawValue: "count"),
            object: nil,
            queue: nil,
            using:
            { [unowned self] notification in
                if let count = notification.userInfo?["count"] as? Int {
                    self.myView.label.text = "\(count)"
                }
            })
        
    }
    
    @objc func onMinusTapped() {
        myModel.countDown()
    }
    @objc func onPlusTapped() {
        myModel.countUp()
    }
}


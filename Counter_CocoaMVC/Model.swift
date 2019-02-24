//
//  Model.swift
//  Counter_CocoaMVC
//
//  Created by 横山新 on 2019/02/06.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//
import Foundation

final class Model {
    let notificationCenter = NotificationCenter()
//    完全readonly https://swift.tecc0.com/?p=268
//    変数の宣言とdidsetの併用ができるのか．．．
    private(set) var count = 0 {
        didSet {
            notificationCenter.post(name: .init(rawValue: "count"), object: nil, userInfo: ["count":count])
        }
    }
    
    func countDown() {
        count -= 1
    }
    
    func countUp() {
        count += 1
    }
}

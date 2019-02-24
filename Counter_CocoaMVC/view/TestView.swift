//
//  TestView.swift
//  Counter_CocoaMVC
//
//  Created by 横山新 on 2019/02/06.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    // コードから生成した時の初期化処理
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    // ストーリーボードで配置した時の初期化処理
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    // xibファイルを読み込んでviewに重ねる
    fileprivate func loadNib() {
        
        // File's OwnerをTestViewにしたので ownerはself になる
        guard let view = UINib(nibName: "TestView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        view.frame = self.bounds
        
        
        self.addSubview(view)
    }
    
    
}

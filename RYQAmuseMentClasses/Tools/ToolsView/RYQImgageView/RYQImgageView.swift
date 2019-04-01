//
//  RYQImgageView.swift
//  StarAPP
//
//  Created by 橘子 on 2018/12/26.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class RYQImgageView: UIImageView {

    var deleteButton:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        deleteButton = UIButton.initImageButton(imageName: "RepairsCenterCancleUpload", addView: self, action: { (sender) in
            
        })
        deleteButton.isHidden = true
        deleteButton.snp.makeConstraints { (make) in
            make.right.top.equalTo(0)
            make.size.equalTo(CGSize.init(width: 35*m6Scale, height: 35*m6Scale))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension RYQImgageView {
    
    func uploadImageViewWithProgress(progress:CGFloat) {
        if progress == 1 {
            deleteButton.isHidden = false
        }
    }
}

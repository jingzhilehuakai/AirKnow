//
//  ExpandTouchPointButton.swift
//  AirKnow
//
//  Created by cbangchen on 2017/9/13.
//  Copyright © 2017年 AirKnow-TaskForce. All rights reserved.
//

import UIKit

class AirKnowExpandTouchPointButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds: CGRect = self.bounds;
        let widthDelta: CGFloat = max(44.0 - bounds.size.width, 0)
        let heightDelta: CGFloat = max(44.0 - bounds.size.height, 0)
        bounds = bounds.insetBy(dx: -0.5 * widthDelta, dy: -0.5 * heightDelta)
        return bounds.contains(point)
    }
}

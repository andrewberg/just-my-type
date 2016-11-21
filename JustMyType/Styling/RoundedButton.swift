//
//  RoundedButton.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/25/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

//Lauren Koulias
class RoundedButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        self.layer.cornerRadius = 12;
        
    }
}
    
class RoundedLabel: UILabel {
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder);
            
            self.layer.cornerRadius = 12;
            
        }
}
        
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


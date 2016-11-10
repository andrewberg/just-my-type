//
//  UIViewExtension.swift
//  JustMyType
//
//  Created by Jorge Gonzalez on 10/18/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

extension UIView {

  /**
   *
   * $$$$$$\             $$\                          $$\     $$\
   * $$  __$$\           \__|                         $$ |    \__|
   * $$ /  $$ |$$$$$$$\  $$\ $$$$$$\$$$$\   $$$$$$\ $$$$$$\   $$\  $$$$$$\  $$$$$$$\   $$$$$$$\
   * $$$$$$$$ |$$  __$$\ $$ |$$  _$$  _$$\  \____$$\\_$$  _|  $$ |$$  __$$\ $$  __$$\ $$  _____|
   * $$  __$$ |$$ |  $$ |$$ |$$ / $$ / $$ | $$$$$$$ | $$ |    $$ |$$ /  $$ |$$ |  $$ |\$$$$$$\
   * $$ |  $$ |$$ |  $$ |$$ |$$ | $$ | $$ |$$  __$$ | $$ |$$\ $$ |$$ |  $$ |$$ |  $$ | \____$$\
   * $$ |  $$ |$$ |  $$ |$$ |$$ | $$ | $$ |\$$$$$$$ | \$$$$  |$$ |\$$$$$$  |$$ |  $$ |$$$$$$$  |
   * \__|  \__|\__|  \__|\__|\__| \__| \__| \_______|  \____/ \__| \______/ \__|  \__|\_______/
   *
   * This extension provides functions designed to animate any UIView object.
   *
   * Use with caution.
   *
  **/

  
  func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0,
              completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
    
    UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
      self.alpha = 1.0
    }, completion: completion)
  
  } // fadeIn()
  
  
  func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 3.0,
               completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
    
    UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
      self.alpha = 0.0
    }, completion: completion)
  
  } // fadeOut()

  
  func shake() {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    animation.duration = 0.6
    animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
    layer.add(animation, forKey: "shake")
  } // shake()
}

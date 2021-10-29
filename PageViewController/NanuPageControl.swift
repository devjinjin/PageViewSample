//
//  NanuPageControl.swift
//  PageViewController
//
//  Created by 이진영 on 2021/10/29.
//

import UIKit

class NanuPageControl: UIPageControl {

    override var currentPage: Int {
            didSet {
                updateDots()
            }
        }

        func updateDots() {
            let currentDot = subviews[0]

            let spacing = 5.0

            subviews.forEach {
                $0.frame = ($0 == currentDot) ? CGRect(x: 0, y: 0, width: 16, height: 4) : CGRect(x: spacing, y: 0, width: 8, height: 4)
                //$0.frame.size = ($0 == currentDot) ? CGSize(width: 16, height: 4) : CGSize(width: 8, height: 4)
                $0.layer.cornerRadius = 2
            }
        }

}

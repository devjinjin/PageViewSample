//
//  FirstViewController.swift
//  PageViewController
//
//  Created by 이진영 on 2021/10/28.
//

import UIKit

class BatteryViewController: UIViewController {

    @IBOutlet weak var firstBatteryView: UIView!
    @IBOutlet weak var secondBatteryView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstBatteryView.layer.cornerRadius = 15
        
        firstBatteryView.layer.masksToBounds = false
                /// shadow 색상
        firstBatteryView.layer.shadowColor = UIColor.init(red: CGFloat(1) / 255.0, green: CGFloat(20) / 255.0, blue: CGFloat(26) / 255.0, alpha: 0.15).cgColor
                /// 현재 shadow는 view의 layer 테두리와 동일한 위치로 있는 상태이므로 offset을 통해 그림자를 이동시켜야 표출
        firstBatteryView.layer.shadowOpacity = 1
                /// shadow의 corner radius
        firstBatteryView.layer.shadowRadius = 15.0
        firstBatteryView.isUserInteractionEnabled = true
        
        
        secondBatteryView.layer.cornerRadius = 15
        
        secondBatteryView.layer.masksToBounds = false
                /// shadow 색상
        secondBatteryView.layer.shadowColor = UIColor.init(red: CGFloat(1) / 255.0, green: CGFloat(20) / 255.0, blue: CGFloat(26) / 255.0, alpha: 0.15).cgColor
                /// 현재 shadow는 view의 layer 테두리와 동일한 위치로 있는 상태이므로 offset을 통해 그림자를 이동시켜야 표출
        secondBatteryView.layer.shadowOpacity = 1
                /// shadow의 corner radius
        secondBatteryView.layer.shadowRadius = 15.0
        secondBatteryView.isUserInteractionEnabled = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

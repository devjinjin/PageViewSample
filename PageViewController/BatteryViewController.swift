//
//  FirstViewController.swift
//  PageViewController
//
//  Created by 이진영 on 2021/10/28.
//

import UIKit

class BatteryViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var secondBatteryInfoView: UIView!
    @IBOutlet weak var firstBatteryInfoView: UIView!
    @IBOutlet weak var firstBatteryView: UIView!
    @IBOutlet weak var secondBatteryView: UIView!
    @IBOutlet weak var firstStatusView: UIView!
    @IBOutlet weak var secondStatusView: UIView!
    
    static let EVENT_BATTERY_ADD = 0
    static let EVENT_FIRST_GROUP_CLICK = 1
    static let EVENT_SECOND_GROUP_CLICK = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        initBatteryView(firstBatteryInfoView, BatteryViewController.EVENT_FIRST_GROUP_CLICK )
        initBatteryView(secondBatteryInfoView,  BatteryViewController.EVENT_SECOND_GROUP_CLICK)
        
        initBatteryView(firstBatteryView, BatteryViewController.EVENT_BATTERY_ADD)
        initBatteryView(secondBatteryView, BatteryViewController.EVENT_BATTERY_ADD)

        initBatteryStatusView(firstStatusView)
        initBatteryStatusView(secondStatusView)
    }
    

    private func initBatteryView(_ view : UIView, _ tag : Int){
        
        let longGesture = NanuLongPressGestureRecognizer(target: self, action: #selector(self.longPress(_:)))
        longGesture.minimumPressDuration = 0.05
        longGesture.delegate = self
        
        view.layer.cornerRadius = 15
        
        view.layer.masksToBounds = false
                /// shadow 색상
        view.layer.shadowColor = UIColor.init(red: CGFloat(1) / 255.0, green: CGFloat(20) / 255.0, blue: CGFloat(26) / 255.0, alpha: 0.15).cgColor
                /// 현재 shadow는 view의 layer 테두리와 동일한 위치로 있는 상태이므로 offset을 통해 그림자를 이동시켜야 표출
        view.layer.shadowOpacity = 1
                /// shadow의 corner radius
        view.layer.shadowRadius = 3.0
        view.isUserInteractionEnabled = true
        view.tag = tag
        view.addGestureRecognizer(longGesture)
      
        
        
    }
    
    private func initBatteryStatusView(_ view : UIView){
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.init(red: CGFloat(30) / 255.0, green: CGFloat(145) / 255.0, blue: CGFloat(193) / 255.0, alpha: 1).cgColor
        view.layer.masksToBounds = false
    }

    @objc func longPress(_ gestureRecognizer: NanuLongPressGestureRecognizer) {
            let tag = gestureRecognizer.view?.tag
            switch tag! {
            case BatteryViewController.EVENT_BATTERY_ADD :
                if gestureRecognizer.state == .began {
                    gestureRecognizer.isPressCancel = false
                    gestureRecognizer.view?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                }else if gestureRecognizer.state == .ended  {
                    gestureRecognizer.view?.transform = .identity
                    if gestureRecognizer.isPressCancel == false {
                        //동작처리
                        print("배터리 추가 클릭")
                    }
                }
                else if  gestureRecognizer.state == .changed {
                    gestureRecognizer.isPressCancel = true
                }
                break
            case BatteryViewController.EVENT_FIRST_GROUP_CLICK :
                if gestureRecognizer.state == .began {
                    gestureRecognizer.isPressCancel = false
                }else if gestureRecognizer.state == .ended  {
                    if gestureRecognizer.isPressCancel == false {
                        //동작처리
                        print("첫번째 버튼 클릭")
                    }
                }
                else if  gestureRecognizer.state == .changed {
                    gestureRecognizer.isPressCancel = true
                }
                break
            case BatteryViewController.EVENT_SECOND_GROUP_CLICK :
                if gestureRecognizer.state == .began {
                    gestureRecognizer.isPressCancel = false
                }else if gestureRecognizer.state == .ended  {
                    if gestureRecognizer.isPressCancel == false {
                        //동작처리
                        print("두번째 클릭")
                    }
                }
                else if  gestureRecognizer.state == .changed {
                    gestureRecognizer.isPressCancel = true
                }
                break
            default:
                print("default")
            }
    }


}

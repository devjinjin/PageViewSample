//
//  ViewController.swift
//  PageViewController
//
//  Created by 이진영 on 2021/10/28.
//

import UIKit

class MainViewController: UIViewController{

    var currentIndex : Int = 0 {
            didSet{
//                changeBtnColor()
                print(currentIndex)
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: CGFloat(228) / 255.0, green: CGFloat(228) / 255.0, blue: CGFloat(228) / 255.0, alpha: 1)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           if segue.identifier == "PageViewController" {
               print("Connected")
               guard let vc = segue.destination as? PageViewController else {return}
//               pageViewController = vc
//               
//               pageViewController.completeHandler = { (result) in
//                   self.currentIndex = result
//               }
               
           }
           
       }
}


//
//  ViewController.swift
//  PageViewController
//
//  Created by 이진영 on 2021/10/28.
//

import UIKit

class MainViewController: UIViewController{


  
    @IBOutlet weak var pageControl: UIPageControl!
    var currentIndex : Int = 0 {
            didSet{
//                changeBtnColor()
                print(currentIndex)
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: CGFloat(228) / 255.0, green: CGFloat(228) / 255.0, blue: CGFloat(228) / 255.0, alpha: 1)
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.init(red: CGFloat(30) / 255.0, green: CGFloat(145) / 255.0, blue: CGFloat(193) / 255.0, alpha: 1)
        pageControl.isUserInteractionEnabled = false


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           if segue.identifier == "MainPageViewController" {
               print("Connected")
               guard let vc = segue.destination as? MainPageViewController else {return}
               vc.pageDelegate = self
               
           }
           
       }
}

extension MainViewController : MainPageViewDelegate {
    func pageChange(_ current: Int) {
        pageControl.currentPage = current
       
        
      
    }
}

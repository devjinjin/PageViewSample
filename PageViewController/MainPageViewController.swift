//
//  PageViewController.swift
//  PageViewController
//
//  Created by 이진영 on 2021/10/28.
//

import UIKit

protocol MainPageViewDelegate {
    func pageChange(_ current : Int)
}

class MainPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var pageDelegate : MainPageViewDelegate?
    
    var currentIndex : Int {
           guard let vc = viewControllers?.first else { return 0 }
           return viewsList.firstIndex(of: vc) ?? 0
     }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewsList.firstIndex(of: viewController) else {return nil}

        let previousIndex = index - 1

        if previousIndex < 0 { return nil}

        return viewsList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewsList.firstIndex(of: viewController) else {return nil}
                     
        let nextIndex = index + 1
             
        if nextIndex == viewsList.count { return nil}
             
        return viewsList[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if completed {
//           completeHandler?(currentIndex)
//       }
        pageDelegate?.pageChange(currentIndex)
    }

    let viewsList : [UIViewController] = {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
           
            let vc2 = storyBoard.instantiateViewController(withIdentifier: "MainBikeViewController")
            let vc1 = storyBoard.instantiateViewController(withIdentifier: "MainBatteryViewController")

            
            return [vc1, vc2]
            
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
                
        if let firstvc = viewsList.first {
            self.setViewControllers([firstvc], direction: .forward, animated: true, completion: nil)
        }
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

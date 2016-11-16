//
//  ViewController.swift
//  PageTheScroll
//
//  Created by John on 11/16/16.
//  Copyright © 2016 jpclancy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    var currentPage = 0
    let MAX_PAGE = 2
    let MIN_PAGE = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipe))
//        swipeLeft.direction = .left
//        view.addGestureRecognizer(swipeLeft)
//        
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipe))
//        swipeRight.direction = .right
//        view.addGestureRecognizer(swipeRight)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        print("ScrollView width: \(scrollView.frame.size.width)")
        
        let scrollWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        //self.images[self.currentPage].transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)

        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
    
    @IBAction func detectSwipe(_ sender: UISwipeGestureRecognizer) {
        if(currentPage < MAX_PAGE && sender.direction == .left) {
            moveScrollView(direction: 1)
        }
        
        if(currentPage > MIN_PAGE && sender.direction == .right) {
            moveScrollView(direction: -1)
        }
    }
    
    func moveScrollView(direction: Int) {
        currentPage = currentPage + direction
        let point: CGPoint = CGPoint(x: scrollView.frame.size.width * CGFloat(currentPage), y: 0.0)
        scrollView.setContentOffset(point, animated: true)
    }
    
    
//    func handleSwipe(gesture: UIGestureRecognizer) {
//
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//            switch swipeGesture.direction {
//            case UISwipeGestureRecognizerDirection.right:
//                print("Swiped right")
//            case UISwipeGestureRecognizerDirection.left:
//                print("Swiped left")
//            default:
//                break
//            }
//        }
//    }

}


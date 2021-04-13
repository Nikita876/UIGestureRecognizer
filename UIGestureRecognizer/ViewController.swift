//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Никита Коголенок on 3.02.21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipersObservers()
        tapObservers()
    }
    
    func swipersObservers() {
        // Наблюдатели свайпа слево на право
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        // Наблюдатели свайпа справо на лево
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        // Наблюдатели снизу в верх
        let swiperUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swiperUp.direction = .up
        swiperUp.view?.addGestureRecognizer(swiperUp)
        // Наблюдатели свайпа с верзу вниз
        let swiperDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swiperDown.direction = .down
        swiperDown.view?.addGestureRecognizer(swiperDown)
    }
    
    func tapObservers() {
        // Наблюдатели тройного нажатия
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTouchesRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        // Наблюдатели двойного нажатия
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        switch gester.direction {
        case .right:
            label.text = "Right swipe was recognized"
        case .left:
            label.text = "Left swipe was recognized"
        case .up:
            label.text = "Up swipe was recognized"
        case .down:
            label.text = "Down swipe was recognized"
        default:
            break
        }
    }
    
    @objc func tripleTapAction() {
        label.text = "Triple taped was recognized"
    }
    @objc func doubleTapAction() {
        label.text = "Double taped was recognized"
    }
}


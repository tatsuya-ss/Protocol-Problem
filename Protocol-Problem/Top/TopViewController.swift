//
//  TopViewController.swift
//  Protocol-Problem
//
//  Created by 大西玲音 on 2021/10/17.
//

import UIKit

final class TopViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func presentProblem1FirstVCButtonDidTapped(_ sender: Any) {
        present(Problem1FirstViewController.self)
    }
    
    @IBAction private func presentProblem1SecondVCButtonDidTapped(_ sender: Any) {
        present(Problem1SecondViewController.self)
    }
    
}

private extension UIViewController {
    
    func present<T: UIViewController>(_ ViewControllerType: T.Type) {
        let vc = ViewControllerType.instantiate()
        present(vc, animated: true)
    }
    
    static func instantiate() -> Self {
        var storyboardName = String(describing: self)
        if let result = storyboardName.range(of: "ViewController") {
            storyboardName.removeSubrange(result)
        }
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(
            identifier: String(describing: self)
        ) as! Self
        return vc
    }

}

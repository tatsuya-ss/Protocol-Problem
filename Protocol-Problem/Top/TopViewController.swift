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
        let storyboard = UIStoryboard(name: "Problem1First", bundle: nil)
        let problem1FirstVC = storyboard.instantiateViewController(
            withIdentifier: String(describing: Problem1FirstViewController.self)
        ) as! Problem1FirstViewController
        present(problem1FirstVC, animated: true)
    }
    
    @IBAction private func presentProblem1SecondVCButtonDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Problem1Second", bundle: nil)
        let problem1SecondVC = storyboard.instantiateViewController(
            withIdentifier: String(describing: Problem1SecondViewController.self)
        ) as! Problem1SecondViewController
        present(problem1SecondVC, animated: true)
    }
    
}

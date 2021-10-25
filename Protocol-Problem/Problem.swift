//
//  Problem.swift
//  Protocol-Problem
//
//  Created by 大西玲音 on 2021/10/17.
//

import Foundation
import UIKit

// MARK: - Problem1(優しい)
/*
 Problem1FirstVCとProblem1SecondVCで共通の処理が多く見られる。これらをProtocolを用いて共通化したい。
 以下の条件を満たすこと
 ・「以下を共通に」と書かれている箇所をProtocolを定義して共通の処理を実装すること
 ・定義したProtocolに準拠したUIViewControllerのみ共通の処理(メソッド)を呼び出せること
 ・共通の処理(メソッドは)protocol内で呼び出しもとのメソッドの初めに「_」をつけて定義すること
 ex)
 // 呼び出し側
 func tableView(_ tableView: UITableView,
                didSelectRowAt indexPath: IndexPath) {
     _tableView(_ tableView: UITableView,
                didSelectRowAt indexPath: IndexPath)
 }
 
 // protocol定義側
 protocol {
 func _tableView(_ tableView: UITableView,
                didSelectRowAt indexPath: IndexPath)
 }
 
 ・protocolに適切な制限を設けて準拠できるものを制限すること
 */


// MARK: - Problem2(難しい)
/*
 イレギュラーなメソッドをProtocolを用いて異なる扱いでアクセスできるようにしたい
 以下の条件を満たすこと
 ・二つのメソッドは以下のようにアクセスできるようにする
 Manager().saveUser()
 Manager().tentative.saveUserTentative()
 ・以下のようなアクセスはエラーを出すようにする
 Manager().tentative.saveUser() // だめ
 Manager().saveUserTentative() // だめ
 */
/*
 ヒント1: ジェネリクスを用いる
 ヒント2: protocol extensionを用いる
 */

protocol ManagerProtocol {
    associatedtype T
    var tentative: T { get }
    func saveUserTentative()
}

extension ManagerProtocol where Self == Manager {
    var tentative: Self {
        Manager()
    }
}

extension Manager: ManagerProtocol { }

struct Manager {
    
    // 普通にアクセスできるように
    func saveUser() {
        // Userを保存する処理
        print(#function)
    }
    
    // 仮のメソッドなので、異なる扱いをしたい
    func saveUserTentative() {
        // Userを保存する処理(仮)
        print(#function)
    }
    
}

final class ViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Manager().tentative.saveUser()
        Manager().tentative.saveUserTentative()
    }
    
}


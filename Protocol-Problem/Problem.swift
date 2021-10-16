//
//  Problem.swift
//  Protocol-Problem
//
//  Created by 大西玲音 on 2021/10/17.
//

import Foundation

// MARK: - Problem1
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


// MARK: - Problem2

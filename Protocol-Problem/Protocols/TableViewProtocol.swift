//
//  TableViewProtocol.swift
//  Protocol-Problem
//
//  Created by 坂本龍哉 on 2021/10/18.
//

import UIKit

protocol TableViewProtocol {
    func _tableView(_ tableView: UITableView,
                    didSelectRowAt indexPath: IndexPath)
    func _tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView?
    func _tableView(_ tableView: UITableView,
                    makeDragItems title: String) -> [UIDragItem]
    func _tableViewMakeDropProposal(_ tableView: UITableView) -> UITableViewDropProposal
}

extension TableViewProtocol where Self : UIViewController {
    
    func _tableView(_ tableView: UITableView,
                    didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func _tableView(_ tableView: UITableView,
                    viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func _tableView(_ tableView: UITableView,
                    makeDragItems title: String) -> [UIDragItem] {
        let provider = NSItemProvider(object: title as NSItemProviderWriting)
        return [UIDragItem(itemProvider: provider)]
    }
    
    func _tableViewMakeDropProposal(_ tableView: UITableView) -> UITableViewDropProposal {
        return UITableViewDropProposal(operation: .move,
                                       intent: .insertAtDestinationIndexPath)
    }
    
}

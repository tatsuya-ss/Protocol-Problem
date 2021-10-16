//
//  Problem1FirstViewController.swift
//  Protocol-Problem
//
//  Created by 大西玲音 on 2021/10/17.
//

import UIKit

// MARK: - 並び替えを実装するViewController
final class Problem1FirstViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.dragDelegate = self
        tableView.dropDelegate = self
    }
    
}

extension Problem1FirstViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        // 以下を共通に
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension Problem1FirstViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return User.data1.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") ?? UITableViewCell()
        cell.textLabel?.text = User.data1[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        // 以下を共通に
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
}

extension Problem1FirstViewController: UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView,
                   itemsForBeginning session: UIDragSession,
                   at indexPath: IndexPath) -> [UIDragItem] {
        let title = User.data1[indexPath.row].name
        // 以下を共通に
        let provider = NSItemProvider(object: title as NSItemProviderWriting)
        return [UIDragItem(itemProvider: provider)]
    }
    
}

extension Problem1FirstViewController: UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView,
                    dropSessionDidUpdate session: UIDropSession,
                    withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        // 以下を共通に
        return UITableViewDropProposal(operation: .move,
                                       intent: .insertAtDestinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView,
                   performDropWith coordinator: UITableViewDropCoordinator) {
        return
    }
    
}

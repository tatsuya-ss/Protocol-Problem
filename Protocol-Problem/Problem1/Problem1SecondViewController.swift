//
//  Problem1SecondViewController.swift
//  Protocol-Problem
//
//  Created by 大西玲音 on 2021/10/17.
//

import UIKit

// MARK: - 並び替えを実装するViewController
final class Problem1SecondViewController: UIViewController {
    
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


extension Problem1SecondViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        // 以下を共通に
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension Problem1SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return User.data2.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") ?? UITableViewCell()
        cell.textLabel?.text = User.data2[indexPath.row].name
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

extension Problem1SecondViewController: UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView,
                   itemsForBeginning session: UIDragSession,
                   at indexPath: IndexPath) -> [UIDragItem] {
        let title = User.data2[indexPath.row].name
        // 以下を共通に
        let provider = NSItemProvider(object: title as NSItemProviderWriting)
        return [UIDragItem(itemProvider: provider)]
    }
    
}

extension Problem1SecondViewController: UITableViewDropDelegate {
    
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


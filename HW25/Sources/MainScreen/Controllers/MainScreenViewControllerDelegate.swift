//
//  MainScreenViewControllerDelegate.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import UIKit

extension MainScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, boolValue in
            StorageManager().deleteProfile(profileIndex: indexPath.row)
            MainScreenViewController.profile.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeAction
        
    }
}

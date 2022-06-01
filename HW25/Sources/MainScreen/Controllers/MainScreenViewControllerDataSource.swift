//
//  MainScreenViewControllerDataSource.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import UIKit

extension MainScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainScreenViewController.profile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: MainScreenView.idCell)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: MainScreenView.idCell)
        }
        let profile = MainScreenViewController.profile[indexPath.row]
        cell?.textLabel?.text = profile.name
        return cell ?? UITableViewCell()
    }
}

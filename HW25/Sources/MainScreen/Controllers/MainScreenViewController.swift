//
//  MainScreenViewController.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    static var profile = Profiles.getData()
    static let cellId = "cellId"
    
    var mainScreenView: MainScreenView? {
        guard isViewLoaded else { return nil }
        return view as? MainScreenView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainScreenView?.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainScreenView()
        
        if let button = mainScreenView?.button {
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        }
    }
    
    @objc func buttonClicked() {
        if let text = mainScreenView?.textField.text {
            if text != "" {
                let newProfile = StorageManager().saveProfile(profile: text)
                MainScreenViewController.profile.append(newProfile)
            }
        }
        mainScreenView?.tableView.reloadData()
        mainScreenView?.textField.text = ""
    }


}


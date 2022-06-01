//
//  DetailedScreenViewController.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import Foundation
import UIKit

class DetailedScreenViewController: UIViewController {
        
    var profileIndex = 0
    
    var detailedScreenView: DetailedScreenView? {
        guard isViewLoaded else { return nil }
        return view as? DetailedScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = DetailedScreenView()
        let profile = ProfileForEdit.getData(index: profileIndex)
        setupView(profile: profile)
    }
    
    private func setupView(profile: Profile) {
        if let barButton = detailedScreenView?.barButton {
            barButton.target = self
            barButton.action = #selector(btnPresed)
        }
        navigationItem.rightBarButtonItem = detailedScreenView?.barButton
        
        detailedScreenView?.nameTextField.text = profile.name
        detailedScreenView?.birthdayTextField.text = profile.birthday
        detailedScreenView?.genderTextField.text = profile.gender
    }
    
    @objc private func btnPresed() {
        if detailedScreenView?.barButton.title == "Edit" {
            detailedScreenView?.barButton.title = "Save"
            detailedScreenView?.nameTextField.isEnabled = true
            detailedScreenView?.birthdayTextField.isEnabled = true
            detailedScreenView?.genderTextField.isEnabled = true
        } else {
            detailedScreenView?.barButton.title = "Edit"
            detailedScreenView?.nameTextField.isEnabled = false
            detailedScreenView?.birthdayTextField.isEnabled = false
            detailedScreenView?.genderTextField.isEnabled = false
            
            StorageManager().editProfile { [unowned self] in
                guard let name = detailedScreenView?.nameTextField.text else { return  ("", "", "", profileIndex) }
                guard let birthday = detailedScreenView?.birthdayTextField.text else { return  (name, "", "", profileIndex) }
                guard let gender = detailedScreenView?.genderTextField.text else { return  (name, birthday, "", profileIndex) }
                return (name, birthday, gender, profileIndex)
            }
        }
    }
}

//
//  DetailedScreenView.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import Foundation
import UIKit

class DetailedView: UIView {
        
    lazy var imageView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        let imageView = UIImageView(image: UIImage(systemName: "face.smiling"))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.layer.cornerRadius = 75
        return imageView
    }()
    
    lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Name..."
        if let image = UIImage(systemName: "person") {
            nameTextField.withImage(image: image)
        }
        nameTextField.isEnabled = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()
    
    lazy var birthdayTextField: UITextField = {
        let birthdayTextField = UITextField(frame: .zero)
        birthdayTextField.placeholder = "Birthday"
        if let image = UIImage(systemName: "calendar") {
            birthdayTextField.withImage(image: image)
        }
        birthdayTextField.isEnabled = false
        birthdayTextField.translatesAutoresizingMaskIntoConstraints = false
        return birthdayTextField
    }()
    
    lazy var genderTextField: UITextField = {
        let genderTextField = UITextField(frame: .zero)
        genderTextField.placeholder = "Gender"
        if let image = UIImage(systemName: "plus.forwardslash.minus") {
            genderTextField.withImage(image: image)
        }
        genderTextField.isEnabled = false
        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        return genderTextField
    }()
    
    lazy var barButton: UIBarButtonItem = {
       let barButton = UIBarButtonItem()
        barButton.title = "Edit"
        
        return barButton
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        viewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemGray6
    }
    
    private func viewHierarchy() {
        addSubview(imageView)
        addSubview(nameTextField)
        addSubview(birthdayTextField)
        addSubview(genderTextField)
    }
    
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,  constant: 10).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,  constant: -10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        birthdayTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        birthdayTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,  constant: 10).isActive = true
        birthdayTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,  constant: -10).isActive = true
        birthdayTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        genderTextField.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 20).isActive = true
        genderTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,  constant: 10).isActive = true
        genderTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,  constant: -10).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
}


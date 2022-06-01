//
//  DetailedScreenView.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import Foundation
import UIKit

class DetailedScreenView: UIView {
        
    lazy var imageView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        let imageView = UIImageView(image: UIImage(systemName: "face.smiling"))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.layer.cornerRadius = DetailedScreenViewMetrics.imageViewCornerRadius
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
        imageView.heightAnchor.constraint(equalToConstant: DetailedScreenViewMetrics.imageViewHeightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: DetailedScreenViewMetrics.imageViewWidthAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DetailedScreenViewMetrics.imageViewTopAnchorConstant).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: DetailedScreenViewMetrics.nameTextFieldTopAnchorConstant).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,  constant: DetailedScreenViewMetrics.nameTextFieldLeadingAnchorConstant).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,  constant: DetailedScreenViewMetrics.nameTextFieldTrailingAnchorConstant).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: DetailedScreenViewMetrics.nameTextFieldHeightAnchor).isActive = true
        
        birthdayTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: DetailedScreenViewMetrics.birthdayTextFieldTopAnchorConstant).isActive = true
        birthdayTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,  constant: DetailedScreenViewMetrics.birthdayTextFieldTopAnchorConstant).isActive = true
        birthdayTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,  constant: DetailedScreenViewMetrics.birthdayTextFieldTrailingAnchorConstant).isActive = true
        birthdayTextField.heightAnchor.constraint(equalToConstant: DetailedScreenViewMetrics.birthdayTextFieldHeightAnchor).isActive = true
        
        genderTextField.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: DetailedScreenViewMetrics.genderTextFieldTopAnchorConstant).isActive = true
        genderTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,  constant: DetailedScreenViewMetrics.genderTextFieldLeadingAnchor).isActive = true
        genderTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,  constant: DetailedScreenViewMetrics.genderTextFieldTrailingAnchor).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: DetailedScreenViewMetrics.genderTextFieldHeightAnchor).isActive = true
    }
}

enum DetailedScreenViewMetrics {
    static let imageViewCornerRadius = 75.0
    static let imageViewHeightAnchor = 150.0
    static let imageViewWidthAnchor = 150.0
    static let imageViewTopAnchorConstant = 30.0
                                              
    static let nameTextFieldTopAnchorConstant = 30.0
    static let nameTextFieldLeadingAnchorConstant = 10.0
    static let nameTextFieldTrailingAnchorConstant = -10.0
    static let nameTextFieldHeightAnchor = 34.0
    
    static let birthdayTextFieldTopAnchorConstant = 20.0
    static let birthdayTextFieldLeadingAnchorConstant = 10.0
    static let birthdayTextFieldTrailingAnchorConstant = -10.0
    static let birthdayTextFieldHeightAnchor = 34.0
    
    static let genderTextFieldTopAnchorConstant = 20.0
    static let genderTextFieldLeadingAnchor = 10.0
    static let genderTextFieldTrailingAnchor = -10.0
    static let genderTextFieldHeightAnchor = 34.0
}

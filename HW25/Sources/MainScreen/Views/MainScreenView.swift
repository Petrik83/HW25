//
//  MainScreenView.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import Foundation
import UIKit

class MainScreenView: UIView {
    
    static let idCell = "MainScreenViewCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Name..."
        textField.indent(size: MainScreenViewMetrics.textFieldIndent)
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = MainScreenViewMetrics.textFieldCornerRadius
        return textField
    }()
    
    lazy var button: UIButton = {
        var button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = MainScreenViewMetrics.buttonCornerRadius
        return button
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
        backgroundColor = .white
    }
    
    private func viewHierarchy() {
        addSubview(textField)
        addSubview(button)
        addSubview(tableView)
    }
    
    private func setupLayout() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,  constant: MainScreenViewMetrics.textFieldLeadingAnchorConstant).isActive = true
        textField.trailingAnchor.constraint(equalTo: button.leadingAnchor,  constant: MainScreenViewMetrics.textFieldTrailingAnchorConstant).isActive = true
        textField.heightAnchor.constraint(equalToConstant: MainScreenViewMetrics.textFieldHeightAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,  constant: MainScreenViewMetrics.buttonTrailingAnchorConstant).isActive = true
        button.heightAnchor.constraint(equalToConstant: MainScreenViewMetrics.buttonHeightAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: MainScreenViewMetrics.buttonWidthAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: MainScreenViewMetrics.tableViewTopAnchorConstant).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

enum MainScreenViewMetrics {
    static let textFieldIndent = 10.0
    static let textFieldCornerRadius = 10.0
    static let textFieldLeadingAnchorConstant = 10.0
    static let textFieldTrailingAnchorConstant = -10.0
    static let textFieldHeightAnchor = 34.0
    
    static let buttonCornerRadius = 17.0
    static let buttonTrailingAnchorConstant = -10.0
    static let buttonHeightAnchor = 34.0
    static let buttonWidthAnchor = 70.0
    
    static let tableViewTopAnchorConstant = 10.0
}

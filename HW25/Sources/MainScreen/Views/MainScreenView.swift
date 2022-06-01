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
        textField.indent(size: 10)
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var button: UIButton = {
        var button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 17
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
        textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,  constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: button.leadingAnchor,  constant: -10).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,  constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 34).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

//
//  TaskItemDetailView.swift
//  ios-task
//
//  Created by Okan Orkun on 4.02.2024.
//

import UIKit

class TaskItemDetailView: UIView {
    
    var task: TaskModel!
    
    init(task: TaskModel) {
        super.init(frame: .zero)
        self.task = task
        setupUI()
    }

//    private let taskLabel: UILabel = {
//        let label = TaskItemDetailViewComponents.headerLabelComponent(text: self().task.task)
//        return label
//    }()

    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Configure UI elements based on the 'task' property
        taskLabel.text = task.task

        // Add subviews, set constraints, etc.
    }

//    var task: TaskModel!
//    
//    private let taskLabel = TaskItemDetailViewComponents.defaultLabelComponent(task.task, Theme.defaultTheme.themeFont.headlineFont.boldVersion, .center)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupUI()
//    }
//    
//
//    func setupUI() {
//        view.backgroundColor = .white
//
//        let taskLabel = UILabel()
//        taskLabel.text = task?.task
//        taskLabel.font = Theme.defaultTheme.themeFont.headlineFont.boldVersion
//        taskLabel.textAlignment = .center
//        taskLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        let titleLabel = UILabel()
//        titleLabel.text = "Title: \(task?.title ?? "")"
//        titleLabel.numberOfLines = 0
//        titleLabel.textAlignment = .left
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        let descriptionLabel = UILabel()
//        descriptionLabel.text = "Description: \(task?.description ?? "")"
//        titleLabel.numberOfLines = 0
//        descriptionLabel.textAlignment = .left
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        let colorCodeLabel = UILabel()
//        colorCodeLabel.text = "Color Code: \(task?.colorCode ?? "")"
//        titleLabel.numberOfLines = 0
//        colorCodeLabel.textAlignment = .left
//        colorCodeLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        // Add more labels for other task information as needed...
//
//        let closeButton = UIButton()
//        closeButton.setTitle("Close", for: .normal)
//        closeButton.setTitleColor(.blue, for: .normal)
//        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(taskLabel)
//        view.addSubview(titleLabel)
//        view.addSubview(descriptionLabel)
//        view.addSubview(colorCodeLabel)
//        view.addSubview(closeButton)
//
//        NSLayoutConstraint.activate([
//            taskLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            taskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            titleLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 20),
//            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
//            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            colorCodeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
//            colorCodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            colorCodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            closeButton.topAnchor.constraint(equalTo: colorCodeLabel.bottomAnchor, constant: 40),
//            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
//
//    @objc func closeButtonTapped() {
//        dismiss(animated: true, completion: nil)
//    }
}


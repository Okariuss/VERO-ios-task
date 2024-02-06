//
//  TaskItemView.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import UIKit

class TaskItemView: UITableViewCell {
    
    private let taskLabel: UILabel = {
        return TaskItemComponents.defaultLabelComponent(Theme.defaultTheme.themeFont.headlineFont)
    }()

    private let titleLabel: UILabel = {
        return TaskItemComponents.defaultLabelComponent(Theme.defaultTheme.themeFont.bodyFont)
    }()

    private let descriptionLabel: UILabel = {
        return TaskItemComponents.defaultLabelComponent(Theme.defaultTheme.themeFont.subtitleFont)
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        addSubview(taskLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        configureConstraints()
    }
    
    private func taskConstraints() {
        let taskLabelConstraints = [
            taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: SpaceSize.normal.rawValue),
            taskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: SpaceSize.normal.rawValue),
            taskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: SpaceSize.normal.rawValue),
        ]
        
        NSLayoutConstraint.activate(taskLabelConstraints)
    }
    
    private func titleConstraints() {
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: SpaceSize.normal.rawValue),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -SpaceSize.normal.rawValue)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    private func descriptionConstraints() {
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: SpaceSize.low.rawValue),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: SpaceSize.normal.rawValue),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -SpaceSize.normal.rawValue),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -SpaceSize.low.rawValue)
        ]
        
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }
    
    private func configureConstraints() {
        taskConstraints()
        
        titleConstraints()
        
        descriptionConstraints()
    }

    func configure(with task: TaskModel) {
        taskLabel.text = "TASK: \(task.task)"
        titleLabel.text = "TITLE: \(task.title)"
        descriptionLabel.text = task.description
        backgroundColor = task.backgroundColor
    }

}

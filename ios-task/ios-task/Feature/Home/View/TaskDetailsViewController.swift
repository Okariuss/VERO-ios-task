//
//  TaskDetailsViewController.swift
//  ios-task
//
//  Created by Okan Orkun on 5.02.2024.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    var selectedTask: TaskModel?

    private lazy var titleLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.title)
    }()

    private lazy var descriptionLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.description)
    }()

    private lazy var colorCodeLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.colorCode)
    }()

    private lazy var wageTypeLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.wageType)
    }()

    private lazy var businessUnitLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.businessUnit.rawValue)
    }()

    private lazy var workingTimeLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.workingTime.debugDescription)
    }()

    private lazy var businessUnitKeyLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.businessUnitKey?.rawValue)
    }()

    private lazy var sortLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.sort)
    }()

    private lazy var taskLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.task)
    }()
    
    private lazy var parentTaskLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.parentTaskID.rawValue)
    }()


    private lazy var availabilityLabel: UILabel = {
        return TaskItemDetailViewComponents.defaultLabelComponent(selectedTask?.isAvailableInTimeTrackingKioskMode.description)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = selectedTask?.backgroundColor ?? .systemBackground
        navigationController?.navigationBar.tintColor = .label
        title = selectedTask?.task

        setupUI()
        populateTaskDetails()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(colorCodeLabel)
        view.addSubview(wageTypeLabel)
        view.addSubview(businessUnitLabel)
        view.addSubview(workingTimeLabel)
        view.addSubview(businessUnitKeyLabel)
        view.addSubview(sortLabel)
        view.addSubview(taskLabel)
        view.addSubview(parentTaskLabel)
        view.addSubview(availabilityLabel)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        titleLabelConstraints()
        descriptionLabelConstraints()
        colorCodeLabelConstraints()
        wageTypeLabelConstraints()
        businessUnitLabelConstraints()
        workingTimeLabelConstraints()
        businessUnitKeyLabelConstraints()
        sortLabelConstraints()
        taskLabelConstraints()
        parentTaskLabelConstraints()
        availabilityLabelConstraints()
    }
    
    private func titleLabelConstraints() {
        let taskLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: SpaceSize.medium.rawValue),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(taskLabelConstraints)
    }
    
    private func descriptionLabelConstraints() {
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }
    
    private func colorCodeLabelConstraints() {
        let colorCodeLabelConstraints = [
            colorCodeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            colorCodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            colorCodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(colorCodeLabelConstraints)
    }
    
    private func wageTypeLabelConstraints() {
        let wageTypeLabelConstraints = [
            wageTypeLabel.topAnchor.constraint(equalTo: colorCodeLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            wageTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            wageTypeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(wageTypeLabelConstraints)
    }
    
    private func businessUnitLabelConstraints() {
        let businessUnitLabelConstraints = [
            businessUnitLabel.topAnchor.constraint(equalTo: wageTypeLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            businessUnitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            businessUnitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(businessUnitLabelConstraints)
    }
    
    private func workingTimeLabelConstraints() {
        let workingTimeLabelConstraints = [
            workingTimeLabel.topAnchor.constraint(equalTo: businessUnitLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            workingTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            workingTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(workingTimeLabelConstraints)
    }
    
    private func businessUnitKeyLabelConstraints() {
        let businessUnitKeyLabelConstraints = [
            businessUnitKeyLabel.topAnchor.constraint(equalTo: workingTimeLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            businessUnitKeyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            businessUnitKeyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(businessUnitKeyLabelConstraints)
    }
    
    private func sortLabelConstraints() {
        let sortLabelConstraints = [
            sortLabel.topAnchor.constraint(equalTo: businessUnitKeyLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            sortLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            sortLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(sortLabelConstraints)
    }
    
    private func taskLabelConstraints() {
        let taskLabelConstraints = [
            taskLabel.topAnchor.constraint(equalTo: sortLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(taskLabelConstraints)
    }
    
    private func parentTaskLabelConstraints() {
        let parentTaskLabelConstraints = [
            parentTaskLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            parentTaskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            parentTaskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(parentTaskLabelConstraints)
    }
    
    private func availabilityLabelConstraints() {
        let availabilityLabelConstraints = [
            availabilityLabel.topAnchor.constraint(equalTo: parentTaskLabel.bottomAnchor, constant: SpaceSize.normal.rawValue),
            availabilityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SpaceSize.medium.rawValue),
            availabilityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SpaceSize.medium.rawValue)
        ]
        NSLayoutConstraint.activate(availabilityLabelConstraints)
    }

    private func populateTaskDetails() {
        guard let task = selectedTask else {
            return
        }

        titleLabel.text = "TITLE: \(task.title)"
        descriptionLabel.text = "DESCRIPTION: \(task.description)"
        colorCodeLabel.text = "COLOR CODE: \(task.colorCode)"
        wageTypeLabel.text = "WAGE TYPE: \(task.wageType)"
        businessUnitLabel.text = "BUSINESS UNIT: \(task.businessUnit.rawValue)"
        workingTimeLabel.text = "WORKING TIME: \(task.workingTime.debugDescription)"
        businessUnitKeyLabel.text = "BUSINESS UNIT KEY: \(task.businessUnitKey?.rawValue ?? "N/A")"
        sortLabel.text = "SORT: \(task.sort)"
        taskLabel.text = "TASK: \(task.task)"
        parentTaskLabel.text = "PARENT TASK: \(task.parentTaskID.rawValue)"
        availabilityLabel.text = "AVAILABILITY: \(task.isAvailableInTimeTrackingKioskMode)"
    }
}


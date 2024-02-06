//
//  HomeScreenViewController.swift
//  ios-task
//
//  Created by Okan Orkun on 1.02.2024.
//

import UIKit
import AVFoundation


class HomeScreenViewController: UIViewController {

    var viewModel: HomeScreenViewModel!
    
    private let titleLabel: UILabel = {
        return HomeScreenComponents.defaultHomeViewLabel(AppConstants.appName)
    }()
    
    private(set) lazy var searchBar = UISearchBar()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let searchButton: UIButton = {
        return HomeScreenComponents.defaultButtonComponent(ImagePath.search.toSystemImage)
    }()
    
    private let scanButton: UIButton = {
        return HomeScreenComponents.defaultButtonComponent(ImagePath.qr.toSystemImage)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
        
    }
    
    private func setDesign() {
        
        configureNavigationBar()
        
        tableViewDesign()
        
        configureConstraints()
        
        viewModelOperation()
    }
    
    private func configureNavigationBar() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        showSearchBarButton(shouldShow: true)
        
        searchBar.sizeToFit()
        searchBar.delegate = self
    }
    
    private func tableViewDesign() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskItemView.self, forCellReuseIdentifier: CellIdentifiers.taskItemView.rawValue)
        tableView.refreshControl = refreshControl()
    }
    
    private func configureConstraints() {
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
    
    private func viewModelOperation() {
        viewModel = HomeScreenViewModel()
        viewModel.delegate = self
        viewModel.authenticateAndFetchData()
    }
    
    private func refreshControl() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }
    
    @objc private func refreshData() {
        viewModel.authenticateAndFetchData()
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        let searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        let scanBarButtonItem = UIBarButtonItem(customView: scanButton)
        if shouldShow {
            navigationItem.rightBarButtonItems = [searchBarButtonItem, scanBarButtonItem]
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        } else {
            navigationItem.rightBarButtonItems = nil
            navigationItem.leftBarButtonItem = nil
        }
    }
    
    @objc private func searchButtonTapped() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }
    
    @objc private func scanButtonTapped() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: AppConstants.takePhoto, style: .default) { _ in
            self.presentImagePicker(sourceType: .camera)
        }
        alertController.addAction(cameraAction)
        
        let galleryAction = UIAlertAction(title: AppConstants.chooseGallery, style: .default) { _ in
            self.presentImagePicker(sourceType: .photoLibrary)
        }
        alertController.addAction(galleryAction)
        
        let cancelAction = UIAlertAction(title: AppConstants.cancel, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    private func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        imagePickerController.allowsEditing = false
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    func setupQRScanner() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            startCaptureSession()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                if granted {
                    DispatchQueue.main.async {
                        self?.startCaptureSession()
                    }
                } else {
                    self?.showError(message: AppConstants.cameraAccessDenied)
                }
            }
        default:
            showError(message: AppConstants.cameraAccessDenied)
            break
        }
    }

    private func startCaptureSession() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            showError(message: AppConstants.noCamera)
            return
        }

        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            let captureSession = AVCaptureSession()
            captureSession.addInput(input)

            let metadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]

            captureSession.startRunning()

        } catch {
            showError(message: AppConstants.noCamera)
        }
    }
}

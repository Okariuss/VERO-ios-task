//
//  SplashScreenViewController.swift
//  ios-task
//
//  Created by Okan Orkun on 31.01.2024.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    private let appIconView: UIImageView = {
        let appIcon = UIImageView(frame: .zero)
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        appIcon.image = ImagePath.appImage.toImage
        appIcon.contentMode = .scaleAspectFill
        return appIcon
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setDesign()
        
        skipSplash()
    }
    
    private func setDesign() {
        view.backgroundColor = .white
        
        view.addSubview(appIconView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        SplashScreenViewController.centerSplashItemsConfigurations(in: self)
    }
    
    private func skipSplash() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let vc = HomeScreenViewController()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }

}

extension SplashScreenViewController {
    static func centerSplashItemsConfigurations(in vc: SplashScreenViewController) {
        
        let appIconViewConstraints = [
            vc.appIconView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            vc.appIconView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(appIconViewConstraints)
    }
}

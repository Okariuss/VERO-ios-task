//
//  QRScannerViewModel.swift
//  ios-task
//
//  Created by Okan Orkun on 5.02.2024.
//

import Foundation
import AVFoundation

protocol QRScannerViewModelDelegate: AnyObject {
    func didScanQRCode(_ code: String)
    func showError(message: String)
}

class QRScannerViewModel {
    
    weak var delegate: QRScannerViewModelDelegate?
    
    func handleQRCodeScanResult(_ result: String) {
        delegate?.didScanQRCode(result)
    }

    func handleError(_ message: String) {
        delegate?.showError(message: message)
    }
    
    func presentQRScanner() {
        
        
    }
}

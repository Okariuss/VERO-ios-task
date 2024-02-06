//
//  QRScanner+Extension.swift
//  ios-task
//
//  Created by Okan Orkun on 6.02.2024.
//

import Foundation
import AVFoundation
import UIKit

extension HomeScreenViewController: AVCaptureMetadataOutputObjectsDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metadataObject in metadataObjects {
            if let qrCode = metadataObject as? AVMetadataMachineReadableCodeObject,
                qrCode.type == .qr,
                let stringValue = qrCode.stringValue {
                searchBar.text = stringValue
                handleSearch(with: stringValue)
                search(shouldShow: true)
                searchBar.becomeFirstResponder()
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            decodeQRCode(image: pickedImage)
        }
        dismiss(animated: true, completion: nil)
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    private func decodeQRCode(image: UIImage) {
        if let ciImage = CIImage(image: image) {
            let context = CIContext()
            let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: context, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
            let features = detector?.features(in: ciImage)
            if let firstFeature = features?.first as? CIQRCodeFeature {
                let decodedQRCode = firstFeature.messageString
                searchBar.text = decodedQRCode
                handleSearch(with: decodedQRCode)
                search(shouldShow: true)
                searchBar.becomeFirstResponder()
            } else {
                showError(message: AppConstants.noQR)
            }
        }
    }

}

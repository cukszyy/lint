//
//  ImagePicker.swift
//  lint
//
//  Created by Lucas Portella on 18/09/20.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPickerEnabled: Bool
    @Binding var avatarData: Data
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var pickerConfig = PHPickerConfiguration()
        pickerConfig.selectionLimit = 1
        
        let pickerController = PHPickerViewController(configuration: pickerConfig)
        pickerController.delegate = context.coordinator
        return pickerController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    // Context Coordinator
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if results.isEmpty {
                self.parent.isPickerEnabled = false
            }
            
            guard let item = results.first else {
                print("No data found - PHPickerResult is nil")
                return
            }
            
            let pickerResult = item.itemProvider
            
            if pickerResult.canLoadObject(ofClass: UIImage.self) {
                pickerResult.loadObject(ofClass: UIImage.self) { (image, err) in
                    if err != nil {
                        print("Error while loading image. Details: \(err?.localizedDescription ?? "")")
                    }
                    
                    guard let imageData = image as? UIImage else {
                        print("Could not convert data to image")
                        return
                    }
                    
                    guard let imageDataJPEG = imageData.jpegData(compressionQuality: 0.5) else {
                        print("Could not convert data into JPEG")
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.parent.avatarData = imageDataJPEG
                        self.parent.isPickerEnabled = false
                    }
                }
            }
        }
    }
    
}

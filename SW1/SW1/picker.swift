//
//  picker.swift
//  SW1
//
//  Created by abdullah FH  on 01/11/1442 AH.
//

import SwiftUI

struct picker : UIViewControllerRepresentable {
    
    @Binding var shown : Bool
    @ Binding var IMGData : Data
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(IMGData1: $IMGData, shown1: $shown)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<picker>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<picker>) {
      
    }
    
    class Coordinator : NSObject , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        
        @Binding var IMGData : Data
        @Binding var shown : Bool
        
        
           init(IMGData1 : Binding<Data> ,shown1 : Binding<Bool>) {
            
            _IMGData = IMGData1
            _shown = shown1
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            shown.toggle()
            
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            
           let image = info[.originalImage] as! UIImage
            IMGData = image.jpegData(compressionQuality: 80)!
            shown.toggle()
            
        }
        
    }
}

//
//  ViewController.swift
//  UIImagePickerSwift
//
//  Created by Field Employee on 3/30/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imageBottom = UIImagePickerController()
    let imageTop = UIImagePickerController()
    var selectButton: UIButton = {
        print("Here")
        let btn = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.setTitle("Load Images", for: .normal)
        btn.addTarget(self, action: #selector(pickImages), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.present(self.imagePickerController, animated: true, completion: nil)
        // setUpImages()
        setUpButton()
        
        let button:UIButton = UIButton()
        button.backgroundColor = .black
        button.setTitle("Button", for: .normal)
        self.view.addSubview(button)
    }
    
    func setUpButton() {
        view.addSubview(selectButton)
        /*
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        */
    }
    
    func setUpImages() {
        imageBottom.delegate = self
        imageBottom.sourceType = .photoLibrary // options: .Camera , .PhotoLibrary , .SavedPhotosAlbum 
    }
    
    @objc func pickImages(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage {
            print("Image picked. What now")
        }
        self.dismiss(animated: true, completion: nil)
    }


}


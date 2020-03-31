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

    var selectFirstButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Load Fist Image", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(pickFirstImage), for: .touchUpInside)
        return btn
    }()
    
    var selectSecondButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Load Second Image", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(pickSecondImage), for: .touchUpInside)
        return btn
    }()
    
    var imgViewTop: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.alpha = 0.5
        imgV.contentMode = .scaleAspectFit
        return imgV
    }()
    
    var imgViewBottom: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        return imgV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
        setUpImages()
    }
    
    func setUpButtons() {
        view.addSubview(selectFirstButton)
        view.addSubview(selectSecondButton)

        NSLayoutConstraint.activate([
            selectFirstButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            selectFirstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            selectFirstButton.heightAnchor.constraint(equalToConstant: 100.0),
            selectFirstButton.rightAnchor.constraint(equalTo: view.centerXAnchor),
            
            selectSecondButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            selectSecondButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            selectSecondButton.heightAnchor.constraint(equalToConstant: 100.0),
            
            selectSecondButton.widthAnchor.constraint(equalTo: selectFirstButton.widthAnchor)
        ])
    }
    
    func setUpImages() {
        imageBottom.delegate = self
        imageBottom.sourceType = .photoLibrary // options: .Camera , .PhotoLibrary , .SavedPhotosAlbum
        imageTop.delegate = self
        imageTop.sourceType = .photoLibrary // options: .Camera , .PhotoLibrary , .SavedPhotosAlbum
        
        view.addSubview(imgViewBottom)
        view.addSubview(imgViewTop)

        NSLayoutConstraint.activate([
            imgViewTop.leftAnchor.constraint(equalTo: view.leftAnchor),
            imgViewTop.bottomAnchor.constraint(equalTo: selectFirstButton.topAnchor),
            imgViewTop.rightAnchor.constraint(equalTo: view.rightAnchor),
            imgViewTop.topAnchor.constraint(equalTo: view.topAnchor),
            
            imgViewBottom.leftAnchor.constraint(equalTo: view.leftAnchor),
            imgViewBottom.bottomAnchor.constraint(equalTo: imgViewTop.bottomAnchor),
            imgViewBottom.rightAnchor.constraint(equalTo: view.rightAnchor),
            imgViewBottom.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    
    @objc func pickFirstImage() {
        self.present(self.imageBottom, animated: true, completion: nil)
    }
    
    @objc func pickSecondImage() {
        self.present(self.imageTop, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image callback")
        self.dismiss(animated: true, completion: nil)
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage {
            if picker == imageBottom {
                imgViewBottom.image = pickedImage
                return
            }
            imgViewTop.image = pickedImage
        }
        
    }


}


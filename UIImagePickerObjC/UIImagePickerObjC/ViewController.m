//
//  ViewController.m
//  UIImagePickerObjC
//
//  Created by Hugo Flores Perez on 3/30/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIImagePickerController *imageBottom;
UIImagePickerController *imageTop;

UIButton *selectFirstButton;
UIButton *selectSecondButton;

UIImageView *imgViewTop;
UIImageView *imgViewBottom;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpButtons];
    [self setUpImages];
}

- (void)setUpButtons {
    selectFirstButton = [[UIButton alloc] init];
    selectFirstButton.translatesAutoresizingMaskIntoConstraints = false;
    [selectFirstButton setTitle:@"Load First Image" forState:UIControlStateNormal];
    selectFirstButton.backgroundColor = UIColor.redColor;
    [selectFirstButton addTarget:self action:@selector(pickFirstImage) forControlEvents:UIControlEventTouchUpInside];
    
    selectSecondButton = [[UIButton alloc] init];
    selectSecondButton.translatesAutoresizingMaskIntoConstraints = false;
    [selectSecondButton setTitle:@"Load Second Image" forState:UIControlStateNormal];
    selectSecondButton.backgroundColor = UIColor.blueColor;
    [selectSecondButton addTarget:self action:@selector(pickSecondImage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:selectFirstButton];
    [self.view addSubview:selectSecondButton];
    
    [selectFirstButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = true;
    [selectFirstButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;
    [selectFirstButton.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [selectFirstButton.heightAnchor constraintEqualToConstant:100.0].active = true;
    
    [selectSecondButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
    [selectSecondButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;
    [selectSecondButton.leftAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [selectSecondButton.heightAnchor constraintEqualToConstant:100.0].active = true;
}

- (void)setUpImages {
    imageBottom = [[UIImagePickerController alloc] init];
    imageBottom.delegate = self;
    imageBottom.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imageTop = [[UIImagePickerController alloc] init];
    imageTop.delegate = self;
    imageTop.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    imgViewBottom = [[UIImageView alloc] init];
    imgViewBottom.translatesAutoresizingMaskIntoConstraints = false;
    imgViewBottom.contentMode = UIViewContentModeScaleAspectFit;
    
    imgViewTop = [[UIImageView alloc] init];
    imgViewTop.translatesAutoresizingMaskIntoConstraints = false;
    imgViewTop.contentMode = UIViewContentModeScaleAspectFit;
    imgViewTop.alpha = 0.5;
    
    [self.view addSubview:imgViewBottom];
    [self.view addSubview:imgViewTop];
    
    [imgViewBottom.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = true;
    [imgViewBottom.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
    [imgViewBottom.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = true;
    [imgViewBottom.bottomAnchor constraintEqualToAnchor:selectFirstButton.topAnchor].active = true;
    
    [imgViewTop.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = true;
    [imgViewTop.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
    [imgViewTop.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = true;
    [imgViewTop.bottomAnchor constraintEqualToAnchor:selectFirstButton.topAnchor].active = true;
}

- (void)pickFirstImage {
    [self presentViewController:imageBottom animated:true completion:nil];
}

- (void)pickSecondImage {
    [self presentViewController:imageTop animated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [self dismissViewControllerAnimated:true completion:nil];
    UIImage *pickedImage = info[UIImagePickerControllerOriginalImage];
    if (pickedImage) {
        if (picker == imageBottom) {
            imgViewBottom.image = pickedImage;
            return;
        }
        imgViewTop.image = pickedImage;
        return;
    }
}


@end

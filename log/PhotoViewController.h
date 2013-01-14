//
//  PhotoViewController.h
//  dailyLog
//
//  Created by Maxim Boldyrev on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CAMERA_TRANSFORM_X 1
#define CAMERA_TRANSFORM_Y 1.12412
#define SCREEN_WIDTH  320
#define SCREEN_HEIGTH 480

@interface PhotoViewController : UIViewController{
    UIView *overlayView;
    UIImagePickerController *picker;
    IBOutlet UIView *top;
    UIButton *forvardButton;
    UINavigationBar *navBar;
}

@property (nonatomic, strong) IBOutlet UIView *overlayView;

@end

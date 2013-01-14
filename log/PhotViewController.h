//
//  PhotViewController.h
//  dailyLog
//
//  Created by Maxim Boldyrev on 24.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface PhotViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate> {
    UIButton *forvardButton;
    UINavigationBar *navBar;
    UIImagePickerController *imagePicker;
    IBOutlet UIImageView *imageField;
}
@property (weak, nonatomic) AppDelegate *app;

@end

//
//  PhotoCell.h
//  dailyLog
//
//  Created by Maxim Boldyrev on 24.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UITableViewCell{
    IBOutlet UILabel *test;
    IBOutlet UIImageView *faceImage;
}
@property (nonatomic) IBOutlet UILabel *test;
@property (nonatomic) IBOutlet UIImageView *faceImage;

@end

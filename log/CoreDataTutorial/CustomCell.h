//
//  StateTableCellView.h
//  States
//
//  Created by Julio Barros on 1/26/09.
//  Copyright 2009 E-String Technologies, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomCell : UITableViewCell {
	IBOutlet UILabel * __weak TitleLbl;
    IBOutlet UIImageView * __weak MoodImage;
    IBOutlet UILabel * __weak dateTitleLbl;
    IBOutlet UIImageView * faceImage;
}

@property ( weak, nonatomic) IBOutlet UILabel *TitleLbl;
@property ( weak, nonatomic) IBOutlet UIImageView *MoodImage;
@property (weak, nonatomic) IBOutlet UILabel * dateTitleLbl;
@property ( nonatomic) IBOutlet UIImageView * faceImage;

@end

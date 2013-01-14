//
//  DetailCellViewController.h
//  dailyLog
//
//  Created by Maxim Boldyrev on 21.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Phone.h"

@interface DetailCellViewController : UIViewController

@property (unsafe_unretained, nonatomic) Phone *phone;
@property (unsafe_unretained, nonatomic) NSManagedObjectContext *context;

@end

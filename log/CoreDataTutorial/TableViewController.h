//
//  TableViewController.h
//  CoreDataTutorial
//
//  Created by Dan on 22/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Phone.h"
#import <QuartzCore/QuartzCore.h>

@interface TableViewController : UITableViewController{
    UIButton *infoBtn;
    UIButton *addBtn;
    UIButton *editBtn;
    UISegmentedControl *segment;
}

@property ( nonatomic) NSManagedObjectContext *context;
@property ( nonatomic) NSMutableArray *arr;

@property (strong,nonatomic) Phone *pHone;


@end

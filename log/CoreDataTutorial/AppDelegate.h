//
//  AppDelegate.h
//  CoreDataTutorial
//
//  Created by Dan on 22/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIImage *gradientImage44;
    NSString *questionOneData;
    NSString *questionTwoData;
    NSString *questionThreeData;
    NSString *questionFourData;
    NSString *questionFiveData;
    NSString *questionSixData;
    NSString *questionSevenData;
    NSString *questionEightData;
    NSString *questionNineData;
    NSString *questionTenData;
    NSString *questionElevenData;
    NSString *questionTwelveData;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (copy, readwrite)NSString *questionOneData;
@property (copy, readwrite)NSString *questionTwoData;
@property (copy, readwrite)NSString *questionThreeData;
@property (copy, readwrite)NSString *questionFourData;
@property (copy, readwrite)NSString *questionFiveData;
@property (copy, readwrite)NSString *questionSixData;
@property (copy, readwrite)NSString *questionSevenData;
@property (copy, readwrite)NSString *questionEightData;
@property (copy, readwrite)NSString *questionNineData;
@property (copy, readwrite)NSString *questionTenData;
@property (copy, readwrite)NSString *questionElevenData;
@property (copy, readwrite)NSString *questionTwelveData;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

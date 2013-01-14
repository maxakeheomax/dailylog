//
//  PhotViewController.m
//  dailyLog
//
//  Created by Maxim Boldyrev on 24.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Phone.h"

@interface PhotViewController ()

@end

@implementation PhotViewController
@synthesize app;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        app = [[UIApplication sharedApplication] delegate];
    }
    return self;
}

-(IBAction)ok:(id)sender{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [app managedObjectContext];
    
    Phone *phone = [NSEntityDescription insertNewObjectForEntityForName:@"Phone" inManagedObjectContext:context];
    
    phone.name = appDelegate.questionOneData;
    phone.two = appDelegate.questionTwoData;
    phone.three = appDelegate.questionThreeData;
    phone.four = appDelegate.questionFourData;
    phone.five = appDelegate.questionFiveData;
    phone.six = appDelegate.questionSixData;
    phone.seven = appDelegate.questionSevenData;
    phone.eight = appDelegate.questionEightData;
    phone.nine = appDelegate.questionNineData;
    phone.ten = appDelegate.questionTenData;
    phone.eleven = appDelegate.questionElevenData;
    phone.twelve = appDelegate.questionTwelveData;
    phone.titleForSort = [NSDate date];
    
    if (imageField.image)
    {
        // Resize and save a smaller version for the table
        float resize = 200;
        float actualWidth = imageField.image.size.width;
        float actualHeight = imageField.image.size.height;
        float divBy, newWidth, newHeight;
        if (actualWidth > actualHeight) {
            divBy = (actualWidth / resize);
            newWidth = resize;
            newHeight = (actualHeight / divBy);
        } else {
            divBy = (actualHeight / resize);
            newWidth = (actualWidth / divBy);
            newHeight = resize;
        }
        CGRect rect = CGRectMake(0.0, 0.0, newWidth, newHeight);
        UIGraphicsBeginImageContext(rect.size);
        [imageField.image drawInRect:rect];
        UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [imageField.image drawInRect:rect];
        
        NSData *smallImageData = UIImagePNGRepresentation(smallImage);
        
        phone.photoData = smallImageData;
    }

    
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    
    if ([comp weekday] == 2) {
        phone.weekDay = @"Mon";
    } else if ([comp weekday] == 3) {
        phone.weekDay = @"Tue";
    } else if ([comp weekday] == 4) {
        phone.weekDay = @"Wed";
    } else if ([comp weekday] == 5) {
        phone.weekDay = @"Thu";
    } else if ([comp weekday] == 6) {
        phone.weekDay = @"Fri";
    } else if ([comp weekday] == 7) {
        phone.weekDay = @"Sat";
    } else if ([comp weekday] == 1) {
        phone.weekDay = @"Sun";
    }
    
    NSDateComponents *mainTitleDay = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:[NSDate date]];
    NSDateComponents *mainTitleMonth = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:[NSDate date]];
    NSDateComponents *mainTitleYear = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
    NSString *yearString = [NSString stringWithFormat:@"%@",mainTitleYear];
    NSString *dayString = [NSString stringWithFormat:@"%@",mainTitleDay];
    
    NSString *s6 = [dayString substringFromIndex:39];
    NSString *s7 = [yearString substringFromIndex:49];
    
    NSLog(@"%@",s6);
    NSLog(@"%@",s7);
    NSString *month;
    
    if ([mainTitleMonth month] == 1) {
        month = @"Jan";
    } else if ([mainTitleMonth month] == 2) {
        month = @"Feb";
    } else if ([mainTitleMonth month] == 3) {
        month = @"March";
    } else if ([mainTitleMonth month] == 4) {
        month = @"Apr";
    } else if ([mainTitleMonth month] == 5) {
        month = @"May";
    } else if ([mainTitleMonth month] == 6) {
        month = @"Jun";
    } else if ([mainTitleMonth month] == 7) {
        month = @"Jul";
    } else if ([mainTitleMonth month] == 8) {
        month = @"Aug";
    } else if ([mainTitleMonth month] == 9) {
        month = @"Sept";
    } else if ([mainTitleMonth month] == 10) {
        month = @"Oct";
    } else if ([mainTitleMonth month] == 11) {
        month = @"Nov";
    } else if ([mainTitleMonth month] == 12) {
        month = @"Dec";
    }
    NSLog(@"%@",month);
    
    NSString *mainTitle = [NSString stringWithFormat:@"%@ %@ %@",s6, month,s7];
    phone.title = mainTitle;
    [self close];
    
    NSError *error;
    
    if (![context save:&error]) {
        NSLog(@"Whoops");
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"dailyShotNavBar.png"] forBarMetrics:UIBarMetricsDefault];
}
-(void)viewWillAppear:(BOOL)animated{
    [forvardButton removeFromSuperview];
    [super viewWillAppear:animated];
    // Set the background image for *all* UINavigationBars
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"dailyShotNavBar.png"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad
{   
    UIToolbar *toolsL = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)];
    toolsL.clearsContextBeforeDrawing = NO;
    toolsL.clipsToBounds = NO;
    toolsL.tintColor = [UIColor colorWithWhite:0.305f alpha:0.0f];
    toolsL.barStyle = -1; 
    
    NSMutableArray *buttonsL = [[NSMutableArray alloc] initWithCapacity:4];
    
    UIBarButtonItem *qwL = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    qwL.width = -10.0f;
    [buttonsL addObject:qwL];
    
    UIButton *appInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [appInfoButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [appInfoButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
    [appInfoButton setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [appInfoButton setImage:[UIImage imageNamed:@"backButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:appInfoButton];
    
    [buttonsL addObject:leftItem];
    
    // Add buttons to toolbar and toolbar to nav bar.
    [toolsL setItems:buttonsL animated:NO];
    
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsL];
    self.navigationItem.leftBarButtonItem = oneButton;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)close{
    UINavigationController *navController = self.navigationController;
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
    [navController popViewControllerAnimated:NO];
}

-(IBAction)makePhoto:(id)sender{ 
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else {
        UIAlertView *err = [[UIAlertView alloc]initWithTitle:@"error!" message:@"No camera found" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [err show];
        UIToolbar *toolsR = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)];
        toolsR.clearsContextBeforeDrawing = NO;
        toolsR.clipsToBounds = NO;
        toolsR.tintColor = [UIColor colorWithWhite:0.305f alpha:0.0f];
        toolsR.barStyle = -1; 
        
        NSMutableArray *buttonsR = [[NSMutableArray alloc] initWithCapacity:2];
        
        UIBarButtonItem *qwR = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        qwR.width = 60.0f;
        [buttonsR addObject:qwR];
        
        forvardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [forvardButton addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
        [forvardButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
        [forvardButton setImage:[UIImage imageNamed:@"readyButton.png"] forState:UIControlStateNormal];
        [forvardButton setImage:[UIImage imageNamed:@"readyButtonActive.png"] forState:UIControlStateHighlighted];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:forvardButton];
        
        [buttonsR addObject:leftItem];
        
        // Add buttons to toolbar and toolbar to nav bar.
        [toolsR setItems:buttonsR animated:NO];
        
        UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsR];
        self.navigationItem.rightBarButtonItem = oneButton;
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    imageField.image = image;
    [imagePicker dismissModalViewControllerAnimated:YES];
    
    UIToolbar *toolsR = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)];
    toolsR.clearsContextBeforeDrawing = NO;
    toolsR.clipsToBounds = NO;
    toolsR.tintColor = [UIColor colorWithWhite:0.305f alpha:0.0f];
    toolsR.barStyle = -1;
    
    NSMutableArray *buttonsR = [[NSMutableArray alloc] initWithCapacity:2];
    
    UIBarButtonItem *qwR = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    qwR.width = 60.0f;
    [buttonsR addObject:qwR];
    
    forvardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [forvardButton addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    [forvardButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
    [forvardButton setImage:[UIImage imageNamed:@"readyButton.png"] forState:UIControlStateNormal];
    [forvardButton setImage:[UIImage imageNamed:@"readyButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:forvardButton];
    
    [buttonsR addObject:leftItem];
    
    // Add buttons to toolbar and toolbar to nav bar.
    [toolsR setItems:buttonsR animated:NO];
    
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsR];
    self.navigationItem.rightBarButtonItem = oneButton;
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [imagePicker dismissModalViewControllerAnimated:YES];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

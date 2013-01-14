//
//  DetailViewController.m
//  CoreDataTutorial
//
//  Created by Dan on 22/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Phone.h"
//#import "QuestionOneViewController.h"
#import "AppDelegate.h"


@implementation DetailViewController

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
    
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    
    if ([comp weekday] == 1) {
        phone.weekDay = @"Mon";
    } else if ([comp weekday] == 2) {
        phone.weekDay = @"Tue";
    } else if ([comp weekday] == 3) {
        phone.weekDay = @"Wed";
    } else if ([comp weekday] == 4) {
        phone.weekDay = @"Thu";
    } else if ([comp weekday] == 5) {
        phone.weekDay = @"Fri";
    } else if ([comp weekday] == 6) {
        phone.weekDay = @"Sat";
    } else if ([comp weekday] == 7) {
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
    
    NSMutableString *mainTitle = [NSMutableString stringWithFormat:@"%@ %@ %@",s6, month,s7];
    phone.title = mainTitle;
    [self dismissModalViewControllerAnimated:YES];
    
    NSError *error;
    
    if (![context save:&error]) {
        NSLog(@"Whoops");
    }    
}
- (void)viewDidLoad
{
    navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@""];
    [navBar pushNavigationItem:navItem animated:NO];
    [self.view addSubview:navBar];
    [navBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    [super viewDidLoad];
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
    navItem.rightBarButtonItem = oneButton;
    // Do any additional setup after loading the view from its nib.
}
-(void)back{
    [self dismissModalViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // Set the background image for *all* UINavigationBars
    [navBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

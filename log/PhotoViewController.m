//
//  PhotoViewController.m
//  dailyLog
//
//  Created by Maxim Boldyrev on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"
#import "DetailViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface PhotoViewController ()

@end

@implementation PhotoViewController
@synthesize overlayView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // Set the background image for *all* UINavigationBars
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"dailyShotNavBar.png"] forBarMetrics:UIBarMetricsDefault];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        picker.showsCameraControls = NO;
        picker.navigationBarHidden = YES;
        picker.wantsFullScreenLayout = YES;
        picker.cameraViewTransform = CGAffineTransformScale(picker.cameraViewTransform, 0.88, 0.88);
        picker.cameraOverlayView = overlayView;
        [self.view addSubview:picker.view];
    }
    else {
        DetailViewController *detail = [[DetailViewController alloc]init];
        detail.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:detail animated:YES];
    }
}
- (void)viewDidLoad
{   
    navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@""];
    [navBar pushNavigationItem:navItem animated:NO];
    [self.view addSubview:navBar];
    [navBar setBackgroundImage:[UIImage imageNamed:@"dailyShotNavBar.png"] forBarMetrics:UIBarMetricsDefault];
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
    [forvardButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [forvardButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
    [forvardButton setImage:[UIImage imageNamed:@"readyButton.png"] forState:UIControlStateNormal];
    [forvardButton setImage:[UIImage imageNamed:@"readyButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:forvardButton];
    
    [buttonsR addObject:leftItem];
    
    // Add buttons to toolbar and toolbar to nav bar.
    [toolsR setItems:buttonsR animated:NO];
    
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsR];
    navItem.rightBarButtonItem = oneButton;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewDidDisappear:(BOOL)animated{
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
-(void)viewWillAppear:(BOOL)animated{
    [forvardButton removeFromSuperview];
}
-(IBAction)makePhoto:(id)sender{ 
    DetailViewController *detail = [[DetailViewController alloc]init];
    detail.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:detail animated:YES];
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

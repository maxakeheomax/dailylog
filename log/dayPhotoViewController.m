//
//  dayPhotoViewController.m
//  dailyLog
//
//  Created by Maxim Boldyrev on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dayPhotoViewController.h"

@interface dayPhotoViewController ()

@end

@implementation dayPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIImage *gradientImage44 = [[UIImage imageNamed:@"top.png"]
                                    resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        // Set the background image for *all* UINavigationBars
        [[UINavigationBar appearance] setBackgroundImage:gradientImage44
                                           forBarMetrics:UIBarMetricsDefault];
    }
    return self;
}


- (void)viewDidLoad
{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@""];
    [navBar pushNavigationItem:navItem animated:NO];
    [self.view addSubview:navBar];

    
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
    [appInfoButton addTarget:self action:@selector(infoActn) forControlEvents:UIControlEventTouchUpInside];
    [appInfoButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
    [appInfoButton setImage:[UIImage imageNamed:@"cancelButton.png"] forState:UIControlStateNormal];
    [appInfoButton setImage:[UIImage imageNamed:@"cancelButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:appInfoButton];
    
    [buttonsL addObject:leftItem];
    
    // Add buttons to toolbar and toolbar to nav bar.
    [toolsL setItems:buttonsL animated:NO];
    
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsL];
    navItem.leftBarButtonItem = oneButton;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)infoActn{
    [self dismissModalViewControllerAnimated:YES];
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

//
//  QuestionFiveViewController.m
//  dailyLog
//
//  Created by Maxim Boldyrev on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionFiveViewController.h"
#import "QuestionSixViewController.h"
#import "AppDelegate.h"

@interface QuestionFiveViewController ()

@end

@implementation QuestionFiveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
-(IBAction)health:(id)sender{
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    appdelegate.questionFiveData  = @"Fast food";
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
    [forvardButton addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchUpInside];
    [forvardButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
    [forvardButton setImage:[UIImage imageNamed:@"nextButton.png"] forState:UIControlStateNormal];
    [forvardButton setImage:[UIImage imageNamed:@"nextButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:forvardButton];
    
    [buttonsR addObject:leftItem];
    
    // Add buttons to toolbar and toolbar to nav bar.
    [toolsR setItems:buttonsR animated:NO];
    
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsR];
    self.navigationItem.rightBarButtonItem = oneButton;
}
-(IBAction)fast:(id)sender{
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    appdelegate.questionFiveData  = @"Healthy food";
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
    [forvardButton addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchUpInside];
    [forvardButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
    [forvardButton setImage:[UIImage imageNamed:@"nextButton.png"] forState:UIControlStateNormal];
    [forvardButton setImage:[UIImage imageNamed:@"nextButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:forvardButton];
    
    [buttonsR addObject:leftItem];
    
    // Add buttons to toolbar and toolbar to nav bar.
    [toolsR setItems:buttonsR animated:NO];
    
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsR];
    self.navigationItem.rightBarButtonItem = oneButton;
}
-(IBAction)different:(id)sender{
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    appdelegate.questionFiveData  = @"Both";
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
    [forvardButton addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchUpInside];
    [forvardButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
    [forvardButton setImage:[UIImage imageNamed:@"nextButton.png"] forState:UIControlStateNormal];
    [forvardButton setImage:[UIImage imageNamed:@"nextButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:forvardButton];
    
    [buttonsR addObject:leftItem];
    
    // Add buttons to toolbar and toolbar to nav bar.
    [toolsR setItems:buttonsR animated:NO];
    
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsR];
    self.navigationItem.rightBarButtonItem = oneButton;
}
-(void)viewWillAppear:(BOOL)animated{
    [forvardButton removeFromSuperview];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // Set the background image for *all* UINavigationBars
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Question5NavBar.png"] forBarMetrics:UIBarMetricsDefault];
}
-(void)forward{
    QuestionSixViewController *sixth = [[QuestionSixViewController alloc]init];
    [self.navigationController pushViewController:sixth animated:YES];
    
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

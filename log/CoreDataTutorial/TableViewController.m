//
//  TableViewController.m
//  CoreDataTutorial
//
//  Created by Dan on 22/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"
#import "QuestionOneViewController.h"
#import "Phone.h"
#import "dayPhotoViewController.h"
#import "CustomCell.h"
#import "DetailCellViewController.h"
#import "PhotoCell.h"

@implementation TableViewController
@synthesize context, arr;
@synthesize pHone;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Phone" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setFetchBatchSize:20];
    
    [request setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"titleForSort" ascending:NO];
    
    NSArray *newArray = [NSArray arrayWithObject:sort];
    
    [request setSortDescriptors:newArray];
    
    NSError *error;
    
    NSMutableArray *results = [[context executeFetchRequest:request error:&error] mutableCopy];
    
    [self setArr:results];
    
    [self.tableView reloadData];
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"mainViewNavBar.png"] forBarMetrics:UIBarMetricsDefault];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //верхушка
    UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)]; // 44.01 shifts it up 1px for some reason
    tools.clearsContextBeforeDrawing = NO;
    tools.clipsToBounds = NO;
    tools.tintColor = [UIColor colorWithWhite:0.305f alpha:0.0f]; // closest I could get by eye to black, translucent style.
    
    tools.barStyle = -1; // clear background
    //right side of UINavigationBar
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:4];
    
    UIBarButtonItem *qw = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    qw.width = 17.0f;
    [buttons addObject:qw];
    
    
    infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoBtn setFrame:CGRectMake(0.0f, 0.0f, 44.0, 44.5)];
    
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [infoBtn addTarget:self action:@selector(infoActn) forControlEvents:UIControlEventTouchUpInside];
        [infoBtn setImage:[UIImage imageNamed:@"galleryButton.png"] forState:UIControlStateNormal];
        [infoBtn setImage:[UIImage imageNamed:@"galleryButtonActive.png"] forState:UIControlStateHighlighted];
//    }
    UIBarButtonItem *bi = [[UIBarButtonItem alloc]initWithCustomView:infoBtn];
    
    
    [buttons addObject:bi];
    
    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    bi.width = -10.0f;
    [buttons addObject:bi];
    
    addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn addTarget:self action:@selector(addActn) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setFrame:CGRectMake(0.0f, 0.0f, 44.0, 44.5)];
    [addBtn setImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"addButtonActive.png"] forState:UIControlStateHighlighted];
    bi = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
    [buttons addObject:bi];
    //left side of UINavigationBar
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
    [appInfoButton addTarget:self action:@selector(photoActn) forControlEvents:UIControlEventTouchUpInside];
    [appInfoButton setFrame:CGRectMake(0, 0, 44.0, 44.5)];
    [appInfoButton setImage:[UIImage imageNamed:@"infoButton.png"] forState:UIControlStateNormal];
    [appInfoButton setImage:[UIImage imageNamed:@"infoButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:appInfoButton];
    
    [buttonsL addObject:leftItem];
    
    // Add buttons to toolbar and toolbar to nav bar.
    [tools setItems:buttons animated:NO];
    [toolsL setItems:buttonsL animated:NO];
    
    UIBarButtonItem *twoButtons = [[UIBarButtonItem alloc] initWithCustomView:tools];
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc]initWithCustomView:toolsL];
    self.navigationItem.rightBarButtonItem = twoButtons;
    self.navigationItem.leftBarButtonItem = oneButton;
    //задний фон таблицы
    self.tableView.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1.0f];
    //ячейки
    self.tableView.separatorColor = [UIColor blackColor];
}
-(void)infoActn{
    self.tableView.rowHeight = 158;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
    UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)];
    tools.clearsContextBeforeDrawing = NO;
    tools.clipsToBounds = NO;
    tools.tintColor = [UIColor colorWithWhite:0.305f alpha:0.0f];
    
    tools.barStyle = -1; // clear background
    //right side of UINavigationBar
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:4];
    
    UIBarButtonItem *qw = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    qw.width = 17.0f;
    [buttons addObject:qw];
    
    infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoBtn addTarget:self action:@selector(standartActn) forControlEvents:UIControlEventTouchUpInside];
    [infoBtn setFrame:CGRectMake(0.0f, 0.0f, 44.0, 44.5)];
    [infoBtn setImage:[UIImage imageNamed:@"galleryButton.png"] forState:UIControlStateNormal];
    [infoBtn setImage:[UIImage imageNamed:@"galleryButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *bi = [[UIBarButtonItem alloc]initWithCustomView:infoBtn];
    
    
    [buttons addObject:bi];
    
    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    bi.width = -10.0f;
    [buttons addObject:bi];
    
    addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn addTarget:self action:@selector(addActn) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setFrame:CGRectMake(0.0f, 0.0f, 44.0, 44.5)];
    [addBtn setImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"addButtonActive.png"] forState:UIControlStateHighlighted];
    bi = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
    [buttons addObject:bi];
    [tools setItems:buttons animated:NO];
    UIBarButtonItem *twoButtons = [[UIBarButtonItem alloc] initWithCustomView:tools];
    self.navigationItem.rightBarButtonItem = twoButtons;
    
    [self.tableView reloadData];
}
-(void)standartActn{
    self.tableView.rowHeight = 44;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)];
    tools.clearsContextBeforeDrawing = NO;
    tools.clipsToBounds = NO;
    tools.tintColor = [UIColor colorWithWhite:0.305f alpha:0.0f];
    
    tools.barStyle = -1; // clear background
    //right side of UINavigationBar
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:4];
    
    UIBarButtonItem *qw = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    qw.width = 17.0f;
    [buttons addObject:qw];
    
    infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoBtn addTarget:self action:@selector(infoActn) forControlEvents:UIControlEventTouchUpInside];
    [infoBtn setFrame:CGRectMake(0.0f, 0.0f, 44.0, 44.5)];
    [infoBtn setImage:[UIImage imageNamed:@"galleryButton.png"] forState:UIControlStateNormal];
    [infoBtn setImage:[UIImage imageNamed:@"galleryButtonActive.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *bi = [[UIBarButtonItem alloc]initWithCustomView:infoBtn];
    
    
    [buttons addObject:bi];
    
    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    bi.width = -10.0f;
    [buttons addObject:bi];
    
    addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn addTarget:self action:@selector(addActn) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setFrame:CGRectMake(0.0f, 0.0f, 44.0, 44.5)];
    [addBtn setImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"addButtonActive.png"] forState:UIControlStateHighlighted];
    bi = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
    [buttons addObject:bi];
    [tools setItems:buttons animated:NO];
    UIBarButtonItem *twoButtons = [[UIBarButtonItem alloc] initWithCustomView:tools];
    self.navigationItem.rightBarButtonItem = twoButtons;
    
    [self.tableView reloadData];
}
-(void)photoActn{
    dayPhotoViewController *dPhotoes = [[dayPhotoViewController alloc]init];
    [self presentModalViewController:dPhotoes animated:YES];
}
-(void)addActn{
    UINavigationController *navController = self.navigationController;
    QuestionOneViewController *first = [[QuestionOneViewController alloc]init];
    [navController pushViewController:first animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arr count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tableView.rowHeight == 44){
        static NSString *CellIdentifier = @"CustomCell";
        
        CustomCell *cell = (CustomCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
            
            for (id currentObject in topLevelObjects){
                if ([currentObject isKindOfClass:[UITableViewCell class]]){
                    cell =  (CustomCell *) currentObject;
                    break;
                }
            }
        }
        
        Phone *phone = [arr objectAtIndex:indexPath.row];
        
        cell.TitleLbl.text = phone.weekDay;
        
        if ([phone.name isEqualToString:@"Best day ever!"]) {
            cell.MoodImage.image = [UIImage imageNamed:@"5.png"];
        } else if ([phone.name isEqualToString:@"Good"]) {
            cell.MoodImage.image = [UIImage imageNamed:@"4.png"];
        } else if ([phone.name isEqualToString:@"Not Bad"]) {
            cell.MoodImage.image = [UIImage imageNamed:@"3.png"];
        } else if ([phone.name isEqualToString:@"Could be worse"]) {
            cell.MoodImage.image = [UIImage imageNamed:@"2.png"];
        } else if ([phone.name isEqualToString:@"Awful!"]) {
            cell.MoodImage.image = [UIImage imageNamed:@"1.png"];
        }
        cell.dateTitleLbl.text = [phone title];
        
        return cell;
    }
    else if (self.tableView.rowHeight == 158) {
        static NSString *CellIdentifier = @"PhotoCell";
        
        PhotoCell *cell = (PhotoCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"PhotoCell" owner:self options:nil];
            
            for (id currentObject in topLevelObjects){
                if ([currentObject isKindOfClass:[UITableViewCell class]]){
                    cell =  (PhotoCell *) currentObject;
                    break;
                }
            }
        }
        
        Phone *phone = [arr objectAtIndex:indexPath.row];
        NSString *title = [NSString stringWithFormat:@"%@ %@",phone.weekDay, phone.title];
        
        cell.test.text = title;
        
        cell.faceImage.image = [[UIImage alloc]initWithData:phone.photoData];
        
        CALayer *ourLayer = [cell.faceImage layer]; // Будем округлять UIImageView
        ourLayer.cornerRadius = 60.0f;           // Задаем радиус для округления.
        ourLayer.masksToBounds = YES;
        
        return cell;
    }
    return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSManagedObject *eventToDelete = [arr objectAtIndex:indexPath.row];
        [context deleteObject:eventToDelete];
        
        // Update the array and table view.
        [arr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
        // Commit the change.
        NSError *error = nil;
        if (![context save:&error]) {
            // Handle the error.
        }
        [self.tableView reloadData];
        //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tableView.rowHeight == 44) {
        DetailCellViewController *detailCellViewController = [[DetailCellViewController alloc] initWithNibName:@"DetailCellViewController" bundle:[NSBundle mainBundle]];
        
        detailCellViewController.context = context;
        
        pHone = [arr objectAtIndex:indexPath.row];
        detailCellViewController.phone = pHone;
        [self.navigationController pushViewController:detailCellViewController animated:YES];
    } else {
    }
}

@end

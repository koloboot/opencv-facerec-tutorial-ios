//
//  TutorialsListViewController.m
//  OpenCV-FaceRec-Tutorial-iOS
//
//  Created by Fenix Lux on 08/02/16.
//  Copyright © 2016 Giovanni Murru. All rights reserved.
//

#import "TutorialsListViewController.h"
#import "EigenfacesViewController.h"
#import "FisherfacesViewController.h"
#import "LBPHistogramsViewController.h"

@interface TutorialsListViewController ()

@property (nonatomic, strong) NSArray *tutorialsTitles;

@end

#define kEigenfacesTutorial @"Eigenfaces Tutorial"
#define kFisherfacesTutorial @"Fisherfaces Tutorial"
#define kLBPHistogramsTutorial @"LBPHistograms Tutorial"

@implementation TutorialsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tutorialsTitles = @[kEigenfacesTutorial, kFisherfacesTutorial, kLBPHistogramsTutorial];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.title = @"";
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"Select a tutorial";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tutorialsTitles count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    cell.textLabel.text = [self.tutorialsTitles objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ( [[tableView cellForRowAtIndexPath:indexPath].textLabel.text isEqualToString:kEigenfacesTutorial] )
    {
        EigenfacesViewController *efvc = [EigenfacesViewController sharedEigenfacesViewController];
        [self.navigationController pushViewController:efvc animated:YES];
    }
    else if ([[tableView cellForRowAtIndexPath:indexPath].textLabel.text isEqualToString:kFisherfacesTutorial])
    {
        FisherfacesViewController *ffvc = [FisherfacesViewController sharedFisherfacesViewController];
        [self.navigationController pushViewController:ffvc animated:YES];
    }
    else if ([[tableView cellForRowAtIndexPath:indexPath].textLabel.text isEqualToString:kLBPHistogramsTutorial])
    {
        LBPHistogramsViewController *lbphvc = [LBPHistogramsViewController sharedLBPHistogramsViewController];
        [self.navigationController pushViewController:lbphvc animated:YES];
    }
}

@end

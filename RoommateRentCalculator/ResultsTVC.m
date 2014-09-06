//
//  ResultsTVC.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/13/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "ResultsTVC.h"

@interface ResultsTVC ()

@end

@implementation ResultsTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor backgroundGrayColor];
    [self.headerView setCommonSpaceSqFtLabelTextForCommonSpace:self.apartmentRentCalculator.commonRoomSqFootage];
    [self.headerView setPricePerSqFtLabelTextForPricePerSqFt:self.apartmentRentCalculator.calculatePricePerSqFt];
    [self configureAboutBarButtonItem];
    [self configureAboutView];
    [self configureResetBarButtonItem];
}

-(void)configureAboutView{
    self.aboutView = [[AboutView alloc] initWithFrame:CGRectMake(30, 30, 260, 420)];
    self.aboutView.alpha = 0.0;
    [self.view addSubview:self.aboutView];
}

-(void)configureAboutBarButtonItem{
    UIBarButtonItem *aboutBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(toggleDisplayingAboutDetails:)];
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Avenir-Medium" size:17.0], NSFontAttributeName, nil];
    [aboutBarButtonItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:aboutBarButtonItem];
}

-(void)configureResetBarButtonItem{
    UIBarButtonItem *resetBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(resetCalculator:)];
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Avenir-Medium" size:17.0], NSFontAttributeName, nil];
    [resetBarButtonItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    [self.navigationItem setLeftBarButtonItem:resetBarButtonItem];
}

-(void)resetCalculator:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)toggleDisplayingAboutDetails:(id) sender{
    if(!self.currentlyDisplayingAboutView){
        [self presentAboutView:YES];
    }
    else{
        [self presentAboutView:NO];
    }

}

-(void)presentAboutView:(BOOL) shouldPresent{
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         if(shouldPresent){
                             self.aboutView.alpha = 1.0;
                             self.currentlyDisplayingAboutView = YES;
                         } else{
                             self.aboutView.alpha = 0.0;
                             self.currentlyDisplayingAboutView = NO;
                         }
                     }
                     completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.apartmentRentCalculator.roommates count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RoommateResultsCell *cell = (RoommateResultsCell*)[tableView dequeueReusableCellWithIdentifier:@"Rent Cell" forIndexPath:indexPath];
    Roommate *thisRowsRoommate = self.apartmentRentCalculator.roommates[indexPath.row];
    NSMutableString *rentResult = [NSMutableString stringWithString:thisRowsRoommate.name];
    [rentResult appendString:@"'s monthly rent is $"];
    [rentResult appendString:[[NSNumber numberWithLong:thisRowsRoommate.rent] stringValue]];
    cell.textLabel.text = rentResult;
    return cell;
}

@end

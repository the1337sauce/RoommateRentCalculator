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

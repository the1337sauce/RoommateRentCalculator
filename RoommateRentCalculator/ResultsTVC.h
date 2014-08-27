//
//  ResultsTVC.h
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/13/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ApartmentRentCalculator.h"
#import "RoommateResultsCell.h"
#import "ResultsHeaderView.h"
#import "UIColor+RRCColors.h"
@interface ResultsTVC : UITableViewController

@property (weak, nonatomic) IBOutlet ResultsHeaderView *headerView;
@property (strong, nonatomic) ApartmentRentCalculator *apartmentRentCalculator;

@end

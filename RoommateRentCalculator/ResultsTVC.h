//
//  ResultsTVC.h
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/13/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ApartmentRentCalculator.h"

@interface ResultsTVC : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *commonSqFtLabel;
@property (weak, nonatomic) IBOutlet UILabel *pricePerSqFtLabel;

@property (strong, nonatomic) ApartmentRentCalculator *apartmentRentCalculator;

@end

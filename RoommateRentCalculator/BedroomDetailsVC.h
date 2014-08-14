//
//  BedroomDetailsVC.h
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RoommateDetailsView.h"
#import "BedroomDetailsScrollView.h"
#import "RoommateDetailsView.h"
#import "BedroomDetailsView.h"

#import "Roommate.h"
#import "ApartmentRentCalculator.h"

#import "ResultsTVC.h"

@interface BedroomDetailsVC : UIViewController <UITextFieldDelegate>

@property (nonatomic) NSUInteger numberOfRoommates;
@property (nonatomic) NSUInteger totalApartmentSqFootage;
@property (nonatomic) NSUInteger totalApartmentRent;
@property (nonatomic) BedroomDetailsScrollView *bedroomDetailsScrollView;

@property (strong, nonatomic) IBOutlet BedroomDetailsView *view;

- (IBAction)finishButton:(id)sender;

@end

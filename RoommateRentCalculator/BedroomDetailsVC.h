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

#import "Roommate.h"
#import "ApartmentRentCalculator.h"

@interface BedroomDetailsVC : UIViewController <UITextFieldDelegate>

@property (nonatomic) NSUInteger numberOfRoommates;
@property (nonatomic) NSUInteger totalApartmentSqFootage;
@property (nonatomic) BedroomDetailsScrollView *bedroomDetailsScrollView;


- (IBAction)finishButton:(id)sender;

@end

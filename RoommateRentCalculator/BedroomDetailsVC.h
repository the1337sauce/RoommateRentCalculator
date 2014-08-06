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

@interface BedroomDetailsVC : UIViewController

@property (nonatomic) NSUInteger numberOfRoommates;

@property (nonatomic) BedroomDetailsScrollView *bedroomDetailsScrollView;

@end

//
//  BedroomDetailsScrollView.h
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/15/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RoommateDetailsView.h"

#import "Constants.h"


@interface BedroomDetailsScrollView : UIScrollView <UITextFieldDelegate>

@property (nonatomic) NSUInteger numberOfRoommates;
@property (nonatomic) NSArray *roommateDetailsViews;

-(instancetype) initWithNumberOfRoommates:(NSUInteger) numberOfRoommates;

@end

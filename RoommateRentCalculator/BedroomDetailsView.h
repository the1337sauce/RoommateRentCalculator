//
//  BedroomDetailsView.h
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/13/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIColor+RRCColors.h"

@interface BedroomDetailsView : UIView

@property (strong, nonatomic) UIButton* leftXOutButton;

-(void) disableAndHideLeftXButton;
-(void) enableAndShowLeftXButton;

@end

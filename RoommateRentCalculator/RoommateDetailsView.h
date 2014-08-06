//
//  RoommateDetailsView.h
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Constants.h"

#import "UIColor+RRCColors.h"
#import "UIFont+RRCFonts.h"

@interface RoommateDetailsView : UIView

@property (weak, nonatomic) IBOutlet UITextField *roommatesNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *roommatesRoomSqFtTextField;

//-(instancetype) init;
-(instancetype) initWithDefaultFrameAndYMultiplier:(NSUInteger)multiplier;

@end

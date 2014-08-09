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


@interface BedroomDetailsScrollView : UIScrollView

@property (nonatomic) NSUInteger numberOfRoommates;
@property (strong, nonatomic) id<UITextFieldDelegate> textFieldDelegate;
@property (strong, nonatomic) NSArray *roommateDetailsViews;

@property (strong, nonatomic) UIButton* leftXOutButton;
@property (strong, nonatomic) UIButton* rightXOutButton;

-(instancetype) initWithNumberOfRoommates:(NSUInteger) numberOfRoommates andTextFieldDelegate:(id<UITextFieldDelegate>) textFieldDelegate;

-(void)enableAndShowLeftXButton;
-(void)resignAllTextFieldsFirstResponder;

@end

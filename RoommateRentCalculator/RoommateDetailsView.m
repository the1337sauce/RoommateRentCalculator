//
//  RoommateDetailsView.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "RoommateDetailsView.h"

@implementation RoommateDetailsView

-(instancetype) initWithDefaultFrameAndYMultiplier:(NSUInteger)multiplier andTextFieldDelegate:(id<UITextFieldDelegate>)textFieldDelegate{
    self = [super init];
    if(self){
        self.frame = [self offsetDefaultFrameByMultiplier:multiplier];
        self.textFieldDelegate = textFieldDelegate;
        [self buildAndAddSubViews];
        [self setBackgroundColor:[UIColor backgroundBlueColor]];
    }
    return self;
}

-(void) buildAndAddSubViews{
    [self configureRoommatesNameTextField];
    [self configureRoommatesRoomSqFtTextField];
    [self addSubview:[self roommatesNameLabel]];
    [self addSubview:self.roommatesNameTextField];
    [self addSubview:[self theirRoomSizeLabel]];
    [self addSubview:self.roommatesRoomSqFtTextField];
    [self addSubview:[self sqFtLabel]];
}

-(UILabel*) roommatesNameLabel{
    UILabel *roommatesNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 240, 30)];
    [roommatesNameLabel setBackgroundColor:[UIColor customDarkGreyColor]];
    [roommatesNameLabel setFont:[UIFont whiteAvenir]];
    [roommatesNameLabel setTextColor:[UIColor whiteColor]];
    [roommatesNameLabel setText:@"Roommates Name"];
    [roommatesNameLabel setTextAlignment:NSTextAlignmentCenter];
    return roommatesNameLabel;
}

-(void) configureRoommatesNameTextField{
    self.roommatesNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 45, 240, 30)];
    [self.roommatesNameTextField setBackgroundColor:[UIColor whiteColor]];
    [self.roommatesNameTextField setBorderStyle:UITextBorderStyleNone];
    self.roommatesNameTextField.delegate = self.textFieldDelegate;
}

-(UILabel*) theirRoomSizeLabel{
    UILabel *theirRoomSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 75, 240, 30)];
    [theirRoomSizeLabel setBackgroundColor:[UIColor customDarkGreyColor]];
    [theirRoomSizeLabel setFont:[UIFont whiteAvenir]];
    [theirRoomSizeLabel setTextColor:[UIColor whiteColor]];
    [theirRoomSizeLabel setText:@"Their Room Size"];
    [theirRoomSizeLabel setTextAlignment:NSTextAlignmentCenter];
    return theirRoomSizeLabel;
}

-(void) configureRoommatesRoomSqFtTextField{
    self.roommatesRoomSqFtTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 105, 194, 30)];
    [self.roommatesRoomSqFtTextField setBackgroundColor:[UIColor whiteColor]];
    [self.roommatesRoomSqFtTextField setBorderStyle:UITextBorderStyleNone];
    [self.roommatesRoomSqFtTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    self.roommatesRoomSqFtTextField.delegate = self.textFieldDelegate;
}

-(UILabel*) sqFtLabel{
    UILabel *sqFtLabel = [[UILabel alloc] initWithFrame:CGRectMake(234, 105, 46, 30)];
    [sqFtLabel setBackgroundColor:[UIColor customDarkGreyColor]];
    [sqFtLabel setFont:[UIFont whiteAvenir]];
    [sqFtLabel setTextColor:[UIColor whiteColor]];
    [sqFtLabel setText:@"Sq/Ft"];
    [sqFtLabel setTextAlignment:NSTextAlignmentCenter];
    return sqFtLabel;
}

-(CGRect) defaultFrame{
    return CGRectMake(RoommateDetailsViewX, RoommateDetailsViewY, RoommateDetailsViewWidth, RoommateDetailsViewHeight);
}

-(CGRect) offsetDefaultFrameByMultiplier:(NSUInteger) multiplier{
    CGFloat newY = RoommateDetailsViewY+RoommateDetailsViewHeight*multiplier;
    return CGRectMake(RoommateDetailsViewX, newY, RoommateDetailsViewWidth, RoommateDetailsViewHeight);
}

-(BOOL) isPopulated{
    return [self.roommatesNameTextField.text length] > 0 && [self.roommatesRoomSqFtTextField.text length] > 0;
}

@end


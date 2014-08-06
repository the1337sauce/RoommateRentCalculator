//
//  RoommateDetailsView.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "RoommateDetailsView.h"

@implementation RoommateDetailsView



-(instancetype) initWithDefaultFrameAndYMultiplier:(NSUInteger)multiplier{
    self = [super init];
    if(self){
        self.frame = [self offsetDefaultFrameByMultiplier:multiplier];
        [self buildAndAddSubViews];
        [self setBackgroundColor:[UIColor backgroundBlueColor]];
    }
    return self;
}

-(void) buildAndAddSubViews{
    [self addSubview:[self roommatesNameLabel]];
    [self addSubview:[self roommatesNameTextField]];
    [self addSubview:[self theirRoomSizeLabel]];
    [self addSubview:[self roommatesRoomSizeTextField]];
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

-(UITextField*) roommatesNameTextField{
    UITextField *roommatesTextFieldLabel = [[UITextField alloc] initWithFrame:CGRectMake(40, 45, 240, 30)];
    [roommatesTextFieldLabel setBackgroundColor:[UIColor whiteColor]];
    [roommatesTextFieldLabel setBorderStyle:UITextBorderStyleNone];
    self.roommatesNameTextField = roommatesTextFieldLabel;
    return roommatesTextFieldLabel;
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

-(UITextField*) roommatesRoomSizeTextField{
    UITextField *roommatesRoomSizeTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 105, 194, 30)];
    [roommatesRoomSizeTextField setBackgroundColor:[UIColor whiteColor]];
    [roommatesRoomSizeTextField setBorderStyle:UITextBorderStyleNone];
    self.roommatesRoomSqFtTextField = roommatesRoomSizeTextField;
    return roommatesRoomSizeTextField;
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

-(void)drawRect:(CGRect)rect{
    
}

@end


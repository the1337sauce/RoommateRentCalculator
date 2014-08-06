//
//  BedroomDetailsScrollView.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/15/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "BedroomDetailsScrollView.h"

@implementation BedroomDetailsScrollView

-(instancetype) initWithNumberOfRoommates:(NSUInteger) numberOfRoommates{
    self = [super initWithFrame:CGRectMake(0, 0, [self currentScreenWidth], [self currentScreenHeight])];
    if(self){
        self.numberOfRoommates = numberOfRoommates;
        self.scrollEnabled = YES;
        self.contentSize = CGSizeMake([self currentScreenWidth], numberOfRoommates * RoommateDetailsViewHeight+100);
        [self configureRoommateDetailsViews];
    }
    return self;
}

-(void)configureRoommateDetailsViews{
    NSUInteger roommateViewCounter = 0;
    NSMutableArray *tempRoommateDetailsViews = [[NSMutableArray alloc] init];
    while(roommateViewCounter < self.numberOfRoommates){
        RoommateDetailsView *roommateDetailsView = [self configureRoommateDetailsViewForYMultiple:roommateViewCounter];
        [tempRoommateDetailsViews addObject:roommateDetailsView];
        [self addSubview:roommateDetailsView];
        roommateViewCounter++;
    }
    self.roommateDetailsViews = tempRoommateDetailsViews;
}

-(RoommateDetailsView*) configureRoommateDetailsViewForYMultiple:(NSUInteger) yMultiple{
    RoommateDetailsView *roommateDetailsView = [[RoommateDetailsView alloc] initWithDefaultFrameAndYMultiplier:yMultiple];
    roommateDetailsView.roommatesNameTextField.delegate = self;
    roommateDetailsView.roommatesRoomSqFtTextField.delegate = self;
    return roommateDetailsView;
}

-(CGFloat) currentScreenWidth{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.width;
}

-(CGFloat) currentScreenHeight{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.height;
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
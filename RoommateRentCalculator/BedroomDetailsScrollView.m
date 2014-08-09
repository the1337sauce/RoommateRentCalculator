//
//  BedroomDetailsScrollView.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/15/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "BedroomDetailsScrollView.h"

@implementation BedroomDetailsScrollView

-(instancetype) initWithNumberOfRoommates:(NSUInteger) numberOfRoommates andTextFieldDelegate:(id<UITextFieldDelegate>)textFieldDelegate{
    self = [super initWithFrame:CGRectMake(0, 0, [self currentScreenWidth], [self currentScreenHeight])];
    if(self){
        self.numberOfRoommates = numberOfRoommates;
        self.textFieldDelegate = textFieldDelegate;
        self.scrollEnabled = YES;
        self.contentSize = CGSizeMake([self currentScreenWidth], numberOfRoommates * RoommateDetailsViewHeight+100);
        [self configureRoommateDetailsViews];
        [self configureLeftXOutButton];
    }
    return self;
}

-(void)configureRoommateDetailsViews{
    NSUInteger roommateViewCounter = 0;
    NSMutableArray *tempRoommateDetailsViews = [[NSMutableArray alloc] init];
    while(roommateViewCounter < self.numberOfRoommates){
        RoommateDetailsView *roommateDetailsView = [self configureRoommateDetailsViewForYMultiple:roommateViewCounter];
        [self addSubview:roommateDetailsView];
        [tempRoommateDetailsViews addObject:roommateDetailsView];
        roommateViewCounter++;
    }
    self.roommateDetailsViews = tempRoommateDetailsViews;
}

-(RoommateDetailsView*) configureRoommateDetailsViewForYMultiple:(NSUInteger) yMultiple{
    RoommateDetailsView *roommateDetailsView = [[RoommateDetailsView alloc] initWithDefaultFrameAndYMultiplier:yMultiple andTextFieldDelegate:self.textFieldDelegate];
    return roommateDetailsView;
}

-(void)configureLeftXOutButton{
    CGRect leftXOutButtonFrame = CGRectMake(0, 313, 40, 39);
    self.leftXOutButton = [[UIButton alloc] initWithFrame:leftXOutButtonFrame];
    self.leftXOutButton.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    [self.leftXOutButton setTitle:@"X" forState:UIControlStateNormal];
    [self.leftXOutButton.titleLabel setFont:[UIFont fontWithName:@"Avenir Heavy" size:17.0]];
    [self.leftXOutButton.titleLabel setTextColor:[UIColor whiteColor]];
    [self disableAndHideLeftXButton];
    [self.leftXOutButton addTarget:self action:@selector(resignAllTextFieldsFirstResponder) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.leftXOutButton];
}

-(void) disableAndHideLeftXButton{
    self.leftXOutButton.alpha = 0.0;
    self.leftXOutButton.enabled = NO;
}

-(void) enableAndShowLeftXButton{
    self.leftXOutButton.enabled = YES;
    [self presentButtonWithAnimations:self.leftXOutButton];
}

-(void) presentButtonWithAnimations:(UIButton*) button{
    [UIView animateWithDuration:0.4
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         button.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
}

-(void)resignAllTextFieldsFirstResponder{
    for(RoommateDetailsView* roommateDetailsView in self.roommateDetailsViews){
        [roommateDetailsView.roommatesNameTextField resignFirstResponder];
        [roommateDetailsView.roommatesRoomSqFtTextField resignFirstResponder];
    }
    [self disableAndHideLeftXButton];
}

-(CGFloat) currentScreenWidth{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.width;
}

-(CGFloat) currentScreenHeight{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.height;
}

@end
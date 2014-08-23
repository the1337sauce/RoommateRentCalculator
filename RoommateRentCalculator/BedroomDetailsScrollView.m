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

-(void) offsetForKeyboardOpenedWithKeyboardSize:(CGSize) keyboardSize{
    CGFloat keyboardHeight = keyboardSize.height;
    [self offsetFrameForKeyboardHeight:keyboardHeight];
    
}

-(void) offsetForKeyboardClosedWithKeyboardSize:(CGSize) keyboardSize{
    CGFloat keyboardHeight = keyboardSize.height;
    [self offsetFrameForKeyboardHeight:-keyboardHeight];
}

-(void) offsetFrameForKeyboardHeight:(CGFloat) keyboardHeight{
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height-keyboardHeight);
                     }
                     completion:nil];
}

-(RoommateDetailsView*) configureRoommateDetailsViewForYMultiple:(NSUInteger) yMultiple{
    RoommateDetailsView *roommateDetailsView = [[RoommateDetailsView alloc] initWithDefaultFrameAndYMultiplier:yMultiple andTextFieldDelegate:self.textFieldDelegate];
    return roommateDetailsView;
}

-(void)resignAllTextFieldsFirstResponder{
    for(RoommateDetailsView* roommateDetailsView in self.roommateDetailsViews){
        [roommateDetailsView.roommatesNameTextField resignFirstResponder];
        [roommateDetailsView.roommatesRoomSqFtTextField resignFirstResponder];
    }
}

-(CGFloat) currentScreenWidth{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.width;
}

-(CGFloat) currentScreenHeight{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.height;
}

-(BOOL) isFullyPopulated{
    BOOL isPopulated = YES;
    for(RoommateDetailsView* roommateDetailsView in self.roommateDetailsViews){
        if (!roommateDetailsView.isFullyPopulated) {
            isPopulated = NO;
            break;
        }
    }
    return isPopulated;
}

@end
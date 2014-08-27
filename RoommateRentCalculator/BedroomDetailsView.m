//
//  BedroomDetailsView.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/13/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "BedroomDetailsView.h"

@implementation BedroomDetailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureLeftXOutButton];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configureLeftXOutButton];
    }
    return self;
}

-(void)configureLeftXOutButton{
    CGRect leftXOutButtonFrame = CGRectMake(0, [self calculateLeftXOutButtonYOrigin], 40, 39);
    self.leftXOutButton = [[UIButton alloc] initWithFrame:leftXOutButtonFrame];
    self.leftXOutButton.backgroundColor = [UIColor fadedRedColor];
    [self.leftXOutButton setTitle:@"X" forState:UIControlStateNormal];
    [self.leftXOutButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:17.0]];
    [self.leftXOutButton.titleLabel setTextColor:[UIColor lightTextColor]];
    [self disableAndHideLeftXButton];
    [self addSubview:self.leftXOutButton];
}

-(CGFloat) calculateLeftXOutButtonYOrigin{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.height == 568 ? 313 : 225;
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

@end

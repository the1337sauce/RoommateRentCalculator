//
//  AboutView.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 9/5/14.
//  Copyright (c) 2014 ; Lab. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "AboutView.h"

@implementation AboutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeView];

    }
    return self;
}

-(void)initializeView{
    [self setBackgroundColor:[UIColor lightTextColor]];
    [self configureDescriptionImage];
    [self configureViewShadow];
}

-(void)configureDescriptionImage{
    UIImageView *descriptionView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 240, 400)];
    [descriptionView setImage:[UIImage imageNamed:@"AboutDetails.png"]];
    [self addSubview:descriptionView];
}

-(void)configureViewShadow{
    CALayer *layer = self.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.80f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}

@end

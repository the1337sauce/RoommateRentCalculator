//
//  ResultsHeaderView.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/19/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "ResultsHeaderView.h"

@implementation ResultsHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setCommonSpaceSqFtLabelTextForCommonSpace:(NSUInteger) commonRoomSqFt{
    self.commonSpaceSqFtLabel.text = [NSString stringWithFormat:@"%@ %@ %@", @"Your apartment has", [[NSNumber numberWithUnsignedInteger:commonRoomSqFt] stringValue], @"sq/ft of common space"];
}

-(void) setPricePerSqFtLabelTextForPricePerSqFt:(CGFloat) pricePerSqFt{
    self.pricePerSqFtLabel.text = [NSString stringWithFormat:@"%@ %@ %@", @"You're paying $", [NSString stringWithFormat:@"%.2f", pricePerSqFt], @"per sq/ft"];
}

@end

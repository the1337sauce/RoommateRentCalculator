//
//  ResultsHeaderView.h
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/19/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsHeaderView : UIView

@property (weak, nonatomic) IBOutlet UILabel *commonSpaceSqFtLabel;
@property (weak, nonatomic) IBOutlet UILabel *pricePerSqFtLabel;

-(void) setCommonSpaceSqFtLabelTextForCommonSpace:(NSUInteger) commonRoomSqFt;
-(void) setPricePerSqFtLabelTextForPricePerSqFt:(CGFloat) pricePerSqFt;

@end

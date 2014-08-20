//
//  RoommateRentCalculator.h
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/6/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Roommate.h"

@interface ApartmentRentCalculator : NSObject

@property (strong, nonatomic) NSArray* roommates;
@property (nonatomic) NSUInteger totalSqFt;
@property (nonatomic) NSUInteger totalRent;
@property (nonatomic) CGFloat eachRoommatesShareOfCommonSpaceInSqFt;

-(instancetype) initWithRoommates:(NSArray*) roommates totalApartmentSqFootage:(NSUInteger) totalSqFootage andTotalRent:(NSUInteger) totalRent;

-(NSUInteger) numberOfRoommates;
-(NSUInteger) commonRoomSqFootage;
-(CGFloat) calculatePricePerSqFt;
-(BOOL) isValidBedroomSquareFootage;

@end

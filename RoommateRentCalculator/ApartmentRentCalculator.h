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
@property (strong, nonatomic) NSNumber* eachRoommatesShareOfCommonSpaceInSqFt;

-(instancetype) initWithRoommates:(NSArray*) roommates andTotalApartmentSqFootage:(NSUInteger) totalSqFootage withTotalRent:(NSUInteger) totalRent;
-(NSUInteger) commonRoomSqFootage;
-(NSArray*) calculateEachRoommatesRent;

@end

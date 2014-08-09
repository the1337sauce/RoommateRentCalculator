//
//  RoommateRentCalculator.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/6/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "ApartmentRentCalculator.h"

@implementation ApartmentRentCalculator

-(instancetype) initWithRoommates:(NSArray*) roommates totalApartmentSqFootage:(NSUInteger) totalSqFootage andTotalRent:(NSUInteger) totalRent{
    self = [super init];
    if (!self) return nil;
    [self configureRoommates:roommates totalSqFootage:totalSqFootage andTotalRent:totalRent];
    [self initialCalculations];
    return self;
}

-(NSUInteger) numberOfRoommates{
    return [self.roommates count];
}

-(void) initialCalculations{
    [self calculateEachRoommatesShareOfCommonSpaceInSqFt];
    [self calculateEachRoommatesRent];
}

-(void)calculateEachRoommatesShareOfCommonSpaceInSqFt{
    NSUInteger commonRoomSqFootage = [self commonRoomSqFootage];
    self.eachRoommatesShareOfCommonSpaceInSqFt = [[NSNumber numberWithUnsignedInteger:commonRoomSqFootage] doubleValue] / [[NSNumber numberWithUnsignedInteger:[self numberOfRoommates]] doubleValue];
}

-(void) configureRoommates:(NSArray*) roommates totalSqFootage:(NSUInteger) totalSqFootage andTotalRent:(NSUInteger) totalRent{
    self.roommates = roommates;
    self.totalSqFt = totalSqFootage;
    self.totalRent = totalRent;
}

-(NSUInteger) commonRoomSqFootage{
    NSUInteger totalBedroomSquareFootage = 0;
    for(Roommate* roommate in self.roommates){
        totalBedroomSquareFootage += roommate.bedroomSizeInSqFt;
    }
    return self.totalSqFt - totalBedroomSquareFootage;
}

-(void) calculateEachRoommatesRent{
    for(Roommate *roommate in self.roommates){
        CGFloat ownershipPerentage = ([self doubleValueFromUnsignedInteger:roommate.bedroomSizeInSqFt] + self.eachRoommatesShareOfCommonSpaceInSqFt) / [self doubleValueFromUnsignedInteger:self.totalSqFt];
        roommate.rent = lround([self doubleValueFromUnsignedInteger:self.totalRent] * ownershipPerentage);
    }
}

-(double) doubleValueFromUnsignedInteger:(NSUInteger) unsignedInteger{
    return [[NSNumber numberWithUnsignedInteger:unsignedInteger] doubleValue];
}

@end

//
//  RoommateRentCalculator.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/6/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "ApartmentRentCalculator.h"

@implementation ApartmentRentCalculator

-(instancetype) initWithRoommates:(NSArray*) roommates andTotalApartmentSqFootage:(NSUInteger) totalSqFootage withTotalRent:(NSUInteger) totalRent{
    self = [super init];
    if (!self) return nil;
    [self configureRoommates:roommates totalSqFootage:totalSqFootage andTotalRent:totalSqFootage];
    //self.eachRoommatesShareOfCommonSpaceInSqFt = tot
    return self;
}

-(void)calculateEachRoommatesShareOfCommonSpaceInSqFt{
    NSUInteger commonRoomSqFootage = [self commonRoomSqFootage];
    //
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

-(NSArray*) calculateEachRoommatesRent{
    for(Roommate *roommate in self.roommates){
        //NSNumber *ownershipPercentage = roommate.bedroomSizeInSqFt + self.commonRoomSqFootage / self.totalSqFt;
    }
    return [NSArray array];
}

@end

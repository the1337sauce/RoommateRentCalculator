//
//  Apartment.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/6/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "Apartment.h"

@implementation Apartment

-(instancetype) initWithRoommates:(NSArray*) roommates totalRent:(NSUInteger) totalRent andSquareFootage:(NSUInteger) squareFootage{
    self = [super init];
    if(!self) return nil;
    self.roommates = roommates;
    self.rent = totalRent;
    self.totalSqFt = squareFootage;
    self.rentCalculator = [[ApartmentRentCalculator alloc] initWithRoommates:roommates totalApartmentSqFootage:squareFootage andTotalRent:totalRent];
    self.commonRoomSqFt = [self.rentCalculator commonRoomSqFootage];
    return self;
}

-(NSUInteger) commonRoomSqFootage{
    return [self.rentCalculator commonRoomSqFootage];
}

-(NSUInteger) numberOfRoommates{
    return [self.roommates count];
}

@end

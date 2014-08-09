//
//  Apartment.h
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/6/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApartmentRentCalculator.h"

@interface Apartment : NSObject


@property (strong, nonatomic) NSArray* roommates;
@property (strong, nonatomic) ApartmentRentCalculator* rentCalculator;
@property (nonatomic) NSUInteger totalSqFt;
@property (nonatomic) NSUInteger rent;
@property (nonatomic) NSUInteger commonRoomSqFt;

-(instancetype) initWithRoommates:(NSArray*) roommates totalRent:(NSUInteger) totalRent andSquareFootage:(NSUInteger) squareFootage;
-(NSUInteger) numberOfRoommates;
-(void) calculateEachRoommatesRent;

@end

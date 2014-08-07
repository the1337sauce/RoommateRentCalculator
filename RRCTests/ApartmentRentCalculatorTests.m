//
//  RoommateRentCalculatorTests.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/6/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

#import "Apartment.h"
#import "Roommate.h"

SpecBegin(ApartmentRentCalculatorTests)

    __block Apartment* apartment;

    beforeAll(^{
        Roommate* roommate = [[Roommate alloc] initWithName:@"Nate" andBedroomSizeInSqFt:400];
        Roommate* jabrone = [[Roommate alloc] initWithName:@"Jabrone" andBedroomSizeInSqFt:300];
        apartment = [[Apartment alloc] initWithRoommates:[NSArray arrayWithObjects:roommate, jabrone, nil] totalRent:2000 andSquareFootage:1000];
        [apartment calculateEachRoommatesRent];
    });

    describe(@"RentCalculator", ^{
        
        it(@"properly constructs itself with the number of given roommates", ^{
            expect(apartment.numberOfRoommates).to.equal(2);
        });
        
        it(@"properly caches the first roommates name", ^{
            Roommate *roommate = apartment.roommates[0];
            expect(roommate.name).to.equal(@"Nate");
        });
        
        it(@"properly caches the second roommates name", ^{
            Roommate *roommate = apartment.roommates[1];
            expect(roommate.name).to.equal(@"Jabrone");
        });
        
        it(@"properly caches the first roommates room sq footage", ^{
            Roommate *roommate = apartment.roommates[0];
            expect(roommate.bedroomSizeInSqFt).to.equal(400);
        });
        
        it(@"properly caches the second roommates room sq footage", ^{
            Roommate *roommate = apartment.roommates[1];
            expect(roommate.bedroomSizeInSqFt).to.equal(300);
        });
        
        it(@"can properly calculate the common room square footage", ^{
            NSUInteger commonRoomSqFootage = [apartment commonRoomSqFootage];
            expect(commonRoomSqFootage).to.equal(300);
        });
        
        it(@"can properly calculate each roommates common room square footage", ^{
            NSUInteger eachRoommatesShareOfCommonSpaceInSqFt = [apartment eachRoommatesShareOfCommonSpaceInSqFt];
            expect(eachRoommatesShareOfCommonSpaceInSqFt).to.equal(150);
        });
        
        it(@"can properly calculate how much the first roommate owes each month", ^{
            Roommate* roommate = [apartment roommates][0];
            expect(roommate.rent).to.equal(1100);
        });
        
        it(@"can properly calculate how much the second roommate owes each month", ^{
            Roommate* roommate = [apartment roommates][1];
            expect(roommate.rent).to.equal(900);
        });
        
    });

SpecEnd
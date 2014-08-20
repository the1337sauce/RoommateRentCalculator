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

#import "ApartmentRentCalculator.h"
#import "Roommate.h"

SpecBegin(ApartmentRentCalculatorTests)

    __block ApartmentRentCalculator* twoRoommateRentCalculator;
    __block ApartmentRentCalculator* threeRoommateRentCalculator;

    beforeAll(^{
        Roommate* roommate = [[Roommate alloc] initWithName:@"Nate" andBedroomSizeInSqFt:400];
        Roommate* jabrone = [[Roommate alloc] initWithName:@"Jabrone" andBedroomSizeInSqFt:300];
        twoRoommateRentCalculator = [[ApartmentRentCalculator alloc] initWithRoommates:[NSArray arrayWithObjects:roommate, jabrone, nil] totalApartmentSqFootage:1000 andTotalRent:2000];
        
        Roommate* one = [[Roommate alloc] initWithName:@"Josie" andBedroomSizeInSqFt:180];
        Roommate* two = [[Roommate alloc] initWithName:@"Mary" andBedroomSizeInSqFt:120];
        Roommate* three = [[Roommate alloc] initWithName:@"Katie" andBedroomSizeInSqFt:135];
        threeRoommateRentCalculator = [[ApartmentRentCalculator alloc] initWithRoommates:[NSArray arrayWithObjects:one, two, three, nil] totalApartmentSqFootage:948 andTotalRent:4450];
    });

    describe(@"RentCalculator", ^{
        
        it(@"properly constructs itself with the number of given roommates", ^{
            expect([twoRoommateRentCalculator numberOfRoommates]).to.equal(2);
        });
        
        it(@"properly caches the first roommates name", ^{
            Roommate *roommate = twoRoommateRentCalculator.roommates[0];
            expect(roommate.name).to.equal(@"Nate");
        });
        
        it(@"properly caches the second roommates name", ^{
            Roommate *roommate = twoRoommateRentCalculator.roommates[1];
            expect(roommate.name).to.equal(@"Jabrone");
        });
        
        it(@"properly caches the first roommates room sq footage", ^{
            Roommate *roommate = twoRoommateRentCalculator.roommates[0];
            expect(roommate.bedroomSizeInSqFt).to.equal(400);
        });
        
        it(@"properly caches the second roommates room sq footage", ^{
            Roommate *roommate = twoRoommateRentCalculator.roommates[1];
            expect(roommate.bedroomSizeInSqFt).to.equal(300);
        });
        
        it(@"can properly calculate the common room square footage", ^{
            NSUInteger commonRoomSqFootage = [twoRoommateRentCalculator commonRoomSqFootage];
            expect(commonRoomSqFootage).to.equal(300);
        });
        
        it(@"can properly calculate each roommates common room square footage", ^{
            CGFloat eachRoommatesShareOfCommonSpaceInSqFt = twoRoommateRentCalculator.eachRoommatesShareOfCommonSpaceInSqFt;
            expect(eachRoommatesShareOfCommonSpaceInSqFt).to.equal(150);
        });
        
        it(@"can properly calculate how much the first roommate owes each month", ^{
            Roommate* roommate = [twoRoommateRentCalculator roommates][0];
            expect(roommate.rent).to.equal(1100);
        });
        
        it(@"can properly calculate how much the second roommate owes each month", ^{
            Roommate* roommate = [twoRoommateRentCalculator roommates][1];
            expect(roommate.rent).to.equal(900);
        });
        
        it(@"can properly calculate price per sq/ft", ^{
            expect(twoRoommateRentCalculator.calculatePricePerSqFt).to.equal(2.0);
        });
        
    });

    describe(@"RentCalculator with three roommates and decimals", ^{
        it(@"properly calculates the common room square footage", ^{
            expect([threeRoommateRentCalculator commonRoomSqFootage]).to.equal(513);
        });
        it(@"properly calculates josies rent", ^{
            Roommate* josie = threeRoommateRentCalculator.roommates[0];
            expect(josie.name).to.equal(@"Josie");
            expect(josie.rent).to.equal(1648);
        });
        it(@"properly calculates marys rent", ^{
            Roommate* mary = threeRoommateRentCalculator.roommates[1];
            expect(mary.name).to.equal(@"Mary");
            expect(mary.rent).to.equal(1366);
        });
        it(@"properly calculates katies rent", ^{
            Roommate* katie = threeRoommateRentCalculator.roommates[2];
            expect(katie.name).to.equal(@"Katie");
            expect(katie.rent).to.equal(1436);
        });
        
    });

SpecEnd
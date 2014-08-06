//
//  BedroomLabelCounterTests.m
//  RRCTests
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <XCTest/XCTest.h>


#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

#import "BedroomLabelCounter.h"
#import "Constants.h"

SpecBegin(BedroomLabelCounterTests)

    __block BedroomLabelCounter *bedroomLabelCounter;

    beforeAll(^{
        bedroomLabelCounter = [[BedroomLabelCounter alloc] init];
    });

    beforeEach(^{
        [bedroomLabelCounter resetToDefaultBedroomCount];
    });

    describe(@"BedroomLabelCounter", ^{
        
        it(@"bedroomLabelCounter initializes to two bedrooms", ^{
            BedroomLabelCounter *localBedroomLabelCounter = [[BedroomLabelCounter alloc] init];
            NSUInteger bedroomCount = [localBedroomLabelCounter currentBedroomCount];
            expect(bedroomCount).to.equal(2);
        });
        
        it(@"bedroom count resets to proper default", ^{
            NSUInteger bedroomCount = [bedroomLabelCounter currentBedroomCount];
            expect(bedroomCount).to.equal(DefaultNumberOfBedrooms);
        });
        
        it(@"can increment bedroom count", ^{
            [bedroomLabelCounter incrementBedroomCount];
            NSUInteger bedroomCount = [bedroomLabelCounter currentBedroomCount];
            expect(bedroomCount).to.equal(3);
        });
        
        it(@"can decrement bedroom count", ^{
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter decrementBedroomCount];
            NSUInteger bedroomCount = [bedroomLabelCounter currentBedroomCount];
            expect(bedroomCount).to.equal(3);
        });
        
        it(@"cant decrement bedroom count below 2 bedrooms", ^{
            [bedroomLabelCounter decrementBedroomCount];
            [bedroomLabelCounter decrementBedroomCount];
            [bedroomLabelCounter decrementBedroomCount];
            NSUInteger bedroomCount = [bedroomLabelCounter currentBedroomCount];
            expect(bedroomCount).to.equal(2);
        });
        
        it(@"cant increment bedroom count above 7 bedrooms", ^{
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            NSUInteger bedroomCount = [bedroomLabelCounter currentBedroomCount];
            expect(bedroomCount).to.equal(7);
            
        });

        it(@"can display a proper label for 2 bedrooms", ^{
            NSString* bedroomCountLabelText = [bedroomLabelCounter bedroomCountLabelText];
            expect(bedroomCountLabelText).to.equal(@"2 Bedrooms");
        });
        
        it(@"can display a proper label for 7 bedrooms", ^{
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            [bedroomLabelCounter incrementBedroomCount];
            NSString* bedroomCountLabelText = [bedroomLabelCounter bedroomCountLabelText];
            expect(bedroomCountLabelText).to.equal(@"7 Bedrooms");
            
        });
        
    });

SpecEnd
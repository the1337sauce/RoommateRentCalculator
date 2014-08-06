//
//  BedroomLabelCounter.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "BedroomLabelCounter.h"

@interface BedroomLabelCounter()

@property (nonatomic) NSUInteger bedroomCount;

@end

@implementation BedroomLabelCounter

-(id) init {
    self = [super init];
    if(self){
        self.bedroomCount = 2;
        [self updateBedroomCountLabelText];
    }
    return self;
}

-(void) incrementBedroomCount{
    if(self.bedroomCount < MaximumNumberOfBedrooms){
        self.bedroomCount++;
        [self updateBedroomCountLabelText];
    }
}

-(void) decrementBedroomCount{
    if(self.bedroomCount > 2){
        self.bedroomCount--;
        [self updateBedroomCountLabelText];
    }
}

-(void) updateBedroomCountLabelText{
    self.bedroomCountLabelText = [[[[NSNumber numberWithUnsignedInteger:self.bedroomCount] stringValue] stringByAppendingString:@" "] stringByAppendingString:BedroomsString];
}

-(void) resetToDefaultBedroomCount{
    self.bedroomCount = DefaultNumberOfBedrooms;
    [self updateBedroomCountLabelText];
}

-(NSUInteger) currentBedroomCount{
    return self.bedroomCount;
}

@end



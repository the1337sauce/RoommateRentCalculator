//
//  Roommate.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/6/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "Roommate.h"

@implementation Roommate

-(instancetype) initWithName:(NSString*) name andBedroomSizeInSqFt:(NSUInteger) bedroomSizeInSqFt{
    self = [super init];
    if(!self) return nil;
    self.name = name;
    self.bedroomSizeInSqFt = bedroomSizeInSqFt;
    return self;
}

@end

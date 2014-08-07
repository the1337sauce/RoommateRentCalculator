//
//  Roommate.h
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/6/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Roommate : NSObject

@property (strong, nonatomic) NSString* name;
@property (nonatomic) NSUInteger bedroomSizeInSqFt;
@property (nonatomic) NSUInteger rent;


-(instancetype) initWithName:(NSString*) name andBedroomSizeInSqFt:(NSUInteger) bedroomSizeInSqFt;

@end

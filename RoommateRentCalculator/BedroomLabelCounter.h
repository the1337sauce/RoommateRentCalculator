//
//  BedroomLabelCounter.h
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Constants.h"

@interface BedroomLabelCounter : NSObject

@property (nonatomic) NSString* bedroomCountLabelText;

-(id) init;
-(void) incrementBedroomCount;
-(void) decrementBedroomCount;
-(void) resetToDefaultBedroomCount;
-(NSUInteger) currentBedroomCount;

@end

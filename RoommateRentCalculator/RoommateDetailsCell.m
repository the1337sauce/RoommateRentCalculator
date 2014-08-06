//
//  RoommateDetailsCell.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/18/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "RoommateDetailsCell.h"

@implementation RoommateDetailsCell

-(instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.isValid = NO;
        self.nameTextField.delegate = self;
    }
    return self;
}




@end

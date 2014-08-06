//
//  BedroomDetailsVC.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "BedroomDetailsVC.h"

@implementation BedroomDetailsVC

-(void) viewDidLoad{
    [super viewDidLoad];
    [self configureBedroomDetailsScrollView];
}

-(void) configureBedroomDetailsScrollView{
    self.bedroomDetailsScrollView = [[BedroomDetailsScrollView alloc] initWithNumberOfRoommates:self.numberOfRoommates];
    [self.view addSubview:self.bedroomDetailsScrollView];
}



@end
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
    [self setTextFieldDelegates];
    [self.view addSubview:self.bedroomDetailsScrollView];
}

-(void) setTextFieldDelegates{
    self.roommateDetailsViews = self.bedroomDetailsScrollView.roommateDetailsViews;
    for(RoommateDetailsView* roommateDetailsView in self.roommateDetailsViews){
        roommateDetailsView.roommatesNameTextField.delegate = self;
        roommateDetailsView.roommatesRoomSqFtTextField.delegate = self;
    }
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField endEditing:YES];
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [textField endEditing:YES];
    [textField resignFirstResponder];
    return YES;
}


@end

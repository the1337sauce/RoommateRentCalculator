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
    self.bedroomDetailsScrollView = [[BedroomDetailsScrollView alloc] initWithNumberOfRoommates:self.numberOfRoommates andTextFieldDelegate:self];
    [self.view addSubview:self.bedroomDetailsScrollView];
}


#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)finishButton:(id)sender {
    [self collectInput];
}

-(void)collectInput{
    for(RoommateDetailsView *roommateDetailsView in self.bedroomDetailsScrollView.roommateDetailsViews){
        NSLog(@"nameText is: %@", roommateDetailsView.roommatesNameTextField.text);
        NSLog(@"roomSize is: %@", roommateDetailsView.roommatesRoomSqFtTextField.text);
    }
}
@end

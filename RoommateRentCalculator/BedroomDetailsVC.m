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
    NSLog(@"Textfield Text: %@", textField.text);
    return YES;
}

- (IBAction)finishButton:(id)sender {
    ApartmentRentCalculator* rentCalculator = [self collectInputIntpRentCalculator];
}

-(ApartmentRentCalculator*)collectInputIntpRentCalculator{
    for(RoommateDetailsView *roommateDetailsView in self.bedroomDetailsScrollView.roommateDetailsViews){
        NSUInteger bedroomSizeInSqFt = [[NSNumber numberWithInteger:[roommateDetailsView.roommatesRoomSqFtTextField.text integerValue]] unsignedIntegerValue];
        Roommate* roommate = [[Roommate alloc] initWithName:roommateDetailsView.roommatesNameTextField.text andBedroomSizeInSqFt:bedroomSizeInSqFt];
        
    }
    return [[ApartmentRentCalculator alloc] init];
}
@end

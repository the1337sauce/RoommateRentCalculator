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
    [self.view.leftXOutButton addTarget:self action:@selector(leftXOutButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}

-(void) configureBedroomDetailsScrollView{
    self.bedroomDetailsScrollView = [[BedroomDetailsScrollView alloc] initWithNumberOfRoommates:self.numberOfRoommates andTextFieldDelegate:self];
    [self.view insertSubview:self.bedroomDetailsScrollView belowSubview:self.view.leftXOutButton];
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.view enableAndShowLeftXButton];
}

-(void)leftXOutButtonTapped{
    [self.bedroomDetailsScrollView resignAllTextFieldsFirstResponder];
    [self.view disableAndHideLeftXButton];
    
}

- (IBAction)finishButton:(id)sender {
    ApartmentRentCalculator* apartmentRentCalculator = [self buildApartmentRentCalculatorWithInput];
    [self performSegueWithIdentifier:@"Show Results" sender:apartmentRentCalculator];
}

-(ApartmentRentCalculator*)buildApartmentRentCalculatorWithInput{
    NSMutableArray *roommates = [NSMutableArray new];
    for(RoommateDetailsView *roommateDetailsView in self.bedroomDetailsScrollView.roommateDetailsViews){
        [roommates addObject:[self buildRoommateWithRoommateDetailsView:roommateDetailsView]];
    }
    return [[ApartmentRentCalculator alloc] initWithRoommates:roommates totalApartmentSqFootage:self.totalApartmentSqFootage andTotalRent:self.totalApartmentRent];
}

-(Roommate*) buildRoommateWithRoommateDetailsView:(RoommateDetailsView*) roommateDetailsView{
    NSUInteger bedroomSizeInSqFt = [[NSNumber numberWithInteger:[roommateDetailsView.roommatesRoomSqFtTextField.text integerValue]] unsignedIntegerValue];
    return [[Roommate alloc] initWithName:roommateDetailsView.roommatesNameTextField.text andBedroomSizeInSqFt:bedroomSizeInSqFt];
}

#pragma mark - storyboard

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Show Results"]){
        ResultsTVC *resultsTVC = (ResultsTVC*) segue.destinationViewController;
        resultsTVC.apartmentRentCalculator = sender;
    }
}

@end

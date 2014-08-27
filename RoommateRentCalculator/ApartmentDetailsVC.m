//
//  ApartmentDetailsVC.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "ApartmentDetailsVC.h"
#import "BedroomDetailsVC.h"

//const NSString* bedroomsConst = @"Bedrooms";

@implementation ApartmentDetailsVC

-(void) viewDidLoad{
    self.bedroomLabelCounter = [[BedroomLabelCounter alloc] init];
    self.squareFeetTextField.delegate = self;
    self.rentTextField.delegate = self;
    [self disableAndHideNextButton];
    [self configureDismissButton];
}

-(void) viewDidDisappear:(BOOL)animated{
    [self disableAndHideDismissButton];
    [self disableAndHideNextButton];
    [self.squareFeetTextField endEditing:YES];
    [self.rentTextField endEditing:YES];
}

- (IBAction)addBedroomButtonWasPressed:(id)sender {
    [self incrementBedroomCount];
}

- (IBAction)subtractBedroomButtonWasPressed:(id)sender {
    [self decrementBedroomCount];
}

-(void) configureDismissButton{
    [self disableAndHideDismissButton];
    [self.dismissButton addTarget:self action:@selector(dismissButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}


-(void) disableAndHideNextButton{
    self.nextButton.enabled = NO;
    self.nextButton.alpha = 0.0;
}

-(void) disableAndHideDismissButton{
    self.dismissButton.enabled = NO;
    self.dismissButton.alpha = 0.0;
}

-(void) dismissButtonPressed{
    [self.squareFeetTextField resignFirstResponder];
    [self.rentTextField resignFirstResponder];
    [self disableAndHideDismissButton];
    [self disableAndHideNextButton];
}

-(void) incrementBedroomCount{
    [self.bedroomLabelCounter incrementBedroomCount];
    [self updateBedroomLabelText];
}

-(void) decrementBedroomCount{
    [self.bedroomLabelCounter decrementBedroomCount];
    [self updateBedroomLabelText];
}

-(void)updateBedroomLabelText{
    self.bedroomCountLabel.text = [self.bedroomLabelCounter bedroomCountLabelText];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.nextButton.enabled = YES;
    [self presentButtonWithAnimations:self.nextButton];
    [self presentButtonWithAnimations:self.dismissButton];
    self.dismissButton.enabled = YES;
}

-(void) presentButtonWithAnimations:(UIButton*) button{
    [UIView animateWithDuration:0.4
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         button.alpha = 1.0;
                     }
                     completion:nil] ;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Bedroom Details"]){
        BedroomDetailsVC *bedroomDetailsVC = (BedroomDetailsVC*) segue.destinationViewController;
        bedroomDetailsVC.numberOfRoommates = self.bedroomLabelCounter.currentBedroomCount;
        bedroomDetailsVC.totalApartmentSqFootage = [[NSNumber numberWithInteger:[self.squareFeetTextField.text integerValue]] unsignedIntegerValue];
        bedroomDetailsVC.totalApartmentRent = [[NSNumber numberWithInteger:[self.rentTextField.text integerValue]] unsignedIntegerValue];
    }
}

@end

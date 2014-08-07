//
//  InitialVC.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "InitialVC.h"
#import "BedroomDetailsVC.h"

//const NSString* bedroomsConst = @"Bedrooms";

@implementation InitialVC

-(void) viewDidLoad{
    self.bedroomLabelCounter = [[BedroomLabelCounter alloc] init];
    self.squareFeetTextField.delegate = self;
    self.nextButton.enabled = NO;
    self.nextButton.hidden = YES;
}

- (IBAction)addBedroomButtonWasPressed:(id)sender {
    [self incrementBedroomCount];
}

- (IBAction)subtractBedroomButtonWasPressed:(id)sender {
    [self decrementBedroomCount];
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
    self.nextButton.hidden = NO;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Bedroom Details"]){
        BedroomDetailsVC *bedroomDetailsVC = (BedroomDetailsVC*) segue.destinationViewController;
        bedroomDetailsVC.numberOfRoommates = self.bedroomLabelCounter.currentBedroomCount;
        bedroomDetailsVC.totalApartmentSqFootage = [[NSNumber numberWithInteger:[self.squareFeetTextField.text integerValue]] unsignedIntegerValue];
    }
}

@end

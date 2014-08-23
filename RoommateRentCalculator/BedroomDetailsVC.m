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
    [self registerKeyboardObservers];
}

-(void) configureBedroomDetailsScrollView{
    self.bedroomDetailsScrollView = [[BedroomDetailsScrollView alloc] initWithNumberOfRoommates:self.numberOfRoommates andTextFieldDelegate:self];
    [self.view insertSubview:self.bedroomDetailsScrollView belowSubview:self.view.leftXOutButton];
}

-(void) registerKeyboardObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(shiftViewForKeyboardOpened:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    //For Later Use
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(shiftViewForKeyboardClosed:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

-(void)shiftViewForKeyboardOpened:(NSNotification*) notification{
    CGSize keyboardSize = [self getKeyboardSizeFromNotification:notification];
    [self.bedroomDetailsScrollView offsetForKeyboardOpenedWithKeyboardSize:keyboardSize];
}

-(void)shiftViewForKeyboardClosed:(NSNotification*) notification {
    CGSize keyboardSize = [self getKeyboardSizeFromNotification:notification];
    [self.bedroomDetailsScrollView offsetForKeyboardClosedWithKeyboardSize:keyboardSize];
}

-(CGSize) getKeyboardSizeFromNotification:(NSNotification*) notification{
     return [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
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
    [self performSegueOrReportInvalidInputForCalculator:apartmentRentCalculator];
}

-(void)performSegueOrReportInvalidInputForCalculator:(ApartmentRentCalculator*) apartmentRentCalculator{
    if(!self.bedroomDetailsScrollView.isFullyPopulated){
        [self displayAlertViewWithMessage:@"Please finish filling out the text fields"];
    }
    else if(!apartmentRentCalculator.isValidBedroomSquareFootage){
        [self displayAlertViewWithMessage:@"Bedroom square footage is greater than the total apartment square footage!"];
    }
    else{
        [self performSegueWithIdentifier:@"Show Results" sender:apartmentRentCalculator];
    }
}

-(void) displayAlertViewWithMessage:(NSString*) message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
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

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

@end

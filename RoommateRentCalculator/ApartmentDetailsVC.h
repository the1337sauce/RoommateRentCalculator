//
//  ApartmentDetailsVC.h
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BedroomLabelCounter.h"

@interface ApartmentDetailsVC : UIViewController <UITextFieldDelegate>

@property (nonatomic) BedroomLabelCounter* bedroomLabelCounter;

- (IBAction)addBedroomButtonWasPressed:(id)sender;
- (IBAction)subtractBedroomButtonWasPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *bedroomCountLabel;
@property (weak, nonatomic) IBOutlet UITextField *squareFeetTextField;
@property (weak, nonatomic) IBOutlet UITextField *rentTextField;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

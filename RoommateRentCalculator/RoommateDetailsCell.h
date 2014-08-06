//
//  RoommateDetailsCell.h
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/18/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoommateDetailsCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *roomSizeRextField;

@property (nonatomic) BOOL isValid;

-(instancetype) initWithCoder:(NSCoder *)aDecoder;

@end

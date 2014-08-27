//
//  RoommateRentCalculatorNC.m
//  RoommateRentCalculator
//
//  Created by Nathaniel Linsky on 8/23/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "RoommateRentCalculatorNC.h"

@interface RoommateRentCalculatorNC ()

@end

@implementation RoommateRentCalculatorNC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Initialize
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavBarColor];
    [self setNavBarTitleColor];
}

-(void)setNavBarColor{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:219.0/255.0 green:68.0/255.0 blue:66.0/255.0 alpha:1.0]];
}

-(void)setNavBarTitleColor{
    [[UINavigationBar appearance] setTitleTextAttributes:
            @{ NSForegroundColorAttributeName : [UIColor colorWithRed:240.0/255.0 green:241.0/255.0 blue:207.0/255.0 alpha:1.0],
               NSFontAttributeName : [UIFont navBarTitleAvenir]
               }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  UIColor+RRCColors.m
//  RoommateRentCalculator
//
//  Created by Alexander Linsky on 7/12/14.
//  Copyright (c) 2014 Nates Lab. All rights reserved.
//

#import "UIColor+RRCColors.h"

@implementation UIColor (RRCColors)

+ (UIColor*)labelBlueColor {
   return [UIColor colorWithRed:33.0/255.0 green:133.0/255.0 blue:197.0/255.0 alpha:1];
}

+ (UIColor*)backgroundGrayColor{
    return [UIColor colorWithRed:62.0/255.0 green:69.0/255.0 blue:76.0/255.0 alpha:1];
}

+ (UIColor*)lightTextColor{
    return [UIColor colorWithRed:255.0/255.0 green:246.0/255.0 blue:229.0/255.0 alpha:1];
}

+ (UIColor*) fadedRedColor{
    return [UIColor colorWithRed:255.0/255.0 green:127.0/255.0 blue:102.0/255.0 alpha:1];
}

@end

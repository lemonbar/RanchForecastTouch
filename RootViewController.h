//
//  RootViewController.h
//  RanchForecastTouch
//
//  Created by Meng Li on 14-7-18.
//  Copyright (c) 2014年 Meng Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *fetchButton;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)fetchClasses:(id)sender;

@end

//
//  ScheduleViewController.h
//  RanchForecastTouch
//
//  Created by Meng Li on 14-7-18.
//  Copyright (c) 2014年 Meng Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UITableViewController{
    NSArray *classes;
    NSDateFormatter *dateFormatter;
}

@property (nonatomic, strong) NSArray *classes;

@end

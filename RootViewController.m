//
//  RootViewController.m
//  RanchForecastTouch
//
//  Created by Meng Li on 14-7-18.
//  Copyright (c) 2014年 Meng Li. All rights reserved.
//

#import "RootViewController.h"
#import "ScheduleFetcher.h"
#import "ScheduleViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize fetchButton,activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self navigationItem] setTitle:@"RanchForecast"];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [fetchButton release];
    [fetchButton release];
    [activityIndicator release];
    [super dealloc];
}
- (IBAction)fetchClasses:(id)sender {
    [activityIndicator startAnimating];
    [fetchButton setEnabled:NO];
    ScheduleFetcher *fetcher = [[ScheduleFetcher alloc]
                                init];
    [fetcher fetchClassesWithBlock:
     ^(NSArray *classes, NSError
       *error) {
         [fetchButton setEnabled:YES];
         [activityIndicator stopAnimating];
         if (classes) {
             ScheduleViewController *svc;
             svc = [[ScheduleViewController alloc]
                    initWithStyle:UITableViewStylePlain];
             [svc setClasses:classes];
             [self.navigationController
              pushViewController:svc
              animated:YES];
         }
         else
             {
             UIAlertView *alert;
             alert = [[UIAlertView alloc]
                      initWithTitle:@"Error Fetching Classes"
                      message:[error
                               localizedDescription]
                      delegate:nil
                      cancelButtonTitle:@"Dismiss"
                      otherButtonTitles:nil];
             [alert show];
             }
     }];
}
@end

//
//  RemainderViewController.m
//  HypnoNerd
//
//  Created by Roman Ustiantcev on 19/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "RemainderViewController.h"
@interface RemainderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation RemainderViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // get the tbi
        UITabBarItem *tbi = self.tabBarItem;
        
        // give it a name
        tbi.title = @"Reminder";
        
        // give it an image
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    
    return self;
}

-(IBAction)addRemainder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a remainder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize Me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"RemainderViewController loaded this view");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end

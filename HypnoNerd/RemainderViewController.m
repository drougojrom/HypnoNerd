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

-(IBAction)addRemainder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a remainder for %@", date);
}

@end

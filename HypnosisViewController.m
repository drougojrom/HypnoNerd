//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Roman Ustiantcev on 19/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController () <UITextFieldDelegate>
@end

@implementation HypnosisViewController

-(void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0;i<20;i++){
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // configure message color and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        // get a random x value of the width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        // get random y value of the height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        // update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // add the label to hierarchy
        [self.view addSubview:messageLabel];
        
        
    }
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self){
        // set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // create a UIImage from a file
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // put the image on tab bar
        self.tabBarItem.image = i;
    }
    
    return self;
}

-(void)viewDidLoad
{
    // always call!
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded this view");
}

-(void)loadView
{
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    // create a view
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    
    CGRect textFiledRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFiledRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me!";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    // set it as "the" view of the view controller
    self.view = backgroundView;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

@end

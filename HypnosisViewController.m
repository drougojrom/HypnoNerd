//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Roman Ustiantcev on 19/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

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

-(void)loadView
{
    // create a view
    HypnosisView *backgroundView = [[HypnosisView alloc] init];
    
    // set it as "the" view of the view controller
    self.view = backgroundView;
}

@end

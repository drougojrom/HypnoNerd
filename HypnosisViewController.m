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

-(void)loadView
{
    // create a view
    HypnosisView *backgroundView = [[HypnosisView alloc] init];
    
    // set it as "the" view of the view controller
    self.view = backgroundView;
}

@end

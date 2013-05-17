//
//  TCMainViewController.m
//  SlideChat
//
//  Created by langxue on 13-5-8.
//  Copyright (c) 2013年 langxue. All rights reserved.
//

#import "TCMainViewController.h"    
#import "TCSlideView.h"


@implementation TCMainViewController

@synthesize IBSlideIn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


- (void) createSlideIns {
    
    TCSlideView *downSlideIn = [TCSlideView viewWithImage:[UIImage imageNamed:@"a.jpg"]];
	[downSlideIn showWithTimer:1.25 inView:self.view from:SlideInViewBot bounce:YES];
    
	TCSlideView *leftSlideIn = [TCSlideView viewWithImage:[UIImage imageNamed:@"a.jpg"]];
	[leftSlideIn showWithTimer:1 inView:self.view from:SlideInViewLeft bounce:NO];
    
	TCSlideView *rightSlideIn = [TCSlideView viewWithImage:[UIImage imageNamed:@"a.jpg"]];
	[rightSlideIn showWithTimer:1.5 inView:self.view from:SlideInViewRight bounce:NO];
    
	TCSlideView *topSlideIn = [TCSlideView viewWithImage:[UIImage imageNamed:@"a.jpg"]];
	[topSlideIn showWithTimer:1.25 inView:self.view from:SlideInViewTop bounce:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSlideIns];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end

//
//  TCMainViewController.m
//  SlideChat
//
//  Created by langxue on 13-5-8.
//  Copyright (c) 2013年 langxue. All rights reserved.
//

#import "TCMainViewController.h"    
#import "TCSlideView.h"
#import "TCChatViewController.h"


@implementation TCMainViewController

@synthesize IBSlideIn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tvc = [[TCChatViewController alloc] init];
    }
    return self;
}


- (void)ShiftTo:(UIViewController *)viewController{
    [self.navigationController setNavigationBarHidden:NO];
    //[[self navigationController] pushViewController:vc animated:YES];
    CATransition *animation = [CATransition animation];
	[animation setDuration:0.3];
	[animation setType: kCATransitionMoveIn];
	[animation setSubtype: kCATransitionFromTop];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    [self.navigationController pushViewController:viewController animated:NO];
    
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}

- (void) createSlideIn:(UIView *) view {
    //如果是局部变量，为什么在方法调用完后这些View还存在？
    TCSlideView *downSlideIn = [TCSlideView viewWithImage:[UIImage imageNamed:@"a.jpg"]];
    //因为他们被加入 self.view里了
	[downSlideIn showWithTimer:1.25 inView:view from:SlideInViewBot bounce:YES];
    
	TCSlideView *leftSlideIn = [TCSlideView viewWithImage:[UIImage imageNamed:@"a.jpg"]];
	[leftSlideIn showWithTimer:1 inView:view from:SlideInViewLeft bounce:NO];
    
	TCSlideView *rightSlideIn = [TCSlideView viewWithImage:[UIImage imageNamed:@"a.jpg"]];
    rightSlideIn.delegate = self;
    rightSlideIn.tvc = self.tvc;
	[rightSlideIn showWithTimer:1.5 inView:view from:SlideInViewRight bounce:NO];
    
	TCSlideView *topSlideIn = [TCSlideView viewWithImage:[UIImage imageNamed:@"a.jpg"]];
	[topSlideIn showWithTimer:1.25 inView:view from:SlideInViewTop bounce:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSlideIn:self.view];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}


@end

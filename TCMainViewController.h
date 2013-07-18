//
//  TCMainViewController.h
//  SlideChat
//
//  Created by langxue on 13-5-8.
//  Copyright (c) 2013年 langxue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCSlideView.h"
@class TCChatViewController;



@interface TCMainViewController : UIViewController<TCNavigateDelegate> {
	
	TCSlideView *IBSlideIn;
	
}

@property (nonatomic, strong) IBOutlet TCSlideView *IBSlideIn;
@property (nonatomic, strong) TCChatViewController *tvc;
@property (nonatomic, strong) UINavigationController *uc;

- (void) ShiftTo:(UIViewController *)vc;

@end

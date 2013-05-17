//
//  TCMainViewController.h
//  SlideChat
//
//  Created by langxue on 13-5-8.
//  Copyright (c) 2013年 langxue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCSlideView;


@interface TCMainViewController : UIViewController {
	
	TCSlideView *IBSlideIn;
	
}

@property (nonatomic, strong) IBOutlet TCSlideView *IBSlideIn;

@end

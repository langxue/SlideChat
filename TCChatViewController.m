//
//  TCChatViewController.m
//  SlideChat
//
//  Created by langxue on 13-7-16.
//  Copyright (c) 2013年 langxue. All rights reserved.
//

#import "TCChatViewController.h"
#import "TCSlideView.h"

@interface TCChatViewController ()

@end

@implementation TCChatViewController

- (void)loadView
{
    // Create an instance of UIWebView as large as the screen
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];
    UIWebView *wv = [[UIWebView alloc] initWithFrame:screenFrame];
    // Tell web view to scale web content to fit within bounds of webview
    [wv setScalesPageToFit:YES];
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://ct.ctrip.com/m"]];
    
    [wv loadRequest:req];
    
    [self setView:wv];
}

- (UIWebView *)webView
{
    return (UIWebView *)[self view];
}

@end

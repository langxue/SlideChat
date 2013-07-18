//
//  TCAppDelegate.m
//  SlideChat
//
//  Created by langxue on 13-5-8.
//  Copyright (c) 2013年 langxue. All rights reserved.
//

#import "TCAppDelegate.h"
#import "TCMainViewController.h"

@implementation TCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    TCMainViewController *mvc = [[TCMainViewController alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    [navController setNavigationBarHidden:YES];
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end

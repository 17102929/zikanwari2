//
//  AppDelegate.m
//  zikanwari2
//
//  Created by Sora Mizuno on 2014/08/19.
//  Copyright (c) 2014年 Sora Mizuno. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
//#import "ViewController.m"
@class ViewController;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    NSUserDefaults *readdefault0 = [NSUserDefaults standardUserDefaults];
    date[0] = [readdefault0 objectForKey:@"date0"];
    NSLog(@"%@" , date[0]);
    
    NSUserDefaults *readdefault1 = [NSUserDefaults standardUserDefaults];
    date[1] = [readdefault1 objectForKey:@"date1"];
    NSLog(@"%@" , date[1]);
    
    
    NSUserDefaults *readdefault2 = [NSUserDefaults standardUserDefaults];
    date[2] = [readdefault2 objectForKey:@"date2"];
    NSLog(@"%@" , date[2]);
        
    NSUserDefaults *readdefault3 = [NSUserDefaults standardUserDefaults];
    date[3] = [readdefault3 objectForKey:@"date3"];
    NSLog(@"%@" , date[3]);
    
    NSUserDefaults *readdefault4 = [NSUserDefaults standardUserDefaults];
    date[4] = [readdefault4 objectForKey:@"date4"];
    NSLog(@"%@" , date[4]);
    
    NSUserDefaults *readdefault5 = [NSUserDefaults standardUserDefaults];
    date[5] = [readdefault5 objectForKey:@"date5"];
    NSLog(@"%@" , date[5]);
    
    NSUserDefaults *readdefault6 = [NSUserDefaults standardUserDefaults];
    date[6] = [readdefault6 objectForKey:@"date6"];
    NSLog(@"%@" , date[6]);
    
    UILocalNotification *notify;
     notify = [[UILocalNotification alloc]init];
     [notify setTimeZone:[NSTimeZone systemTimeZone]];
     notify.alertBody = @"hoge";
     
     
     [notify setFireDate:date[0]];
     [notify setFireDate:date[1]];
     [notify setFireDate:date[2]];
     [notify setFireDate:date[3]];
     [notify setFireDate:date[4]];
     [notify setFireDate:date[5]];
     [notify setFireDate:date[6]];
     
     
     
     
     [[UIApplication sharedApplication]scheduleLocalNotification:notify];
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

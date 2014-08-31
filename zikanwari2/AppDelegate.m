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
    
    [application setMinimumBackgroundFetchInterval:6.0f];
    
    return YES;
}

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    
    NSError *error;
    if(error){
        completionHandler(UIBackgroundFetchResultFailed);
    }
    else{
        completionHandler(UIBackgroundFetchResultNewData);
    }
    
    

    
     NSUserDefaults *readdefault0 = [NSUserDefaults standardUserDefaults];
     m_date[0] = [readdefault0 objectForKey:@"date0"];
    NSLog(@"%@" , m_date[0]);
     
     NSUserDefaults *readdefault1 = [NSUserDefaults standardUserDefaults];
     m_date[1] = [readdefault1 objectForKey:@"date1"];
    //NSLog(@"%@" , m_date[1]);
     
     
     NSUserDefaults *readdefault2 = [NSUserDefaults standardUserDefaults];
     m_date[2] = [readdefault2 objectForKey:@"date2"];
    // NSLog(@"%@" , m_date[2]);
     
     NSUserDefaults *readdefault3 = [NSUserDefaults standardUserDefaults];
     m_date[3] = [readdefault3 objectForKey:@"date3"];
    // NSLog(@"%@" , m_date[3]);
     
     NSUserDefaults *readdefault4 = [NSUserDefaults standardUserDefaults];
     m_date[4] = [readdefault4 objectForKey:@"date4"];
     //NSLog(@"%@" , m_date[4]);
     
     NSUserDefaults *readdefault5 = [NSUserDefaults standardUserDefaults];
     m_date[5] = [readdefault5 objectForKey:@"date5"];
     //NSLog(@"%@" , m_date[5]);
     
     NSUserDefaults *readdefault6 = [NSUserDefaults standardUserDefaults];
     m_date[6] = [readdefault6 objectForKey:@"date6"];
    //NSLog(@"%@" , m_date[6]);
    
     
     UILocalNotification *notify;
     notify = [[UILocalNotification alloc]init];
    [notify setTimeZone:[NSTimeZone localTimeZone]];
    // notify.alertBody = @"hoge";
    

    
   
    
    
    NSDate *date = [NSDate date];
    NSLog(@"%@" , date);

    
   // NSLog(@"%@" , date);

    if(date == m_date[0]){
     notify.alertBody = @"hoge0";
     [notify fireDate];
        
        
     }
   
     
     if(date == m_date[1]){
     [notify fireDate];
         notify.alertBody = @"hoge1";
     }
     
     if(date == m_date[2]){
     [notify fireDate];
         notify.alertBody = @"hoge2";
     }
     
     if(date == m_date[3]){
     [notify fireDate];
         notify.alertBody = @"hoge3";
     }
     
     if(date == m_date[4]){
     [notify fireDate];
         notify.alertBody = @"hoge4";
     }
     
     if(date == m_date[5]){
     [notify fireDate];
         notify.alertBody = @"hoge5";
     }
     
     if(date == m_date[6]){
     [notify fireDate];
         notify.alertBody = @"hoge6";
     }

    
    
    
        /*[notify setFireDate:m_date[0]];
        [notify setFireDate:m_date[1]];
        [notify setFireDate:m_date[2]];
        [notify setFireDate:m_date[3]];
        [notify setFireDate:m_date[4]];
        [notify setFireDate:m_date[5]];
        [notify setFireDate:m_date[6]];
        NSLog(@"%@" , m_date[0]);*/
    
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notify];
        
    
    }



     
     //NSLog(@"%@" , m_date[6]);
     
     
    // for(int i = 0; i<10; i++){
     //i--;
    
     //NSLog(@"%@" , date);
     

    

    


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalim_date timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    
    
   /* NSUserDefaults *readdefault0 = [NSUserDefaults standardUserDefaults];
    m_date[0] = [readdefault0 objectForKey:@"date0"];
    NSLog(@"%@" , m_date[0]);
    
    NSUserDefaults *readdefault1 = [NSUserDefaults standardUserDefaults];
    m_date[1] = [readdefault1 objectForKey:@"date1"];
    //NSLog(@"%@" , m_date[1]);
    
    
    NSUserDefaults *readdefault2 = [NSUserDefaults standardUserDefaults];
    m_date[2] = [readdefault2 objectForKey:@"date2"];
    //NSLog(@"%@" , m_date[2]);
        
    NSUserDefaults *readdefault3 = [NSUserDefaults standardUserDefaults];
    m_date[3] = [readdefault3 objectForKey:@"date3"];
    //NSLog(@"%@" , m_date[3]);
    
    NSUserDefaults *readdefault4 = [NSUserDefaults standardUserDefaults];
    m_date[4] = [readdefault4 objectForKey:@"date4"];
    //NSLog(@"%@" , m_date[4]);
    
    NSUserDefaults *readdefault5 = [NSUserDefaults standardUserDefaults];
    m_date[5] = [readdefault5 objectForKey:@"date5"];
    //NSLog(@"%@" , m_date[5]);
    
    NSUserDefaults *readdefault6 = [NSUserDefaults standardUserDefaults];
    m_date[6] = [readdefault6 objectForKey:@"date6"];
    
    UILocalNotification *notify;
    notify = [[UILocalNotification alloc]init];
    [notify setTimeZone:[NSTimeZone systemTimeZone]];
    notify.alertBody = @"hoge";

    //NSLog(@"%@" , m_date[6]);
    
    
    for(int i = 0; i<10; i++){
        i--;
        NSDate *date;
        date = [NSDate date];
        //NSLog(@"%@" , date);
        
        if(date == m_date[0]){
            [notify fireDate];
            
        }
        
        if(date == m_date[1]){
            [notify fireDate];
        }
        
        if(date == m_date[2]){
            [notify fireDate];
        }
        
        if(date == m_date[3]){
            [notify fireDate];
        }
        
        if(date == m_date[4]){
            [notify fireDate];
        }
        
        if(date == m_date[5]){
            [notify fireDate];
        }
        
        if(date == m_date[6]){
            [notify fireDate];
        }
        
        for(int i = 0; i<10; i++){
            i--;
            NSDate *date;
            date = [NSDate date];
            [notify setFireDate:date];
            
             [notify setFireDate:m_date[0]];
             [notify setFireDate:m_date[1]];
             [notify setFireDate:m_date[2]];
             [notify setFireDate:m_date[3]];
             [notify setFireDate:m_date[4]];
             [notify setFireDate:m_date[5]];
             [notify setFireDate:m_date[6]];
            
            
            
            NSLog(@"%@" , m_date[0]);
            
        }
        
    */


    
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

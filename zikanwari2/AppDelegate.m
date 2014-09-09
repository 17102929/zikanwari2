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
    
    [application setMinimumBackgroundFetchInterval:10];
    
    
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
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    flags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSInteger hour[7];
    NSInteger minute[7];
    
    
    NSUserDefaults *readdefault = [NSUserDefaults standardUserDefaults];
    for (int k=0; k<7; k++) {
        
        m_date[k] = [readdefault objectForKey:[NSString stringWithFormat:@"date%d", k]];
        comps = [calendar components:flags fromDate:m_date[k]];
        hour[k] = comps.hour;
        minute[k] = comps.minute;
        NSLog(@"SaveTime[%d] %d:%d", k, (int)hour[k], (int)minute[k]);
        
        NSDate *Now;
        Now = [NSDate date];
        
        NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *comps;
        
        // 曜日
        comps = [calendar components:NSWeekdayCalendarUnit fromDate:Now];
        NSInteger weekday = comps.weekday; // 曜日(1が日曜日 7が土曜日)
        
                if(weekday == 2) {
            for(int i = 0; i <HEIGHT_BLOCK_NUM; i++){
                
            
                
            }
    }
    
    
    /* 現在時刻の取得 */
    NSDate *now = [NSDate date];
    NSInteger nowHour, nowMinute;
    comps = [calendar components:flags fromDate:now];
    nowHour = comps.hour;
    nowMinute = comps.minute;
    
    NSLog(@"Now %d:%d", (int)nowHour, (int)nowMinute);
    
    UILocalNotification *notify;
    notify = [[UILocalNotification alloc]init];
    [notify setTimeZone:[NSTimeZone localTimeZone]];
        
    
    for (int k=0; k<7; k++) {
        if (hour[k] == nowHour && minute[k] == nowMinute) {
            //2が月曜なので注意
            // 現在日付を取得
            
            }
    
    
    

    

            notify.alertBody = [NSString stringWithFormat:@"Hoge %d", k];
            //[notify fireDate];
        // 通知時間 < 現在時 なら設定しない
        if (m_date == nil || [m_date[k] timeIntervalSinceNow] <= 0) {
            return;
            
        }

        notify.fireDate = m_date[k];
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notify];
        //[[UIApplication sharedApplication]cancelLocalNotification:notify];
        
    }
        
    }
    
}

    
    
    
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
 
}

/*- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalim_date timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
       

    
    
    
       
    }*/
    
     
     
     
     



/*- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}*/

/*- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}*/

@end

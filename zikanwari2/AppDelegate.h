//
//  AppDelegate.h
//  zikanwari2
//
//  Created by Sora Mizuno on 2014/08/19.
//  Copyright (c) 2014年 Sora Mizuno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
//#import "ViewController.m"
@class ViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSDate *m_date[7];
   
}

@property (strong, nonatomic) UIWindow *window;

/*問題
通知が来ない


//解決方法:
 .firedateからsetfiredateに
 

//具体的に
 〃

//結果:

/参考*/




@end

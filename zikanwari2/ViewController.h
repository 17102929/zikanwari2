//
//  ViewController.h
//  zikanwari2
//
//  Created by Sora Mizuno on 2014/08/19.
//  Copyright (c) 2014年 Sora Mizuno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

const static int WIDTH_BLOCK_NUM = 7;
const static int HEIGHT_BLOCK_NUM = 8;


const static int BOTTOM_HEIGHT = 100;

const static int TEXTFIELD_WIDTH = 100;
const static int TEXTFIELD_HEIGHT = 30;

//#define COLOR_PURPLE [UIColor colorWithRed:0.75f green:0.51f blue:1.0f alpha:1.0f]
//#define COLOR_SKYBLUE [UIColor colorWithRed:0.61 green:1.0f blue:1.0f alpha:1.0f]
//#define COLOR_PINK [UIColor colorWithRed:1.0 green:0.63f blue:0.81f alpha:1.0f]
//#define COLOR_GREEN [UIColor colorWithRed:0.81f green:1.0f blue:0.81f alpha:1.0f]
//#define COLOR_YELLOW [UIColor colorWithRed:1.0f green:1.0f blue:0.61f alpha:1.0f]




@interface ViewController : UIViewController<UITextFieldDelegate>{
    UIButton *m_button[WIDTH_BLOCK_NUM][HEIGHT_BLOCK_NUM];
    UITextField *m_subject,*m_roomNumber,*m_teacher;
    UIScrollView *m_scr;
    UIDatePicker *m_datepicker;
    NSMutableDictionary *m_dic[7];
    UIButton *m_pickerdone;
    NSDate *m_date[7];
    int numforjudge;
    int a;
    int b;
    int c;
    int d;
    int f;
    int g;
    int h;
   

    //NSDate *m_date;
       
    
}



//- (IBAction)showlog;


@end

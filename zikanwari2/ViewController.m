//
//  ViewController.m
//  /
//
//  Created by Sora Mizuno on 2014/08/19.
//  Copyright (c) 2014年 Sora Mizuno. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@class AppDelegate;

@interface ViewController ()

@end

static NSString *const dayoftheweek[WIDTH_BLOCK_NUM ] = {@"", @"月", @"火", @"水", @"木", @"金", @"土",};

@implementation ViewController


- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    m_scr = [[UIScrollView alloc]init];
    [self.view addSubview:m_scr];

    
    m_datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0 , 570, 300, 30)];
    m_datepicker.minuteInterval = 5;
    m_datepicker.backgroundColor = [UIColor colorWithRed:1.0f green:0.9f blue:0.81f alpha:1.0];
    m_datepicker.datePickerMode = UIDatePickerModeTime;
    
    [m_scr addSubview:m_datepicker];
    m_pickerdone = [[UIButton alloc]initWithFrame:CGRectMake(290,573,30,30)];
    m_pickerdone.backgroundColor = [UIColor redColor];
    //いろいろ場所調整
    
    m_pickerdone.backgroundColor = [UIColor colorWithRed:0.67f green:0.83f blue:1.0f alpha:1.0f];
    [m_scr addSubview:m_pickerdone];
    [m_pickerdone addTarget:self action:@selector(datePickerFinished:) forControlEvents:UIControlEventTouchUpInside];

    
    
    
    
    
    //画面サイズの取得
    CGSize whole = [[UIScreen mainScreen]bounds].size;
    
    //一つのラベルのX座標の変数
    float buttonwidth = whole.width/WIDTH_BLOCK_NUM ;
    
    
    //一つのラベルのY座標の変数
    float buttonheight = (whole.height-BOTTOM_HEIGHT)/HEIGHT_BLOCK_NUM;
    
    
    for(int i = 0; i <HEIGHT_BLOCK_NUM; i++){
        for(int j = 0; j<WIDTH_BLOCK_NUM ; j++){
            m_button[j][i] = [[UIButton alloc]initWithFrame:CGRectMake(buttonwidth*j, buttonheight*i, buttonwidth, buttonheight )];
            [m_button[j][i] setTitle:@"" forState:UIControlStateNormal];
            m_button[j][i].backgroundColor =[UIColor colorWithRed:0.61 green:1.0f blue:1.0f alpha:1.0f];
            [m_scr addSubview:m_button[j][i]];
            
            if(! (j == 0 || i == 0) ){
                
               [m_button[j][i] addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
               
            }
            
        
            
            if(i != 0 && j == 0){
             
                [m_button[j][i] addTarget:self action:@selector(showpicker:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            m_button[j][i].layer.borderColor = [UIColor blueColor].CGColor;
            m_button[j][i].layer.borderWidth = 1.0f;
            m_button[j][i].layer.cornerRadius = 0.0f;
        
        }
        
    }
    
    
    
    for(int i = 0; i <WIDTH_BLOCK_NUM ; i++){
        m_button[i][0].backgroundColor = [UIColor colorWithRed:1.0f green:0.63f blue:0.81f alpha:1.0f];
           }
    
    
    for(int i =0; i <HEIGHT_BLOCK_NUM; i++){
        //iをY座標としてiを増やすのをループさせることで縦全てを黄色に
        m_button[0][i].backgroundColor = [UIColor colorWithRed:0.75f green:0.51f blue:1.0f alpha:1.0f];
    }
    
    for(int i = 0; i <HEIGHT_BLOCK_NUM; i++){
        [m_button[0][i] setTitle:[NSString stringWithFormat:@"%d" , i] forState:UIControlStateNormal];
        

    }
    
    //iはWIDTH_BLOCK_NUM -1になる、最終的に。dayoftheweekの配列の最大数(WIDTH_BLOCK_NUM -1)まで0から1づつ足していく。
    for(int i = 0; i<WIDTH_BLOCK_NUM ; i++){
        [m_button[i][0] setTitle:dayoftheweek[i] forState:UIControlStateNormal];
    }
    
    
    m_subject = [[UITextField alloc]initWithFrame:CGRectMake(164-TEXTFIELD_WIDTH/2,
                                                           484,
                                                           TEXTFIELD_WIDTH,
                                                           TEXTFIELD_HEIGHT)];
    
    m_roomNumber = [[UITextField alloc]initWithFrame:CGRectMake(74-TEXTFIELD_WIDTH/2,
                                                              534,
                                                              TEXTFIELD_WIDTH,
                                                              TEXTFIELD_HEIGHT)];
    
    m_teacher = [[UITextField alloc]initWithFrame:CGRectMake(252-TEXTFIELD_WIDTH/2,
                                                           534,
                                                           TEXTFIELD_WIDTH,
                                                           TEXTFIELD_HEIGHT)];
        

    m_scr.frame = self.view.bounds;
    
    
    [m_scr addSubview:m_subject];
    [m_scr addSubview:m_roomNumber];
    [m_scr addSubview:m_teacher];
    
    m_subject.borderStyle = UITextBorderStyleRoundedRect;
    m_subject.returnKeyType = UIReturnKeyNext;
    m_subject.placeholder = @"subject";
    m_subject.delegate = self;
    m_subject.textAlignment = NSTextAlignmentCenter;
    m_subject.adjustsFontSizeToFitWidth = YES;
    
   
    
    
    
    m_roomNumber.borderStyle = UITextBorderStyleRoundedRect;
    m_roomNumber.returnKeyType = UIReturnKeyNext;
    m_roomNumber.placeholder = @"room";
    m_roomNumber.delegate = self;
    m_roomNumber.textAlignment = NSTextAlignmentCenter;
    m_roomNumber.adjustsFontSizeToFitWidth = YES;
    
    
    
    m_teacher.borderStyle = UITextBorderStyleRoundedRect;
    m_teacher.returnKeyType = UIReturnKeyDone;
    m_teacher.placeholder = @"teacher";
    m_teacher.delegate = self;
    m_teacher.textAlignment = NSTextAlignmentCenter;
    m_teacher.adjustsFontSizeToFitWidth = YES;
    
    
    [self registerForKeyboardNotifications];
    
    m_scr.backgroundColor = [UIColor colorWithRed:0.81f green:1.0f blue:0.81f alpha:1.0f];
    
    
    
    
   
    
    
    /*itemsofsegment = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
    segment = [[UISegmentedControl alloc]initWithItems:itemsofsegment];
    segment.frame = CGRectMake(15, 500, 300, 30);
    [m_scr addSubview:segment];
    //segment.hidden = YES;
    segment.backgroundColor = [UIColor greenColor];
    tosegment = [[UIButton alloc]initWithFrame:CGRectMake(10, 475, 45, 45)];
    [m_scr addSubview:tosegment];
    [tosegment addTarget:self action:@selector(pushedtosegment:)forControlEvents:UIControlEventTouchUpInside];
    tosegment.backgroundColor = [UIColor colorWithRed:1.0f green:0.66f blue:1.0f alpha:1.0];*/
    
    
   
    
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; 
    // Dispose of any resources that can be recreated.
}




- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    

    
}







- (void)keyboardWasShown:(NSNotification*)aNotification
{
    
    
    CGPoint m_scrollPoint = CGPointMake(0.0,250.0);
    [m_scr setContentOffset:m_scrollPoint animated:YES];
    m_datepicker.hidden = YES;
    m_pickerdone.hidden = YES;
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [m_scr setContentOffset:CGPointZero animated:YES];
    
    
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"内容を入力してください"
                              message:@""
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles: nil];
        
        // アラートビューを表示
        [alert show];
        
    }
    else{
        if(m_subject == textField){
            [m_roomNumber becomeFirstResponder];
        }
        // [self.view endEditing:YES];
        
        else if (m_roomNumber == textField){
            [m_teacher becomeFirstResponder];
        }
        
        else if (m_teacher == textField){
            [self.view endEditing:YES];
            m_datepicker.hidden = YES;
            m_pickerdone.hidden = YES;
        }
    }

        
    
    return YES;
}


-(void)buttonAction:(UIButton*)btn{
    [btn setTitle:m_subject.text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.titleLabel.numberOfLines = 2;
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.titleEdgeInsets = UIEdgeInsetsMake(HEIGHT_BLOCK_NUM, WIDTH_BLOCK_NUM  -5 , 0,0);
    
    //[self readcontents];
    
    
    
   
    
   
    
}


-(void)showpicker:(UIButton*)button{//ここでいうbuttonは押されたボタンね。
    
    
    CGPoint m_scrollPoint = CGPointMake(0.0,200.0);
    [m_scr setContentOffset:m_scrollPoint animated:YES];
    m_datepicker.hidden = NO;
    m_pickerdone.hidden = NO;
    m_subject.hidden = YES;
    m_roomNumber.hidden = YES;
    m_teacher.hidden = YES;
    
    for(int i=1; i<HEIGHT_BLOCK_NUM;i++){
        if(button == m_button[0][i]){
           // NSLog(@"%d" , i);
            numforjudge = i;
            
            
            /*if (i == 1){
             [self save1];
             [self read];
             }*/
            
        }
        
        
    }
    
    

}

-(void)datePickerFinished:(UIButton*)button{
    
    m_subject.hidden = NO;
    
    m_roomNumber.hidden = NO;
    
    m_teacher.hidden = NO;
    
      [m_scr setContentOffset:CGPointZero animated:YES];
    
    
    
    
    /*-(void)readnotice{

    m_timer = [NSTimer scheduledTimerWithTimeInterval:20.0f target:self selector:@selector(makenotification)userInfo:nil repeats:YES];
    [m_timer fire];
       }*/
}




-(void)save0{
    NSDate *pickerdate0 = m_datepicker.date;
    
    NSUserDefaults *userdefault0 = [NSUserDefaults standardUserDefaults];
    //NSDateの保存
    [userdefault0 setObject:pickerdate0 forKey:@"date0"];
    
    
    

}

-(void)save1{
    NSDate *pickerdate1 = m_datepicker.date;
    
    NSUserDefaults *userdefault1 = [NSUserDefaults standardUserDefaults];
    //NSDateの保存
    [userdefault1 setObject:pickerdate1 forKey:@"date1"];
    

}

-(void)save2{
    NSDate *pickerdate2 = m_datepicker.date;
    
    NSUserDefaults *userdefault2 = [NSUserDefaults standardUserDefaults];
    //NSDateの保存
    [userdefault2 setObject:pickerdate2 forKey:@"date2"];
   
    

}

-(void)save3{
    NSDate *pickerdate3 = m_datepicker.date;
    
    NSUserDefaults *userdefault3 = [NSUserDefaults standardUserDefaults];
    //NSDateの保存
    [userdefault3 setObject:pickerdate3 forKey:@"date3"];
    
}

-(void)save4{
    NSDate *pickerdate4 = m_datepicker.date;
    
    NSUserDefaults *userdefault4 = [NSUserDefaults standardUserDefaults];
    //NSDateの保存
    [userdefault4 setObject:pickerdate4 forKey:@"date4"];
    }

-(void)save5{
    NSDate *pickerdate5 = m_datepicker.date;
    
    NSUserDefaults *userdefault5 = [NSUserDefaults standardUserDefaults];
    //NSDateの保存
    [userdefault5 setObject:pickerdate5 forKey:@"date5"];
   
    

}

-(void)save6{
    NSDate *pickerdate6 = m_datepicker.date;
    
    NSUserDefaults *userdefault6 = [NSUserDefaults standardUserDefaults];
    //NSDateの保存
    [userdefault6 setObject:pickerdate6 forKey:@"date6"];
   
  
}

/*-(void)read0{
    
    

}

-(void)read1{
    

}

-(void)read2{
}

-(void)read3{
   

}

-(void)read4{
    
}

-(void)read5{
    
}

-(void)read6{
   }*/



/*-(void)makenotification{
    
    
    
}*/




-(void)makenotification{
    
    
     UILocalNotification *notify = [[UILocalNotification alloc]init];
    
    
     notify.timeZone = [NSTimeZone localTimeZone];
    
     notify.alertBody = @"hoge";
    
    
    
    notify.fireDate = newdate[0];
     notify.fireDate = newdate[1];
     notify.fireDate = newdate[2];
     notify.fireDate = newdate[3];
     notify.fireDate = newdate[4];
     notify.fireDate = newdate[5];
     notify.fireDate = newdate[6];
    
    
     
    
    
    
    //[notify setFireDate:m_date[0]];
    //登録されていた時間は8:21分...だから通知が早くきた
    //If the specified value is nil or is a date in the past, the notification is delivered immediately.
    //つまりGSTの問題である可能性が高い。
    
    
    
    
    //終わった時間だから通知が早く来てた。
    

    [[UIApplication sharedApplication] scheduleLocalNotification:notify];
    
      }

-(void)readcontents{
    forcontents[0] = [NSUserDefaults standardUserDefaults];
    //NSString *strmon1;
    [forcontents[0] setObject:m_button[1][1].titleLabel forKey:@"mon1"];
    [forcontents[0] synchronize];
    
    //保存できてるかの確認で、今だけ（取得します）
    NSUserDefaults *readcontents = [NSUserDefaults standardUserDefaults];
    [readcontents objectForKey:@"mon1"];
    NSString *strmon1 = [readcontents objectForKey:@"mon1"];
    NSLog(@"%@" , strmon1);
    
    
}









@end

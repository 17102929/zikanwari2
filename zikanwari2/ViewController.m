//
//  ViewController.m
//  /
//
//  Created by Sora Mizuno on 2014/08/19.
//  Copyright (c) 2014年 Sora Mizuno. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSString *const dayoftheweek[WIDTH_BLOCK_NUM ] = {@"", @"月", @"火", @"水", @"木", @"金", @"土",};

@implementation ViewController

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    m_scr = [[UIScrollView alloc]init];
    [self.view addSubview:m_scr];

    
    m_datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0 , 408, 300, 30)];
    m_datepicker.minuteInterval = 5;
    m_datepicker.hidden =YES;
    m_datepicker.backgroundColor = [UIColor colorWithRed:1.0f green:0.9f blue:0.81f alpha:1.0];
    m_datepicker.datePickerMode = UIDatePickerModeTime;
    
    [m_scr addSubview:m_datepicker];
    pickerdone = [[UIButton alloc]initWithFrame:CGRectMake(300,408,50,50)];
    pickerdone.backgroundColor = [UIColor redColor];
    [m_scr addSubview:pickerdone];
    
    

    
    
    
    
    
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
            
            else {
                [m_button[j][i] addTarget:self action:@selector(hidepicker:) forControlEvents:UIControlEventTouchUpInside];
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
    
}


-(void)showpicker:(UIButton*)button{//ここでいうbuttonは押されたボタンね。
    m_datepicker.hidden = NO;
    m_subject.hidden = YES;
    m_roomNumber.hidden = YES;
    m_teacher.hidden = YES;
    
    for(int i=1; i<HEIGHT_BLOCK_NUM;i++){
        if(button == m_button[0][i]){
            //NSLog(@"%d" , i);
            
            
            
            
        }
        
        NSDate *m_date[i];
        
        
         m_date[i] = [[NSDate alloc]init]; //ここでEXC_BAD_ACCESS
        NSUserDefaults *m_userdefault;
        m_userdefault = [[NSUserDefaults alloc]init];
        [m_userdefault setObject:m_date[i] forKey:[NSString stringWithFormat:@"%d" , i]];
       
    
    }
    
    
    
    
    
    
    
    
}



-(void)hidepicker:(UIButton*)button{
    m_datepicker.hidden =YES;
    m_subject.hidden = NO;
    m_roomNumber.hidden = NO;
    m_teacher.hidden = NO;
    
}


/*このように。
 
 [defaults setObject:@"99" forKey:@"KEY_I"];  // をKEY_Iというキーの初期値は99
 [defaults setObject:@"99.99" forKey:@"KEY_F"];  // をKEY_Fというキーの初期値は99.99
 [defaults setObject:@"88.88" forKey:@"KEY_D"];  // をKEY_Dというキーの初期値は88.88
 [defaults setObject:@"YES" forKey:@"KEY_B"];  // をKEY_Bというキーの初期値はYES
 [defaults setObject:@"hoge" forKey:@"KEY_S"];  // をKEY_Sというキーの初期値はhoge
 [ud registerDefaults:defaults];
 */


-(void)makenotification{

    UILocalNotification *notify = [[UILocalNotification alloc]init];
    notify.alertBody = @"ok";
    
    
}





@end

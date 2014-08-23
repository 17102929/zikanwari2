//
//  ViewController.m
//  zikanwari2
//
//  Created by Sora Mizuno on 2014/08/19.
//  Copyright (c) 2014年 Sora Mizuno. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSString *const dayoftheweek[WIDTH_BLOCK_NUM] = {@"", @"月", @"火", @"水", @"木", @"金", @"土",};

@implementation ViewController

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    scr = [[UIScrollView alloc]init];
    [self.view addSubview:scr];

    
    datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0 , 408, 300, 30)];
    datepicker.minuteInterval = 5;
    datepicker.hidden =YES;
    datepicker.backgroundColor = [UIColor colorWithRed:1.0f green:0.9f blue:0.81f alpha:1.0];
    datepicker.datePickerMode = UIDatePickerModeTime;
    [scr addSubview:datepicker];

    
    
    
    
    
    //画面サイズの取得
    CGSize whole = [[UIScreen mainScreen]bounds].size;
    
    //一つのラベルのX座標の変数
    float labelwidth = whole.width/WIDTH_BLOCK_NUM;
    
    
    //一つのラベルのY座標の変数
    float labelheight = (whole.height-BOTTOM_HEIGHT)/HEIGHT_BLOCK_NUM;
    
    
    for(int i = 0; i <HEIGHT_BLOCK_NUM; i++){
        for(int j = 0; j<WIDTH_BLOCK_NUM; j++){
            label[j][i] = [[UIButton alloc]initWithFrame:CGRectMake(labelwidth*j, labelheight*i, labelwidth, labelheight )];
            [label[j][i] setTitle:@"" forState:UIControlStateNormal];
            label[j][i].backgroundColor =[UIColor colorWithRed:0.61 green:1.0f blue:1.0f alpha:1.0f];
            [scr addSubview:label[j][i]];
            
            if(! (j == 0 || i == 0) ){
                
               [label[j][i] addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
               
            }
            
        
            
            if(i == 1 && j == 0){
             
                [label[j][i] addTarget:self action:@selector(showpicker1:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            else {
                [label[j][i] addTarget:self action:@selector(hidepicker:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            
            
        
            label[j][i].layer.borderColor = [UIColor blueColor].CGColor;
            label[j][i].layer.borderWidth = 1.0f;
            label[j][i].layer.cornerRadius = 0.0f;
        
        }
    }
    
    
    
    for(int i = 0; i <WIDTH_BLOCK_NUM; i++){
        label[i][0].backgroundColor = [UIColor colorWithRed:1.0f green:0.63f blue:0.81f alpha:1.0f];
    }
    
    
    for(int i =0; i <HEIGHT_BLOCK_NUM; i++){
        //iをY座標としてiを増やすのをループさせることで縦全てを黄色に
        label[0][i].backgroundColor = [UIColor colorWithRed:0.75f green:0.51f blue:1.0f alpha:1.0f];
    }
    
    for(int i = 0; i <HEIGHT_BLOCK_NUM; i++){
        [label[0][i] setTitle:[NSString stringWithFormat:@"%d" , i] forState:UIControlStateNormal];
        

    }
    
    //iはWIDTH_BLOCK_NUM-1になる、最終的に。dayoftheweekの配列の最大数(WIDTH_BLOCK_NUM-1)まで0から1づつ足していく。
    for(int i = 0; i<WIDTH_BLOCK_NUM; i++){
        [label[i][0] setTitle:dayoftheweek[i] forState:UIControlStateNormal];
    }
    
    
    subject = [[UITextField alloc]initWithFrame:CGRectMake(164-TEXTFIELD_WIDTH/2,
                                                           484,
                                                           TEXTFIELD_WIDTH,
                                                           TEXTFIELD_HEIGHT)];
    
    roomNumber = [[UITextField alloc]initWithFrame:CGRectMake(74-TEXTFIELD_WIDTH/2,
                                                              534,
                                                              TEXTFIELD_WIDTH,
                                                              TEXTFIELD_HEIGHT)];
    
    teacher = [[UITextField alloc]initWithFrame:CGRectMake(252-TEXTFIELD_WIDTH/2,
                                                           534,
                                                           TEXTFIELD_WIDTH,
                                                           TEXTFIELD_HEIGHT)];
        

    scr.frame = self.view.bounds;
    
    
    [scr addSubview:subject];
    [scr addSubview:roomNumber];
    [scr addSubview:teacher];
    
    subject.borderStyle = UITextBorderStyleRoundedRect;
    subject.returnKeyType = UIReturnKeyNext;
    subject.placeholder = @"subject";
    subject.delegate = self;
    subject.textAlignment = NSTextAlignmentCenter;
    subject.adjustsFontSizeToFitWidth = YES;
    
   
    
    
    
    roomNumber.borderStyle = UITextBorderStyleRoundedRect;
    roomNumber.returnKeyType = UIReturnKeyNext;
    roomNumber.placeholder = @"room";
    roomNumber.delegate = self;
    roomNumber.textAlignment = NSTextAlignmentCenter;
    roomNumber.adjustsFontSizeToFitWidth = YES;
    
    
    
    teacher.borderStyle = UITextBorderStyleRoundedRect;
    teacher.returnKeyType = UIReturnKeyDone;
    teacher.placeholder = @"teacher";
    teacher.delegate = self;
    teacher.textAlignment = NSTextAlignmentCenter;
    teacher.adjustsFontSizeToFitWidth = YES;
    
    
    [self registerForKeyboardNotifications];
    
    scr.backgroundColor = [UIColor colorWithRed:0.81f green:1.0f blue:0.81f alpha:1.0f];
    
    
    /*itemsofsegment = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
    segment = [[UISegmentedControl alloc]initWithItems:itemsofsegment];
    segment.frame = CGRectMake(15, 500, 300, 30);
    [scr addSubview:segment];
    //segment.hidden = YES;
    segment.backgroundColor = [UIColor greenColor];
    tosegment = [[UIButton alloc]initWithFrame:CGRectMake(10, 475, 45, 45)];
    [scr addSubview:tosegment];
    [tosegment addTarget:self action:@selector(pushedtosegment:)forControlEvents:UIControlEventTouchUpInside];
    tosegment.backgroundColor = [UIColor colorWithRed:1.0f green:0.66f blue:1.0f alpha:1.0];*/
    
    
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    
    
    
    
    
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
    
    
    CGPoint scrollPoint = CGPointMake(0.0,250.0);
    [scr setContentOffset:scrollPoint animated:YES];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [scr setContentOffset:CGPointZero animated:YES];
    
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
        if(subject == textField){
            [roomNumber becomeFirstResponder];
        }
        // [self.view endEditing:YES];
        
        else if (roomNumber == textField){
            [teacher becomeFirstResponder];
        }
        
        else if (teacher == textField){
            [self.view endEditing:YES];
        }
    }

        
    
    return YES;
}


-(void)buttonAction:(UIButton*)button{
    [button setTitle:subject.text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.numberOfLines = 2;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.titleEdgeInsets = UIEdgeInsetsMake(HEIGHT_BLOCK_NUM, WIDTH_BLOCK_NUM-5 , 0,0);
    
}


-(void)showpicker1:(UIButton*)button{
    datepicker.hidden = NO;
    subject.hidden = YES;
    roomNumber.hidden = YES;
    teacher.hidden = YES;
    
}



-(void)hidepicker:(UIButton*)button{
    datepicker.hidden =YES;
    subject.hidden = NO;
    roomNumber.hidden = NO;
    teacher.hidden = NO;
}



@end

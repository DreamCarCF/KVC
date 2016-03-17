//
//  ViewControllerA.m
//  Super
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "ViewControllerC.h"
#import "Person.h"
@interface ViewControllerA ()

{
    UIView *_view;
    
    int _count;
    
    UITextField *_textField1;
    UITextField *_textField2;
    UITextField *_textField3;
    UITextField *_textField4;
    UIProgressView *_progress;
    UIActivityIndicatorView *_act;
    Person *_xiaoMing;
    
    UILabel *_label5;
    
}
@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.toolbarHidden=NO;
    
    // Do any additional setup after loading the view.
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(myregister)];
    self.navigationItem.leftBarButtonItem=item1;
    
    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(Enter)];
    self.navigationItem.rightBarButtonItem=item2;
   
    
    _progress=[[UIProgressView alloc]initWithFrame:CGRectMake(75, 300, 230, 30)];
    _progress.progressViewStyle=UIProgressViewStyleDefault;
    _progress.progress=0.0;
    _progress.tag=101;
    _progress.progressTintColor=[UIColor greenColor];
    _progress.hidden=YES;
    [self.view addSubview:_progress];
    
    
    
    
    _act=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _act.frame=CGRectMake(180, 350, 50, 40);
    _act.color=[UIColor redColor];
    [self.view addSubview:_act];
  


    
    
    
    
    
    _view=[[UIView alloc]initWithFrame:CGRectMake(45, 90, 300,200)
    ];
    _view.backgroundColor=[UIColor grayColor];
    _view.layer.borderWidth=4;
    _view.layer.cornerRadius=10;
    [self.view addSubview:_view];
    
    
    
    
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, 60, 30)];
    label.backgroundColor=[UIColor grayColor];
    
    label.text=@"姓名:";

//    label.layer.borderWidth=3;
//    label.layer.cornerRadius=10;
    label.textColor=[UIColor blackColor];
    label.textAlignment=NSTextAlignmentCenter;
    [_view addSubview:label];
    _textField1=[[UITextField alloc]initWithFrame:CGRectMake(75, 19, 190, 35)];
    _textField1.borderStyle=UITextBorderStyleRoundedRect;
    
    [_view addSubview:_textField1];
    
    
    
    
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 70, 60, 30)];
    label2.backgroundColor=[UIColor grayColor];
//    label2.layer.borderWidth=3;
//    label2.layer.cornerRadius=10;
    label2.text=@"密码:";
    label2.textColor=[UIColor blackColor];
    label2.textAlignment=NSTextAlignmentCenter;
    [_view addSubview:label2];
    _textField2=[[UITextField alloc]initWithFrame:CGRectMake(75, 68, 190, 35)];
    _textField2.borderStyle=UITextBorderStyleRoundedRect;
    _textField2.secureTextEntry=YES;
    [_view addSubview:_textField2];
    
    
    
    
    
    
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(10, 120, 60, 30)];
    label3.backgroundColor=[UIColor grayColor];
    //    label2.layer.borderWidth=3;
    //    label2.layer.cornerRadius=10;
    label3.text=@"验证码:";
    label3.textColor=[UIColor blackColor];
    label3.textAlignment=NSTextAlignmentCenter;
    [_view addSubview:label3];
    _textField3=[[UITextField alloc]initWithFrame:CGRectMake(75, 118, 190, 35)];
    _textField3.borderStyle=UITextBorderStyleRoundedRect;
    [_view addSubview:_textField3];
    
    
    
    
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(10, 170, 100, 30)];
    label4.backgroundColor=[UIColor grayColor];
    //    label2.layer.borderWidth=3;
    //    label2.layer.cornerRadius=10;
    label4.text=@"验证码提示:";
    label4.textColor=[UIColor blackColor];
    label4.textAlignment=NSTextAlignmentLeft;
    [_view addSubview:label4];
    
    _count =arc4random()%1000000;
    _label5 =[[UILabel alloc]initWithFrame:CGRectMake(120, 170,100, 30)];
    _label5.text=[NSString stringWithFormat:@"%d",_count];
    _label5.font=[UIFont fontWithName:@"Menlo-Italic" size:20];
    [_view addSubview:_label5];
    
    
    
    
    

    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(220, 170, 80, 30);
    button.backgroundColor=[UIColor grayColor];
    [button setTitle:@"换一个" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_view addSubview:button];

    


    
}

-(void)change
{
    [_label5 removeFromSuperview];
    
    _label5 =[[UILabel alloc]initWithFrame:CGRectMake(120, 170,100, 30)];

    
    _count=arc4random()%1000000;
    
    _label5.text=[NSString stringWithFormat:@"%d",_count];
    _label5.font=[UIFont fontWithName:@"Menlo-Italic" size:20];
    [_view addSubview:_label5];
    
    

    
}

-(void)myregister
{
    
    ViewControllerB * VB=[[ViewControllerB alloc]init];
    
    [VB setBlock:^(Person *xiaoMing) {
        _xiaoMing=xiaoMing;
        _textField1.text=xiaoMing.name;
        _textField2.text=xiaoMing.secrect;
    }];
    [self.navigationController pushViewController:VB animated:YES];

}
-(void)Enter
{
    if (![_textField1.text isEqualToString:_xiaoMing.name]|| ![_textField2.text isEqualToString:_xiaoMing.secrect]) {
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"请不要逗我好么,密码或用户名错误" message:nil delegate:nil cancelButtonTitle:@"回去输入" otherButtonTitles:nil, nil];
        [aler show];
        return;
        
    }else if(![_textField3.text isEqualToString:_label5.text])
    {
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"验证码错误" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [aler show];
        return;
    }
   
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(run:) userInfo:nil repeats:YES];
    [_act startAnimating];


}

-(void)run:(NSTimer*)timer
{
    _progress.hidden=NO;
    [_progress setProgress:_progress.progress+0.1 animated:YES];
    if (_progress.progress==1.0) {
        _progress.progress=0;
        _progress.hidden=YES;
        [_act stopAnimating];
        ViewControllerC* success=[[ViewControllerC alloc]init];
        success.people =_xiaoMing;
        [self.navigationController pushViewController:success animated:YES];
        
        if ([timer isValid]) {
            [timer invalidate];
            timer=nil;
        }
        
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

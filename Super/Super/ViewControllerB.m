//
//  ViewControllerB.m
//  Super
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "ViewControllerB.h"
#import "ViewControllerA.h"
#import "Person.h"
@interface ViewControllerB ()<UITextFieldDelegate>
{
    UITextField *_textField1;
    UITextField *_textField2;
    UILabel *_label3;
    UILabel *_label4;
    UILabel *_label6;
    UILabel *_label7;
    
}
@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"注册完成" style:UIBarButtonItemStylePlain target:self action:@selector(success)];
    self.navigationItem.rightBarButtonItem=item1;

    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 70, 60, 30)];
    label.backgroundColor=[UIColor grayColor];
    
    label.text=@"姓名:";
    
    //    label.layer.borderWidth=3;
    //    label.layer.cornerRadius=10;
    label.textColor=[UIColor blackColor];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    _textField1=[[UITextField alloc]initWithFrame:CGRectMake(75, 68, 190, 35)];
    _textField1.borderStyle=UITextBorderStyleRoundedRect;
    _textField1.delegate=self;
    [self.view addSubview:_textField1];
    
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 130, 60, 30)];
    label2.backgroundColor=[UIColor grayColor];
    //    label2.layer.borderWidth=3;
    //    label2.layer.cornerRadius=10;
    label2.text=@"密码:";
    label2.textColor=[UIColor blackColor];
    label2.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label2];
    _textField2=[[UITextField alloc]initWithFrame:CGRectMake(75, 128, 190, 35)];
    _textField2.borderStyle=UITextBorderStyleRoundedRect;
    _textField2.secureTextEntry=YES;
    _textField2.delegate=self;
    [self.view addSubview:_textField2];
    
    
    
    UILabel *label5=[[UILabel alloc]initWithFrame:CGRectMake(10, 173, 60, 30)];
    label5.backgroundColor=[UIColor grayColor];
    //    label2.layer.borderWidth=3;
    //    label2.layer.cornerRadius=10;
    label5.text=@"学历：";
    label5.textColor=[UIColor blackColor];
    label5.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label5];
    
    
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:@[@"专科",@"本科",@"硕士"]];
    
    seg.frame=CGRectMake(160, 175, 190, 35);
    [self.view addSubview:seg];
    [seg addTarget:self action:@selector(seg:) forControlEvents:UIControlEventValueChanged];
    
    

    UISwitch *myswitch=[[UISwitch alloc]initWithFrame:CGRectMake(140, 220, 50, 40)];
    [self.view addSubview:myswitch];
    
    [myswitch addTarget:self action:@selector(myswitch:) forControlEvents:UIControlEventValueChanged];
    
    
    
    
    UISlider *slider=[[UISlider alloc]initWithFrame:CGRectMake(75, 265, 190, 30)];
    [self.view addSubview:slider];
    slider.minimumValue=15.0;
    slider.maximumValue=60.0;
    
    [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
    
    
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
    
    
}

-(void)seg:(UISegmentedControl*)seg
{
    [_label7 removeFromSuperview];
    _label7=[[UILabel alloc]initWithFrame:CGRectMake(80, 173, 50, 35)];
    _label7.backgroundColor=[UIColor whiteColor];
    
    _label7.text=[seg titleForSegmentAtIndex:seg.selectedSegmentIndex];
    _label7.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:_label7];
    
    
    Person*p=[[Person alloc]init];
    p.education=_label7.text;
    
    
}

-(void)slider:(UISlider *)slider
{
    
    [_label3 removeFromSuperview];
    [_label4 removeFromSuperview];
    
    _label3=[[UILabel alloc]initWithFrame:CGRectMake(140, 295, 50, 30)];
    _label3.text=[NSString stringWithFormat:@"%.0f岁",slider.value];
    _label3.textColor=[UIColor blueColor];
    [self.view addSubview:_label3];
    _label4=[[UILabel alloc]initWithFrame:CGRectMake(160, 295, 50, 30)];
    _label4.backgroundColor=[UIColor cyanColor];
    _label4.text=@"岁";
    _label4.textColor= [UIColor blueColor];
    _label4.textAlignment=NSTextAlignmentLeft;
    
    [self.view addSubview:_label4];
    
    Person*p=[[Person alloc]init];
    p.age=_label3.text;
    
    
}
-(void)myswitch:(UISwitch *)myswitch
{
    
    if (myswitch.isOn) {
        [_label6 removeFromSuperview];
        _label6=[[UILabel alloc]initWithFrame:CGRectMake(96, 220, 40, 40)];
        _label6.text=@"男";
        _label6.textAlignment=NSTextAlignmentRight;
        
        [self.view addSubview:_label6];
        
    }else{
        
        [_label6 removeFromSuperview];
        _label6=[[UILabel alloc]initWithFrame:CGRectMake(200, 220, 40, 40)];
        _label6.text=@"女";
        [self.view addSubview:_label6];
        
        
    }
    
    Person *p =[[Person alloc]init];
    p.sex=_label6.text;
    
}
-(void)success
{
    if (_textField1.text.length==0||_textField2.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请不要逗我" message:nil delegate:nil cancelButtonTitle:@"点击回去输入" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    Person *xiaoMing=[[Person alloc]init];
    xiaoMing.name=_textField1.text;
    xiaoMing.secrect=_textField2.text;
    xiaoMing.education=_label7.text;
    xiaoMing.sex=_label6.text;
    xiaoMing.age=_label3.text;
    
    if (_block) {
        _block(xiaoMing);
    }
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
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

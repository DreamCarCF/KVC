//
//  UISwitchVC.m
//  UsualControl
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "UISwitchVC.h"

@interface UISwitchVC ()

@end

@implementation UISwitchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UISwitch *myswitch=[[UISwitch alloc]initWithFrame:CGRectMake(50, 84, 50,30 )];   //开关的宽和高是系统定好的；
    
    [self.view addSubview:myswitch];
    
    myswitch.onTintColor=[UIColor blueColor]; //状态栏的颜色
    myswitch.thumbTintColor=[UIColor blackColor]; // 开关点的颜色
    myswitch.on=YES;  //默认是开还是关
    //添加事件
    [myswitch addTarget:self action:@selector(myswitch:) forControlEvents:UIControlEventValueChanged];
    
    
}

-(void)myswitch:(UISwitch *)myswitch
{
    if (myswitch.isOn) {
        
    
    NSLog(@"开关打开");
    }else
    {
        NSLog(@"开关关闭");
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

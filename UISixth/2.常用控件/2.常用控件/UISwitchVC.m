//
//  UISwitchVC.m
//  2.常用控件
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "UISwitchVC.h"

@interface UISwitchVC ()

@end

@implementation UISwitchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //开关视图
    //宽高是系统固定的.
    UISwitch *mySwitch = [[UISwitch alloc]initWithFrame:CGRectMake(50, 84, 100, 70)];
    [self.view addSubview:mySwitch];
    
    //绿色高亮代表打开
    
    //打开高亮变为红色
    mySwitch.onTintColor = [UIColor redColor];
    
    //开关点的颜色
    mySwitch.thumbTintColor = [UIColor blackColor];
    
    //设置开关状态
    mySwitch.on = YES;
    
    //添加事件
    [mySwitch addTarget:self action:@selector(swith:) forControlEvents:UIControlEventValueChanged];
}
- (void)swith:(UISwitch *)mySwitch
{
    if (mySwitch.isOn)
    {
        NSLog(@"开关被打开");
    }else
    {
        NSLog(@"开关被关闭");
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

//
//  UIAlertViewVC.m
//  2.常用控件
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "UIAlertViewVC.h"

@interface UIAlertViewVC ()

@end

@implementation UIAlertViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}

- (void)tap
{
    //提示框
    //@"买活",@"买活送",@"读秒",@"取消"
    UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你已经挂掉了" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"买活",@"买活送",nil];
    
    //让提示框显示
    [aler show];
    
    //提示框的样式和按钮个数有关
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIAlertViewDelegate
//点击了提示框其中一个按钮
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex==%ld",buttonIndex);
    NSLog(@"标题==%@",[alertView buttonTitleAtIndex:buttonIndex]);
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

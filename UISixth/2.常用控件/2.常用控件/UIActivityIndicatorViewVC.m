//
//  UIActivityIndicatorViewVC.m
//  2.常用控件
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "UIActivityIndicatorViewVC.h"

@interface UIActivityIndicatorViewVC ()

@end

@implementation UIActivityIndicatorViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    //转圈动画
    //UIActivityIndicatorViewStyleWhiteLarge,  大白色
    //UIActivityIndicatorViewStyleWhite,       白色
    //UIActivityIndicatorViewStyleGray,        灰色
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    act.frame = CGRectMake(50, 84, 80, 80);
    
    [self.view addSubview:act];
    
    //默认隐藏,需要开始动画才能显示
    [act startAnimating];
    
    //停止转动
    [act stopAnimating];
    
    //停止转动后,不隐藏
    act.hidesWhenStopped = NO;
    
    //设置转圈颜色
    act.color = [UIColor redColor];
    
    //获取转动状态
    NSLog(@"act的状态是%d",act.isAnimating);
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

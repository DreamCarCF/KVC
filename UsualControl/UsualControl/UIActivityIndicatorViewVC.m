//
//  UIActivityIndicatorViewVC.m
//  UsualControl
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "UIActivityIndicatorViewVC.h"

@interface UIActivityIndicatorViewVC ()

@end

@implementation UIActivityIndicatorViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor blackColor];
    //转圈动画（加载）；
    
    UIActivityIndicatorView *activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    activity.frame=CGRectMake(50, 84, 80,80);
    
    [self.view addSubview:activity];
    //默认隐藏 需要开始动画才能显示
    [activity startAnimating];
    
    //停止转动
//    [activity stopAnimating];
    //停止转·动后·不隐藏·
    activity.hidesWhenStopped=NO;
    //设置转圈颜色·
    activity.color=[UIColor redColor];
    //获取转动状态
    NSLog(@"act的状态是：%d",activity.isAnimating);
    

    
    
    
    
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

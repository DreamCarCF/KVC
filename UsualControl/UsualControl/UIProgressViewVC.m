//
//  UIProgressViewVC.m
//  UsualControl
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "UIProgressViewVC.h"

@interface UIProgressViewVC ()

@end

@implementation UIProgressViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    //进度条
    UIProgressView *pro=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    pro.frame=CGRectMake(50, 84, 300, 30);
    pro.progress=0.5;//进度范围只能是       0.0  ---  1.0  无法修改；
    pro.trackTintColor=[UIColor redColor];
    pro.progressTintColor=[UIColor greenColor];
    
   
    [self.view addSubview:pro];
    
    
    
    
    
    
    
    
    
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

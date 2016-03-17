//
//  UIProgressViewVC.m
//  2.常用控件
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "UIProgressViewVC.h"

@interface UIProgressViewVC ()

@end

@implementation UIProgressViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //进度条
    UIProgressView *progress = [[UIProgressView alloc]initWithFrame:CGRectMake(50, 84, 300, 30)];
    
    //类型
    //UIProgressViewStyleDefault,     正常
    //UIProgressViewStyleBar,         在toolBar上使用
    progress.progressViewStyle = UIProgressViewStyleDefault;
    
    [self.view addSubview:progress];
    
    //设置进度
    //0.0 - 1.0
    //并且范围是无法修改的
    progress.progress = 0.0;
    
    //进度未走完的颜色
    progress.trackTintColor = [UIColor redColor];
    
    //进度已经走了的颜色
    progress.progressTintColor = [UIColor greenColor];
    
    progress.tag = 100;
    
    //使用定时器,让进度条走起来
    //使用定时器每隔1秒触发一次方法,方法里每次将进度条加0.1
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(progressRun) userInfo:nil repeats:YES];
}

-(void)progressRun
{
    UIProgressView *progress = (UIProgressView *)[self.view viewWithTag:100];
    
    //确保不超出边界
    if (progress.progress >= 0.9)
    {
        return;
    }
    //修改进度
    [progress setProgress:progress.progress+0.1 animated:YES];
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

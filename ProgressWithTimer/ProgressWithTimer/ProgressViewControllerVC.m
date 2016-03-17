//
//  ProgressViewControllerVC.m
//  ProgressWithTimer
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "ProgressViewControllerVC.h"

@interface ProgressViewControllerVC ()

@end

@implementation ProgressViewControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIProgressView *prog=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    prog.frame=CGRectMake(50, 84,200, 30);
    [self.view addSubview:prog];
    prog.progress=0.0;
    prog.tag=100;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(progressRun) userInfo:nil repeats:YES];
    
    
}
-(void)progressRun
{
   
    
    UIProgressView *prog=(UIProgressView*)[self.view viewWithTag:100];
    
    if (prog.progress>=1.0) {
        return;
    }

    
    [prog setProgress:prog.progress+0.1 animated:YES];
    
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

//
//  ViewController.m
//  3.UITouch
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//触摸开始
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //取到触摸点
    UITouch *touch = [touches anyObject];
    
    //拿到坐标
    CGPoint point = [touch locationInView:self.view];
    
    //NSStringFromCGPoint  将point结构体转为字符串打印出来
    NSLog(@"touchesBegan--point==%@",NSStringFromCGPoint(point));
}

//触摸被打断.例如来了一个电话
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled");
}

//触摸结束
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"touchesEnded--point==%@",NSStringFromCGPoint(point));
}

//在屏幕上移动
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"touchesMoved---point==%@",NSStringFromCGPoint(point));
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

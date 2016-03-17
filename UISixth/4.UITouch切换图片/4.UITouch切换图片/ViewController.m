//
//  ViewController.m
//  4.UITouch切换图片
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *_imgView;
    CGPoint _beganPoint; //触摸开始坐标点
    CGPoint _endPoint;   //触摸结束坐标点
    NSInteger _count;    //计数
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    _imgView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:_imgView];
    
    _count = 1;
}
//触摸开始
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    //将触摸开始的坐标点给成员变量
    _beganPoint = point;
}
//触摸结束
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    //将触摸结束的点给成员变量
    _endPoint = point;
    
    //滑动结束,比较
    [self compare];
}

- (void)compare
{
    if (_beganPoint.x > _endPoint.x)
    {
        //从右往左滑,下一张
        _count ++;
        if (_count >4)
        {
            _count = 1;
        }
        
        _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",_count]];
    }
    
    if (_beganPoint.x < _endPoint.x)
    {
        //从左往右滑,上一张
        _count --;
        if (_count <1)
        {
            _count = 4;
        }
        _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",_count]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

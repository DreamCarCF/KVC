//
//  ViewController.m
//  UItouchWIthPicture
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *_imageView;
    CGPoint _beganPiont;    //触摸开始坐标点
    
    CGPoint _endPiont;    //触摸结束坐标点
    
    NSInteger _count;       //计数；
    
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageView =[[UIImageView alloc]initWithFrame:self.view.bounds];
    _imageView.image=[UIImage imageNamed:@"psb0.jpg"];
    [self.view addSubview:_imageView];
    _count=1;
    
    
    
    
}


//触摸开始

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    //将触摸开始的坐标点给成员变量
    _beganPiont = point;
    
}

//触摸结束

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
   //将触摸结束的坐标点给成员变量；
    
    
    _endPiont= point;

    
    //滑动结束比较
    [self compare];
    
}
-(void)compare
{
    
    if (_endPiont.x<_beganPiont.x) {
        //从右往左滑；
        _count++;
      
        if (_count>15) {
            _count=1;
        }
        _imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"psb%ld.jpg",_count]];
        
    }
    if (_beganPiont.x<_endPiont.x) {
        //从左往右滑
        _count--;
        if (_count<1) {
            _count=15;
        }
    
        _imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"psb%ld.jpg",_count]];
        
    }
    
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

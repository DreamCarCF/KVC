//
//  UISegmentedControlVC.m
//  UsualControl
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "UISegmentedControlVC.h"

@interface UISegmentedControlVC ()

@end

@implementation UISegmentedControlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:@[@"小学",@"中学",@"大学"]];
    seg.frame=CGRectMake(50, 84, 300, 30);
    [self.view addSubview:seg];
    //修改下标为1的段，为高中；
    [seg setTitle:@"高中" forSegmentAtIndex:1];
    //修改段为图片
    //这张图片会变成系统风格；
    [seg setImage:[UIImage imageNamed:@"refresh_30"] forSegmentAtIndex:2];
    //插入一个段
    [seg insertSegmentWithTitle:@"小学生" atIndex:1 animated:YES];
    //插入一个图片
    [seg insertSegmentWithImage:[UIImage imageNamed:@"1"] atIndex:2 animated:YES];
    //移除一个段
    [seg removeSegmentAtIndex:0 animated:YES];
    //移除全部的段；
//    [seg removeAllSegments];
    //设置默认选中项；
    seg.selectedSegmentIndex=1;

    
    //取到当前段的标题·
    NSLog(@"index0==%@",[seg titleForSegmentAtIndex:0]);
    
    //添加事件
    
    //除了UIbutton，所有控件的event都是UIControlEventValueChanged
    [seg addTarget:self action:@selector(seleted:) forControlEvents:UIControlEventValueChanged];
    
}
-(void)seleted:(UISegmentedControl *)seg
{
    NSLog(@"seg第%ld项被选中",seg.selectedSegmentIndex);
    NSLog(@"title==%@",[seg titleForSegmentAtIndex:seg.selectedSegmentIndex]);
    
    
    
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

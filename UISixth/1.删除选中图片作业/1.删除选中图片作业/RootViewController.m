//
//  RootViewController.m
//  1.删除选中图片作业
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "RootViewController.h"
#import "CutomView.h"
@interface RootViewController ()
{
    NSArray *_imgArray;
    UIView *_bgView;    //用来放置imgView
    BOOL _isEditing;
    CGRect _preRect;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button  =[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 100, 30);
    [button setTitle:@"点击排版" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(layout) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    
    _imgArray = @[@"psb0.jpg",@"psb1.jpg",@"psb2.jpg",@"psb3.jpg",@"psb4.jpg",@"psb5.jpg",@"psb6.jpg",@"psb7.jpg",@"psb8.jpg",@"psb9.jpg",@"psb10.jpg",@"psb11.jpg",@"psb12.jpg",@"psb13.jpg",@"psb14.jpg",@"psb15.jpg"];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
    deleteButton.frame = CGRectMake(0,self.view.frame.size.height-44 , self.view.frame.size.width, 44);
    [deleteButton setTitle:@"点击删除" forState:0];
    [deleteButton setTitleColor:[UIColor whiteColor] forState:0];
    deleteButton.backgroundColor = [UIColor blackColor];
    [deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-44-64)];
    [self.view addSubview:_bgView];
}

- (void)layout
{
    //先把_bgView上所有的视图移除
    for (UIImageView *v in _bgView.subviews)
    {
        [v removeFromSuperview];
    }
    
    //取随机数
    NSInteger number = arc4random()%16;
    //再重新添加
    for (int i =0; i<4; i++)
    {
        for (int j= 0; j<4; j++)
        {
            if (i*4+j >= number)
            {
                return;
            }
            
            CutomView *customView = [[CutomView alloc]initWithFrame:CGRectMake(93.75*j, 20+93.75*i, 90, 90)];
            customView.image = [UIImage imageNamed:_imgArray[i*4+j]];
            customView.userInteractionEnabled = YES;
            [_bgView addSubview:customView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
            [customView addGestureRecognizer:tap];
        }
    }
}
- (void)tap:(UITapGestureRecognizer *)tap
{
    if (_isEditing)
    {
        //编辑状态,做选中和反选
        CutomView *view = (CutomView *)tap.view;
        view.isSeleted = !view.isSeleted;
        
    }else
    {
        //放大
        //在点击视图这里创建另一个视图,和点击视图一样大
        CutomView *view =(CutomView *) tap.view;
        UIImageView *newImgView = [[UIImageView alloc]init];
        newImgView.frame = view.frame;
        newImgView.image = view.image;
        newImgView.userInteractionEnabled = YES;
        //将新的UIImageView加到window之上
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:newImgView];
        
        [UIView animateWithDuration:0.5 animations:^{
            newImgView.frame = CGRectMake(0, 0, 375, 667);
        }];
        
        //记住原来的位置,用来后面进行缩小
        _preRect = tap.view.frame;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reset:)];
        [newImgView addGestureRecognizer:tap];
        
        
    }
}
- (void)reset:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.5 animations:^{
        tap.view.frame = _preRect;
    } completion:^(BOOL finished) {
        [tap.view removeFromSuperview];
    }];
}

- (void)edit:(UIBarButtonItem *)item
{
    _isEditing = !_isEditing;
    if (_isEditing) {
        item.title = @"Done";
    }else
    {
        item.title = @"Edit";
        
        //取消编辑,移除所有选中状态
        for (CutomView *view in _bgView.subviews)
        {
            view.isSeleted = NO;
        }
    }
}

- (void)delete
{
    //遍历数组,如果状态是选中,则移除
    for (CutomView *view in _bgView.subviews) {
        if (view.isSeleted)
        {
            [view removeFromSuperview];
        }
    }
    
    //重新布局
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++)
        {
            //如果大于数组中的个数,则return
            if (i*4+j >= _bgView.subviews.count)
            {
                return;
            }
            
            CutomView *view = _bgView.subviews[i*4+j];
            
            [UIView animateWithDuration:0.5 animations:^{
                    view.frame = CGRectMake(93.75*j, 20+93.75*i, 90, 90);
            }];
        }
    }
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

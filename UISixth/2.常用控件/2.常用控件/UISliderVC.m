//
//  UISliderVC.m
//  2.常用控件
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "UISliderVC.h"

@interface UISliderVC ()

@end

@implementation UISliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //滑块
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 84, 300, 30)];
    [self.view addSubview:slider];
    
    //设置最小值
    slider.minimumValue = 10.0;
    
    //设置最大值
    slider.maximumValue = 200.0;
    
    //设置当前值
    //滑块的位置,会根据值做对应移动
    slider.value = 100;
    
    //拖动滑块,可以改变value值
    
    //定制外观
    //右侧条颜色
    slider.maximumTrackTintColor = [UIColor redColor];
    
    //左侧条颜色
    slider.minimumTrackTintColor = [UIColor greenColor];
    
    //滑块颜色
    slider.thumbTintColor = [UIColor purpleColor];
    
    
    //添加事件
    [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
}

- (void)slider:(UISlider *)slider
{
    //不断滑动滑块,会多次触发这个方法
    //slider.value 取得当前值
    NSLog(@"value==%f",slider.value);
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

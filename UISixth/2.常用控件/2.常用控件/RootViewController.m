//
//  RootViewController.m
//  2.常用控件
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "RootViewController.h"
#import "UISegmentedControlVC.h"
#import "UISliderVC.h"
#import "UISwitchVC.h"
#import "UIActivityIndicatorViewVC.h"
#import "UIProgressViewVC.h"
#import "UIActionSheetVC.h"
#import "UIAlertViewVC.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *array = @[@"UISegmentedControl",@"UISlider",@"UISwitch",@"UIActivityIndicatorView",@"UIProgressView",@"UIActionSheet",@"UIAlertView"];
    
    for (int i=0; i<array.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(50, 84+40*i, 200, 30);
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blackColor];
        [self.view addSubview:button];
        
        [button addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+i;
    }
    
}
- (void)push:(UIButton *)button
{
    switch (button.tag) {
        case 100:
        {
            UISegmentedControlVC *vc = [[UISegmentedControlVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 101:
        {
            UISliderVC *vc = [[UISliderVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 102:
        {
            UISwitchVC *vc = [[UISwitchVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 103:
        {
            UIActivityIndicatorViewVC *vc = [[UIActivityIndicatorViewVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 104:
        {
            UIProgressViewVC *vc = [[UIProgressViewVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 105:
        {
            UIActionSheetVC *vc = [[UIActionSheetVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 106:
        {
            UIAlertViewVC *vc = [[UIAlertViewVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
            
        default:
            break;
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

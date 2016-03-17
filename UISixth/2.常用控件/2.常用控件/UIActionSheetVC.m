//
//  UIActionSheetVC.m
//  2.常用控件
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "UIActionSheetVC.h"

@interface UIActionSheetVC ()

@end

@implementation UIActionSheetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //点击self.view,弹出UIActionSheet
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    
}
- (void)tap
{
    //从底部弹出的一个提示框
    
    //initWithTitle            提示的标题
    //delegate                 代理(点击了哪个按钮,需要通过代理得到)
    //cancelButtonTitle        取消按钮文字
    //destructiveButtonTitle   高亮按钮文字
    //otherButtonTitles        其他按钮数组
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"中国" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"香港" otherButtonTitles:@"台湾",@"广东",@"湖南",nil];
    
    //让sheet出现
    [sheet showInView: self.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UIActionSheetDelegate
//点击了其中一个按钮
//buttonIndex  就是按钮的下标
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex==%ld",buttonIndex);
    
    //取到点击按钮的标题
    NSString *string = [actionSheet buttonTitleAtIndex:buttonIndex];
    NSLog(@"string==%@",string);
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

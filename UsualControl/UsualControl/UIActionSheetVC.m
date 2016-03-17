//
//  UIActionSheetVC.m
//  UsualControl
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "UIActionSheetVC.h"

@interface UIActionSheetVC ()

@end

@implementation UIActionSheetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
//    UIActionSheet *AC=[[UIActionSheet alloc]initWithTitle:@"中国" delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:@"香港" otherButtonTitles:@"台湾",@"广东",@"湖南", nil];

    
    //点击self.view,弹出UIActionSheet；
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];

}
-(void)tap
{
    
    UIActionSheet *AC=[[UIActionSheet alloc]initWithTitle:@"中国" delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:@"香港" otherButtonTitles:@"台湾",@"广东",@"湖南", nil];
    
    //让sheet出现
    [AC showInView: self.view];
    
    
    
    
    
}
#pragma mark -UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    NSLog(@"buttonIndex==%ld",buttonIndex);
    //取到点击按钮的标题
    NSString *str=[actionSheet buttonTitleAtIndex:buttonIndex];
    NSLog(@"str==%@",str);
    
    
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

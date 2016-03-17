//
//  ViewController.m
//  SupperResgister
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerB.h"
#import "ViewControllerC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:self];
    
    nav.navigationController.navigationBar.barTintColor=[UIColor redColor];
    
   
    nav.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    nav.navigationController.navigationBar.translucent=NO;
    [nav.navigationController setNavigationBarHidden:YES];
    [self.navigationController.navigationBar addSubview:nav];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

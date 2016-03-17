//
//  ViewController.m
//  5.KVCDemo
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.一般用法,通过点语法访问
    Person *xiaoMing = [[Person alloc]init];
    //setter
    xiaoMing.name = @"XiaoMing";
    //getter
    NSString *name = xiaoMing.name;
    
    NSLog(@"name==%@",name);
    
    //2.通过KVC来访问(键值对)
    Person *Obama = [[Person alloc]init];
    
    //通过KVC来设置值
    [Obama setValue:@"Obama" forKey:@"name"];
    
    //通过KVC来读取
    NSString *name2 = [Obama valueForKey:@"name"];
    
    NSLog(@"name2==%@",name2);
    
    
    //3.通过KVC访问成员变量(未暴露接口的变量)
    Person *LaoWang = [[Person alloc]init];
    
    //设置
    //key一旦写错,就会崩溃
    [LaoWang setValue:@"10" forKey:@"_money"];
    
    //读取
    NSString *money = [LaoWang valueForKey:@"_money"];
    
    NSLog(@"money==%@",money);
    
    //- (void)setValue:(id)value forKey:(NSString *)key;
    //必须设置一个对象进去.不能给int float
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

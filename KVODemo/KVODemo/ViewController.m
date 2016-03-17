//
//  ViewController.m
//  KVODemo
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()
{
    Person *_xiaoMing;
    UILabel *_label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _label=[[UILabel alloc]initWithFrame:CGRectMake(50, 40, 200,30)];
    _label.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:_label];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(50, 100, 80, 30);
    [button setTitle:@"Change" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    _xiaoMing = [[Person alloc]init];
    //添加一个观察者，来观察——xiaoMing的money属性的变化，每一次变化都会走回调；
    [_xiaoMing addObserver:self forKeyPath:@"_money" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                                                                                            context:nil];
    
    
    
}
//KVO的回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    if ([keyPath isEqualToString:@"_money"]) {
        
        
        _label.text=[_xiaoMing valueForKey:@"_money"];
        
        
        
                     }
    
    
}
-(void)change
{

    
    NSInteger number=arc4random()%1000000;
    
    //在这里修改_money的值
    [_xiaoMing setValue:[NSString stringWithFormat:@"%ld",number] forKey:@"_money"];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

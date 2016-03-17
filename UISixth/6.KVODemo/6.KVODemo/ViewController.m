//
//  ViewController.m
//  6.KVODemo
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
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
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(50, 40, 200, 30)];
    _label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 100, 80, 30);
    [button setTitle:@"change" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _xiaoMing = [[Person alloc]init];
    
    //添加一个观察者,来观察_xiaoMing的money属性的变化.每一次变化都会走回调
    //addObserver  将谁作为观察者
    //forKeyPath   观察哪个成员
    //options      选项        NEW 新值,  old旧值
    //context      nil
    
    [_xiaoMing addObserver:self forKeyPath:@"_money" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

//KVO的回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"_money"])
    {
        //每次修改money值得时候,会触发这个回调
        //将money值显示在label之上
        _label.text = [_xiaoMing valueForKey:@"_money"];
    }
}

- (void)change
{
    NSInteger number = arc4random()%100000;
    
    //在这里修改_money的值.这里立刻会触发KVO回调
    [_xiaoMing setValue:[NSString stringWithFormat:@"%ld",number] forKey:@"_money"];
    
    //KVO回调走完之后,才会执行下面的代码
    NSLog(@"111");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

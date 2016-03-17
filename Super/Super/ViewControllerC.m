//
//  ViewControllerC.m
//  Super
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import "ViewControllerC.h"

@interface ViewControllerC ()

@end

@implementation ViewControllerC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *arry=@[@"用户名：",@"密  码：",@"学  历：",@"性  别：",@"年  龄："];
    for (int i=0; i<arry.count; i++) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 84+i*40, 80, 30)];
        label.text=arry[i];
        [self.view addSubview:label];
        
    }
    for (int i=0; i<arry.count; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(90, 84+i*40, 80, 30)];
        switch (i) {
            case 0:
                label.text=_people.name;
                break;
            case 1:
                label.text=_people.secrect;
                break;
            case 2:
                label.text=_people.education;
                break;
            case 3:
                label.text=_people.sex;
                break;
            case 4:
                label.text=_people.age;
                break;

            default:
                break;
        }
    
        [self.view addSubview:label];
    
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

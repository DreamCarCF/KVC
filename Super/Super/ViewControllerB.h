//
//  ViewControllerB.h
//  Super
//
//  Created by 曹丰 on 15/8/3.
//  Copyright (c) 2015年 CaoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@interface ViewControllerB : UIViewController
@property(nonatomic,copy)void (^block)(Person *xiaoMing);
@end

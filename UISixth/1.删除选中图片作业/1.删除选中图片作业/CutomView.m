//
//  CutomView.m
//  1.删除选中图片作业
//
//  Created by liuyuecheng on 15/8/3.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "CutomView.h"

@implementation CutomView
{
    UIImageView *_imgView;
}
@synthesize isSeleted = _isSeleted;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-30, self.frame.size.height-28, 30, 28)];
        _imgView.image = [UIImage imageNamed:@"1"];
        _imgView.hidden = YES;
        [self addSubview:_imgView];
    }
    return self;
}


- (void)setIsSeleted:(BOOL)isSeleted
{
    _isSeleted = isSeleted;
    if (_isSeleted)
    {
        _imgView.hidden = NO;
    }else
    {
        _imgView.hidden = YES;
    }
}
- (BOOL)isSeleted
{
    return !_imgView.hidden;
}
@end

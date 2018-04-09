//
//  btnView.m
//  MyCalculator
//
//  Created by joyzh on 14/12/13.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "btnView.h"

@implementation btnView

//在按钮类中覆盖这个方法
-(void)awakeFromNib
{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:12];
    [self.layer setBorderWidth:0];
    [super awakeFromNib];
}

@end

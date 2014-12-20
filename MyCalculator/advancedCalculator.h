//
//  advancedCalculator.h
//  MyCalculator
//
//  Created by joyzh on 14/12/15.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "Calculate.h"
#import <math.h>

@interface advancedCalculator : Calculate

@property(nonatomic, strong)NSMutableString *screen;//保存屏幕上显示的内容，在场景切换时可传递

//高级计算
-(NSString *)sqrt:(NSString *)content;
-(NSString *)abs:(NSString *)content;
-(NSString *)log2:(NSString *)content;
-(NSString *)log10:(NSString *)content;
-(NSString *)loge:(NSString *)content;
-(NSString *)factorial:(NSString *)content;
-(NSString *)percent:(NSString *)content;
-(NSString *)pow2:(NSString *)content;
-(NSString *)pow3:(NSString *)content;


//三角函数计算
-(NSString *)sin:(NSString *)content;
-(NSString *)cos:(NSString *)content;
-(NSString *)tan:(NSString *)content;
-(NSString *)arcsin:(NSString *)content;
-(NSString *)arccos:(NSString *)content;
-(NSString *)arctan:(NSString *)content;
-(NSString *)sinh:(NSString *)content;
-(NSString *)cosh:(NSString *)content;
-(NSString *)tanh:(NSString *)content;
-(NSString *)arcsinh:(NSString *)content;
-(NSString *)arccosh:(NSString *)content;

@end

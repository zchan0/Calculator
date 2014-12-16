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

-(NSString *)sqrt:(NSString *)content;
-(NSString *)abs:(NSString *)content;
-(NSString *)log2:(NSString *)content;
-(NSString *)log10:(NSString *)content;
-(NSString *)loge:(NSString *)content;
-(NSString *)factorial:(NSString *)content;
-(NSString *)percent:(NSString *)content;
-(NSString *)pow2:(NSString *)content;
-(NSString *)pow3:(NSString *)content;

@end

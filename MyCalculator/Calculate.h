//
//  Calculate.h
//  MyCalculator
//
//  Created by joyzh on 14/12/7.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

@interface Calculate : NSObject

+(NSArray *)validOperator;
+(NSDictionary *)inStackPriority;
+(NSDictionary *)outStackPriority;


//判断是操作符还是操作数
-(BOOL)isOperator:(NSString *) ch;

-(NSString *)comparePriority:(NSString *)inOptr outOptr:(NSString *)outOptr;

-(double) calculate:(double)opnd1 opnd2:(double)opnd2 optr:(NSString *)optr;

-(NSMutableArray *)clearWhitespace:(NSMutableArray *) inputArray;

-(NSString *)ExpressionCalculate:(NSString *)inputString;

@end

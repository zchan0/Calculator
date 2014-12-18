//
//  Calculate+Health.m
//  MyCalculator
//
//  Created by joyzh on 14/12/17.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "Calculate+Health.h"

@implementation Calculate (Health)

-(NSString *)computeHealthBMI:(NSString *)height weight:(NSString *)weight
{
    NSMutableString *expression;
    expression = [NSMutableString stringWithString:weight];
    [expression appendString:@"/(("];
    [expression appendString:height];
    [expression appendString:@"/100.0)"];
    [expression appendString:@"*("];
    [expression appendString:height];
    [expression appendString:@"/100.0))="];
    self.input = expression;
    NSLog(@"health compute, input is %@", self.input);
    NSLog(@"health compute, expression is %@", expression);
    
    return [NSString stringWithFormat:@"%.2f", [[self ExpressionCalculate:self.input] floatValue]];
}


@end

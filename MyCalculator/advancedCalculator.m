//
//  advancedCalculator.m
//  MyCalculator
//
//  Created by joyzh on 14/12/15.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//
//

#import "advancedCalculator.h"

@implementation advancedCalculator

-(NSString *)abs:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"abs: input error!");
        return @"Error input!";
    }
    
    double d = [content doubleValue];
    double result = fabs(d);
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithDouble:result];
    return [num stringValue];
    
}

-(NSString *)sqrt:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"sqrt: input error!");
        return @"Error input!";
    }
    
    double d = [content doubleValue];
    double result = sqrt(d);
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithDouble:result];
    return [num stringValue];
}

-(NSString *)log2:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"log2: input error!");
        return @"Error input!";
    }
    
    double d = [content doubleValue];
    double result = log2(d);
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithDouble:result];
    return [num stringValue];
}

-(NSString *)log10:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"log10: input error!");
        return @"Error input!";
    }
    
    double d = [content doubleValue];
    double result = log10(d);
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithDouble:result];
    return [num stringValue];
}

-(NSString *)loge:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"loge: input error!");
        return @"Error input!";
    }
    
    double d = [content doubleValue];
    double result = log(d);
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithDouble:result];
    return [num stringValue];
}

-(NSString *)factorial:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"factorial invalid input");
        return @"Error input!";
    }
    
    //整数阶乘运算
    if (![self isInteger:content]) {
        NSLog(@"非整数，不能进行阶乘");
        return @"Cannot do factorial!";
    }
    
    int i = [content intValue];
    //NSLog(@"i = %d", i);
    int result = 1;
    for (int j = i; j > 0 ; j--) {
        result *= j;
    }
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithInt:result];
    return [num stringValue];

}

-(NSString *)percent:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"percent invalid input");
        return @"Error input!";
    }
    
    double d = [content doubleValue];
    double result = d / 100;
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithDouble:result];
    return [num stringValue];
}

-(NSString *)pow2:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"pow2 invalid input");
        return @"Error input!";
    }
    
    double d = [content doubleValue];
    double result = pow(d, 2);
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithDouble:result];
    return [num stringValue];
}

-(NSString *)pow3:(NSString *)content
{
    //只有对数字才能进行运算
    if (![self isNumberic:content]) {
        NSLog(@"pow3 invalid input");
        return @"Error input!";
    }
    
    double d = [content doubleValue];
    double result = pow(d, 3);
    //数值和对象之间，包括到字符串之间的转换
    NSNumber *num = [[NSNumber alloc] initWithDouble:result];
    return [num stringValue];
}

//覆盖父类中的退格方法
-(void) delNumber
{

    long inputLength = self.input.length - 1;
    long screenLength = self.screen.length - 1;
    char ch = [self.screen characterAtIndex:screenLength];
    NSString *lastStr = [NSString stringWithFormat:@"%c", ch];
    
    if (inputLength >= 0) {
        if ([lastStr isEqualToString:@"e"]) {
            [self.input deleteCharactersInRange:NSMakeRange(inputLength - 8, 9)];
            [self.screen deleteCharactersInRange:NSMakeRange(screenLength, 1)];
        }else if([lastStr isEqualToString:@"i"]){//删除pi
            [self.input deleteCharactersInRange:NSMakeRange(inputLength - 8, 9)];
            [self.screen deleteCharactersInRange:NSMakeRange(screenLength-1, 2)];
        }else{
            //NSLog(@"self.input is %@", self.input);
            NSMutableString *tempStr = [NSMutableString stringWithString:self.screen];//用来保护screen的值
            long tempLength = tempStr.length - 1;
            
            [self.input deleteCharactersInRange:NSMakeRange(inputLength, 1)];
            //NSLog(@"self.screen is %@", self.screen);
            //NSLog(@"tempStr is %@", tempStr);
            //[self.screen deleteCharactersInRange:NSMakeRange(screenLength, 1)];
            [tempStr deleteCharactersInRange:NSMakeRange(tempLength, 1)];
            self.screen = [NSMutableString stringWithString:tempStr];
            //NSLog(@"after delete, self.screen is %@", self.screen);
        }
        
    }
}

-(void) clearAll
{
    self.input = nil;
    self.screen = nil;
}

@end

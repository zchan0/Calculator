//
//  Stack.h
//  MyCalculator
//
//  Created by joyzh on 14/12/9.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@property(nonatomic, readonly) NSString *Top;
@property(nonatomic) NSUInteger Stacksize;
@property(nonatomic, readonly) NSMutableArray *stackArray;
@property(nonatomic, readonly) NSString *popElement;

-(instancetype)initWithStacksize:(NSUInteger)Stacksize;//designated initializer

-(BOOL)push:(NSString *)element stack:(Stack *)stack;

-(NSString *)pop:(Stack *)stack;

-(NSString *)getTop:(Stack *)stack;



@end

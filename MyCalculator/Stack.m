//
//  Stack.m
//  MyCalculator
//
//  Created by joyzh on 14/12/9.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property(nonatomic, readwrite) NSString *Top;
@property(nonatomic, readwrite) NSMutableArray *stackArray;
//@property(nonatomic) NSUInteger stackCount;
@property(nonatomic, readwrite) NSString *popElement;

@end

@implementation Stack

-(instancetype)initWithStacksize:(NSUInteger)Stacksize
{
    self = [super init];//must
    if (self) {
        self.stackArray = [[NSMutableArray alloc]initWithCapacity:Stacksize];
        for (NSUInteger i = 0; i < Stacksize; i++) {
            [self.stackArray addObject:@"#"];
        }
        //self.Top = [self.stackArray firstObject];
        self.Top = [self.stackArray lastObject];
        //self.stackCount = self.stackArray.count;
        NSLog(@"After initialization, Top is %@,stackArray:%@", self.Top, self.stackArray);
    }
    return self;
}

-(BOOL)push:(NSString *)element stack:(Stack *)stack
{
    if (stack.stackArray.count == self.Stacksize) {
        return NO;
    }else{
        //NSLog(@"before push, stackCount is %d", (int)self.stackCount);
        [stack.stackArray addObject:element];
        //stack.Top = element;
        stack.Top = [stack.stackArray lastObject];
        //self.stackCount ++;
        NSLog(@"push %@ succeed", stack.Top);
        return YES;
    }
}

//-(BOOL)pop:(NSString *)element stack:(Stack *)stack
-(NSString *)pop:(Stack *)stack
{
    if (stack.stackArray.count == 0) {
    //if(self.stackCount == 0){
        NSLog(@"stack is empty, pop failed!");
        return nil;
    }else{
        //element = [stack.stackArray lastObject];
        //NSUInteger cnt = stack.stackArray.count;
        //cnt = cnt - 1;NSLog(@"cnt: %d", (int)cnt);
        
        //self.stackCount -= 1;
        //stack.Top = self.stackArray[self.stackCount];
        //element = stack.Top;
        //self.popElement = stack.Top;
        
        self.popElement = [stack.stackArray lastObject];
        [stack.stackArray removeLastObject];
        stack.Top = [stack.stackArray lastObject];
        
        NSLog(@"pop %@ succeed, and now top is %@", self.popElement, stack.Top);
        return self.popElement;
    }
}

-(NSString *)getTop:(Stack *)stack
{
    if (stack.stackArray.count == 0){
        NSLog(@"Empty Stack!");
        return nil;
    }
    else
        return stack.Top;
}


@end

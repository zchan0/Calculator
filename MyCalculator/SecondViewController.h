//
//  SecondViewController.h
//  MyCalculator
//
//  Created by joyzh on 14/12/15.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "advancedCalculator.h"
#import "TriangleViewController.h"

@interface SecondViewController : UIViewController

@property (nonatomic, strong) advancedCalculator *calculator;//为了在两个视图控制器之间通讯，需要声明在头文件中(public)

@end

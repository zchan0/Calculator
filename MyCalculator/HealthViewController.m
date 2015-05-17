//
//  HealthViewController.m
//  MyCalculator
//
//  Created by joyzh on 14/12/17.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "HealthViewController.h"
#import "Calculate+Health.h"

@interface HealthViewController()
@property (weak, nonatomic) IBOutlet UITextField *TxtHeight;
@property (weak, nonatomic) IBOutlet UITextField *TxtWeight;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvice;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UIButton *btnCal;

@property (strong, nonatomic) Calculate *calculator;

@end

@implementation HealthViewController

-(void) viewWillAppear:(BOOL)animated
{
    [self.btnCal.layer setMasksToBounds:YES];
    [self.btnCal.layer setCornerRadius:5];
    [self.btnCal.layer setBorderWidth:0];
}

-(Calculate *)calculator
{
    if (!_calculator) {
        _calculator = [[Calculate alloc]init];
    }
    return _calculator;
}

- (IBAction)computeHealthScore:(UIButton *)sender
{
    NSString *score = [self.calculator computeHealthBMI:self.TxtHeight.text weight:self.TxtWeight.text];
    if ([score floatValue] < 19)
        self.labelAdvice.text = @"建议：太苗条啦，需要增加营养";
    else if([score floatValue] < 25)
        self.labelAdvice.text = @"建议：哇，你是魔鬼身材";
    else if([score floatValue] < 30)
        self.labelAdvice.text = @"建议：有点发福，要锻炼啦";
    else if([score floatValue] < 39)
        self.labelAdvice.text = @"建议：看来你是一个吃货，快锻炼吧，地球已经快无法承受你的重量啦";
    else
        self.labelAdvice.text = @"建议：再不减肥，死神和你有个约会";
    
    NSString *cuestr = @"体重指数：";
    NSMutableString *tempstr = [NSMutableString stringWithString:cuestr];
    [tempstr appendString:score];
    self.labelScore.text = tempstr;
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.TxtHeight || textField == self.TxtWeight) {
        [textField resignFirstResponder];
    }
    return YES;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.calculator = [[Calculate alloc]init];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
}

@end

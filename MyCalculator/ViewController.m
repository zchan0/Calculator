//
//  ViewController.m
//  MyCalculator
//
//  Created by joyzh on 14/12/7.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) Calculate * calculator;
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.inputText) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)TouchToSee:(UIButton *)sender {
    self.resultLabel.text = [self.calculator ExpressionCalculate:self.inputText.text];
    //[self.calculator isNumberic:@"123321"];
}

-(Calculate *)calculator
{
    if (!_calculator) {
        _calculator = [[Calculate alloc]init];
    }
    return _calculator;
}

/*
-(void)getPriority
{
    NSString * ch1 = @"+";
    NSString * ch2 = @"-";
    NSString * result = [self.calculator comparePriority:ch1 outOptr:ch2];
    NSLog(@"比较结果:%@", result);
    double res = [self.calculator calculate:1 opnd2:0 optr:ch2];
    NSLog(@"计算结果%f", res);
}*/

@end

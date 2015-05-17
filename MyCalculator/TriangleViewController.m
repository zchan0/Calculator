//
//  TriangleViewController.m
//  MyCalculator
//
//  Created by zhengcc on 14/12/20.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "TriangleViewController.h"

@interface TriangleViewController()

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UIButton *leftBracket;
@property (weak, nonatomic) IBOutlet UIButton *rightBracket;

@property (weak, nonatomic) IBOutlet UIButton *btnDiv;

@property (weak, nonatomic) IBOutlet UIButton *btnMult;

@property (weak, nonatomic) IBOutlet UIButton *btnSub;

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

@end

@implementation TriangleViewController

- (IBAction)touchButton:(UIButton *)sender
{
    NSLog(@"It's triangle view touching.");
    
    if(sender.tag == 1 || sender.tag == 2 || sender.tag == 3 ||  sender.tag == 7 || sender.tag == 11 || sender.tag == 15){//如果是这六个按钮，执行将按钮上的text显示在屏幕上
        
        if ([[[sender titleLabel] text] isEqualToString:@"×"]) {
            [self.calculator.input appendString:@"*"];
            
        }else if([[[sender titleLabel] text] isEqualToString:@"÷"]){
            [self.calculator.input appendString:@"/"];
        }else
            [self.calculator.input appendString:[[sender titleLabel] text]];
        
        if (self.inputText.text.length == 13) {
            NSMutableString *str = [NSMutableString stringWithString:self.calculator.input];
            NSLog(@"inputtxt=13, str is %@", str);
            self.calculator.screen = str;
            self.inputText.text = [str substringWithRange:NSMakeRange(str.length - 13, 13)];
        }else{
            NSMutableString *str = [NSMutableString stringWithString:self.inputText.text];
            [str appendString:[[sender titleLabel] text]];
            NSLog(@"inputtxt<13, str is %@", str);
            
            self.inputText.text = str;
            self.calculator.screen = str;
        }
        
    }
    
    if (sender.tag == 4) {
        self.inputText.text = [self.calculator sin:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 5) {
        self.inputText.text = [self.calculator cos:self.calculator.input];
        
        //NSLog(@"after compute, inputText is %@", self.inputText.text);
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        
        self.calculator.screen = self.calculator.input;
        
        //self.inputText.text = self.calculator.screen;//计算结果在场景之间传递
    }
    
    if (sender.tag == 6) {
        self.inputText.text = [self.calculator tan:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 8) {
        self.inputText.text = [self.calculator arcsin:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 9) {
        self.inputText.text = [self.calculator arccos:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 10) {
        //NSLog(@"It is doing factorial");
        self.inputText.text = [self.calculator arctan:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 12) {
        self.inputText.text = [self.calculator sinh:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 13) {
        self.inputText.text = [self.calculator cosh:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 14) {
        self.inputText.text = [self.calculator tanh:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 16) {
        self.inputText.text = [self.calculator arcsinh:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 17) {
        self.inputText.text = [self.calculator arccosh:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    
    NSLog(@"cal.input is %@", self.calculator.input);
    NSLog(@"inputText is %@", self.inputText.text);
    NSLog(@"screen is %@", self.calculator.screen);
}

- (IBAction)compute:(UIButton *)sender
{
    //添加＝符号在输入的字符串中（因为已有的model的计算方式必须以=结尾
    NSMutableString *computeStr = [NSMutableString stringWithString:self.calculator.input];
    [computeStr appendString:[[sender titleLabel] text]];
    NSLog(@"computeStr:%@", computeStr);
    
    self.inputText.text = [self.calculator ExpressionCalculate:computeStr];
    NSLog(@"after compute, inputText is %@", self.inputText.text);
    
    
    NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
    self.calculator.input = tempStr;
    self.calculator.screen = tempStr;//每次计算之后，将结果也保存在screen中
}


- (IBAction)clearAll:(UIButton *)sender
{
    self.inputText.text = nil;
    [self.calculator clearAll];
}

- (IBAction)delNumber:(UIButton *)sender
{
    [self.calculator delNumber];
    self.inputText.text = self.calculator.screen;
}


-(void)viewWillAppear:(BOOL)animated
{
    //将视图刚要显示的时候，将传递过来的内容在屏幕中显示
    NSString *tmpStr = self.calculator.screen;
    if (tmpStr.length == 13) {
        NSLog(@"second view length = 13");
        self.inputText.text = [tmpStr substringWithRange:NSMakeRange(tmpStr.length - 13, 13)];
    }else{
        NSLog(@"second view length < 13, inputtxt is %@", self.inputText.text);
        self.inputText.text = tmpStr;
    }
    //self.inputText.text = self.calculator.screen;
}

- (void)viewDidLoad {
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

@end

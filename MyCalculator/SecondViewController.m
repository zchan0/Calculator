//
//  SecondViewController.m
//  MyCalculator
//
//  Created by joyzh on 14/12/15.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController()
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UIButton *leftBracket;
@property (weak, nonatomic) IBOutlet UIButton *rightBracket;
@property (weak, nonatomic) IBOutlet UIButton *btnDiv;
@property (weak, nonatomic) IBOutlet UIButton *btnMult;
@property (weak, nonatomic) IBOutlet UIButton *btnSub;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnPi;
@property (weak, nonatomic) IBOutlet UIButton *btne;


@end

@implementation SecondViewController

//不再需要属性初始化，因为这是第二个视图控制器，在第一个中初始化已经完成
- (IBAction)touchButton:(UIButton *)sender
{
    NSLog(@"It's second view touching.");
    
    if(sender.tag == 1 || sender.tag == 2 || sender.tag == 6 || sender.tag == 14 || sender.tag == 3 || sender.tag == 7 || sender.tag == 11 || sender.tag == 15){//如果是这四个按钮，执行将按钮上的text显示在屏幕上
        
        if ([[[sender titleLabel] text] isEqualToString:@"e"]) {
            [self.calculator.input appendString:@"2.7182818"];
        }else if([[[sender titleLabel]text] isEqualToString:@"pi"]){
            [self.calculator.input appendString:@"3.1415926"];
        }else if ([[[sender titleLabel] text] isEqualToString:@"×"]) {
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
        self.inputText.text = [self.calculator abs:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 5) {

        //NSMutableString *computeStr = [NSMutableString stringWithString:self.calculator.input];
        //[computeStr appendString:@"="];
        //NSLog(@"computeStr:%@", computeStr);
        
        //self.inputText.text = [self.calculator sqrt:[self.calculator ExpressionCalculate:computeStr]];
        
        self.inputText.text = [self.calculator sqrt:self.calculator.input];
        
        //NSLog(@"after compute, inputText is %@", self.inputText.text);
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        
        self.calculator.screen = self.calculator.input;
        
        //self.inputText.text = self.calculator.screen;//计算结果在场景之间传递
    }
    
    if (sender.tag == 8) {
        self.inputText.text = [self.calculator log2:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 9) {
        self.inputText.text = [self.calculator log10:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 10) {
        self.inputText.text = [self.calculator loge:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 12) {
        NSLog(@"It is doing factorial");
        self.inputText.text = [self.calculator factorial:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 13) {
        self.inputText.text = [self.calculator percent:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 16) {
        self.inputText.text = [self.calculator pow2:self.calculator.input];
        
        NSMutableString *tempStr = [NSMutableString stringWithString:self.inputText.text];
        self.calculator.input = tempStr;
        self.calculator.screen = tempStr;
    }
    
    if (sender.tag == 17) {
        self.inputText.text = [self.calculator pow3:self.calculator.input];
        
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

- (IBAction)delNumber:(UIButton *)sender
{
    [self.calculator delNumber];
    self.inputText.text = self.calculator.screen;
}

- (IBAction)clearAll:(UIButton *)sender
{
    self.inputText.text = nil;
    [self.calculator clearAll];
}


-(void)viewWillAppear:(BOOL)animated
{
    //将视图刚要显示的时候，将传递过来的内容在屏幕中显示
    NSString *tmpStr = self.calculator.screen;
    if (tmpStr.length == 13) {
        NSLog(@"first view length = 13");
        self.inputText.text = [tmpStr substringWithRange:NSMakeRange(tmpStr.length - 13, 13)];
    }else{
        NSLog(@"first view length < 13");
        self.inputText.text = tmpStr;
    }
    //self.inputText.text = self.calculator.screen;
}




@end

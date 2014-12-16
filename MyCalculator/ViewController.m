//
//  ViewController.m
//  MyCalculator
//
//  Created by joyzh on 14/12/7.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property(nonatomic, strong) Calculate * calculator;
@property (strong, nonatomic) advancedCalculator *calculator;
@property (weak, nonatomic) IBOutlet UITextField *inputText;

@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btnDot;
@property (weak, nonatomic) IBOutlet UIButton *btnDiv;
@property (weak, nonatomic) IBOutlet UIButton *btnMult;
@property (weak, nonatomic) IBOutlet UIButton *btnSub;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnEqual;

@property (weak, nonatomic) IBOutlet UIButton *leftBracket;
@property (weak, nonatomic) IBOutlet UIButton *rightBracket;

@end

@implementation ViewController

/*
-(Calculate *)calculator
{
    if (!_calculator) {
        _calculator = [[Calculate alloc]init];
    }
    return _calculator;
}*/

-(advancedCalculator *)calculator
{
    if (!_calculator) {
        _calculator = [[advancedCalculator alloc]init];
    }
    return _calculator;
}


- (IBAction)touchNumber:(UIButton *)sender
{
    NSMutableString *str = [NSMutableString stringWithString:self.inputText.text];
    
    if ([[[sender titleLabel] text] isEqualToString:@"×"]) {
        [self.calculator.input appendString:@"*"];
       
    }else if([[[sender titleLabel] text] isEqualToString:@"÷"]){
        [self.calculator.input appendString:@"/"];
    }else
        [self.calculator.input appendString:[[sender titleLabel] text]];
    
    [str appendString:[[sender titleLabel] text]];
    self.calculator.screen = str;
    self.inputText.text = str;
    
    NSLog(@"It's first view touching.");
    NSLog(@"str is:%@", str);
    NSLog(@"cal.input is %@", self.calculator.input);
    NSLog(@"inputText is %@", self.inputText.text);
    NSLog(@"screen is %@", self.calculator.screen);
}

- (IBAction)clearAll:(UIButton *)sender
{
    self.inputText.text = nil;
    [self.calculator clearAll];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //把advanced的实例对象传给第二个场景
    if ([segue.identifier isEqualToString:@"SecondScene"]) {//判断是否是第二个场景
        if ([segue.destinationViewController isKindOfClass:[SecondViewController class]]) {//判断目的视图控制器
            SecondViewController *svc = (SecondViewController *)segue.destinationViewController;
            svc.calculator = self.calculator;//仅传递了内容
        }
    }
    
}

- (IBAction)delNumber:(UIButton *)sender
{
    /*将删除的方法放入重写的类中
    long len = self.calculator.input.length - 1;
    if (len >= 0) {
        [self.calculator.input deleteCharactersInRange:NSMakeRange(len, 1)];
        self.inputText.text = self.calculator.input;
    }*/
    
    //[self.calculator delNumber];
    //与老师的代码不同，因为在compute中我让input又等于了inputText的值，前面的代码即让inputText退格了，如果再调用该函数，会退格两次
    
    [self.calculator delNumber];
    self.inputText.text = self.calculator.screen;
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

-(void)viewWillAppear:(BOOL)animated
{
    self.inputText.text = self.calculator.screen;//从另一个场景传递回来
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.calculator = [[Calculate alloc]init];
    self.calculator = [[advancedCalculator alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

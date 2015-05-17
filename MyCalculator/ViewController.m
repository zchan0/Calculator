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

-(advancedCalculator *)calculator
{
    if (!_calculator) {
        _calculator = [[advancedCalculator alloc]init];
    }
    return _calculator;
}

-(void) controllScreen
{
    NSString *tmpStr = self.inputText.text;
    if (tmpStr.length > 20)
        self.inputText.text = [tmpStr substringWithRange:NSMakeRange(tmpStr.length - 20, 20)];
    else
        self.inputText.text = tmpStr;
}


- (IBAction)touchNumber:(UIButton *)sender
{
    if ([[[sender titleLabel] text] isEqualToString:@"×"]) {
        [self.calculator.input appendString:@"*"];
        
    }else if([[[sender titleLabel] text] isEqualToString:@"÷"]){
        [self.calculator.input appendString:@"/"];
    }else
        [self.calculator.input appendString:[[sender titleLabel] text]];
    
    if (self.inputText.text.length == 13) {
        NSMutableString *str = [NSMutableString stringWithString:self.calculator.input];
        //[str appendString:[[sender titleLabel] text]];//str由input初始化，已经加入了按钮的字符
        NSLog(@"inputtxt=13, str is %@", str);
        self.calculator.screen = str;
        self.inputText.text = [str substringWithRange:NSMakeRange(str.length - 13, 13)];
    }else{
        NSMutableString *str = [NSMutableString stringWithString:self.inputText.text];
        [str appendString:[[sender titleLabel] text]];
        NSLog(@"inputtxt<13, str is %@", str);
        self.calculator.screen = str;
        self.inputText.text = str;
    }
    
    
    NSLog(@"It's first view touching.");
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
    [self shouldAutorotate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.calculator = [[advancedCalculator alloc]init];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

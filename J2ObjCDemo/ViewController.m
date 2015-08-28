//
//  ViewController.m
//  J2ObjCDemo
//
//  Created by wangxiang on 15/7/6.
//  Copyright (c) 2015年 wangxiang. All rights reserved.
//
#import "Test.h"
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btnCallJava;

@property (nonatomic, strong) UIButton *btnCallOCFromJava;
@property (nonatomic, strong) UIButton *btnCallJavaThread;
@property (nonatomic, strong) UIButton *btnCallJavaReflection;
@property (nonatomic, strong) UIButton *btnCallJavaInterface;
@property (nonatomic, strong) UIButton *btnCallJavaInherit;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];

    CGRect rect = self.view.bounds;
    rect.origin.y = 50;
    rect.size.height = 30;

    self.btnCallJava = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCallJava.backgroundColor = [UIColor redColor];
    _btnCallJava.frame = rect;
    [_btnCallJava setTitle:@"调用java测试" forState:UIControlStateNormal];
    [_btnCallJava addTarget:self action:@selector(btnCallJavaClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCallJava];

    rect.origin.y += 35;
    self.btnCallOCFromJava = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCallOCFromJava.backgroundColor = [UIColor redColor];
    _btnCallOCFromJava.frame = rect;
    [_btnCallOCFromJava setTitle:@"从java调用oc" forState:UIControlStateNormal];
    [_btnCallOCFromJava addTarget:self action:@selector(btnCallOCFromJavaClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCallOCFromJava];

    rect.origin.y += 35;
    self.btnCallJavaThread = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCallJavaThread.backgroundColor = [UIColor redColor];
    _btnCallJavaThread.frame = rect;
    [_btnCallJavaThread setTitle:@"调用java线程" forState:UIControlStateNormal];
    [_btnCallJavaThread addTarget:self action:@selector(btnCallJavaThreadClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCallJavaThread];

    rect.origin.y += 35;
    self.btnCallJavaReflection = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCallJavaReflection.backgroundColor = [UIColor redColor];
    _btnCallJavaReflection.frame = rect;
    [_btnCallJavaReflection setTitle:@"java反射测试" forState:UIControlStateNormal];
    [_btnCallJavaReflection addTarget:self action:@selector(btnCallJavaReflectionClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCallJavaReflection];

    rect.origin.y += 35;
    self.btnCallJavaInterface = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCallJavaInterface.backgroundColor = [UIColor redColor];
    _btnCallJavaInterface.frame = rect;
    [_btnCallJavaInterface setTitle:@"java接口测试" forState:UIControlStateNormal];
    [_btnCallJavaInterface addTarget:self action:@selector(btnCallJavaInterfaceClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCallJavaInterface];

    rect.origin.y += 35;
    self.btnCallJavaInherit = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCallJavaInherit.backgroundColor = [UIColor redColor];
    _btnCallJavaInherit.frame = rect;
    [_btnCallJavaInherit setTitle:@"java类继承测试" forState:UIControlStateNormal];
    [_btnCallJavaInherit addTarget:self action:@selector(btnCallJavaInheritClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCallJavaInherit];
}

- (void)btnCallJavaClick
{
    //    NTTest* test =[[NTTest alloc] init];
    //    [test doSomething];
    [self runThreadTest];
}

- (void)btnCallOCFromJavaClick
{
    NTTest *test = [[NTTest alloc] init];
    [test doSomethingUseOC];
}

- (void)btnCallJavaThreadClick
{
    NTTest *test = [[NTTest alloc] init];
    NSTimeInterval start = [[NSDate date] timeIntervalSince1970] * 1000;
    //    [test doThreadTest];
    [test doPerfanmenceTest];
    NSLog(@"use time:%f", [[NSDate date] timeIntervalSince1970] * 1000 - start);
}

- (void)runThreadTest
{
    NSTimeInterval start = [[NSDate date] timeIntervalSince1970] * 1000;
    int i = 0;
    while (i < 100000) {
        //        NSLog(@"%d",i++);
        printf("%d\n", i);
        i++;
    };
    NSLog(@"use time:%f", [[NSDate date] timeIntervalSince1970] * 1000 - start);
}

- (void)btnCallJavaReflectionClick
{
    NTTest *test = [[NTTest alloc] init];
    [test doReflectionTest];
}

- (void)btnCallJavaInterfaceClick
{
    NTTest *test = [[NTTest alloc] init];
    [test onClick];

    NSURL *url = [NSURL URLWithString:@"test://demo"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)btnCallJavaInheritClick
{
    NTTest *test = [[NTTest alloc] init];
    [test doBaseSomething];
}

@end

//
//  ViewController.m
//  WKVerCodeView
//
//  Created by Jeaner on 2017/5/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "ViewController.h"
#import "WKVerCodeImageView.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) WKVerCodeImageView *codeImageView;

@end

@implementation ViewController
{
    NSString *str;
    UITextField *testFiled;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //输入框
    testFiled=[[UITextField alloc]initWithFrame:CGRectMake(30, 60, 100, 40)];
    testFiled.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:testFiled];
    
    //点击验证按钮
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"Commit" forState:UIControlStateNormal];
    btn.layer.cornerRadius=5;
    btn.layer.borderWidth=1;
    btn.layer.borderColor=[UIColor lightGrayColor].CGColor;
    btn.frame=CGRectMake(110, 120, 100, 40);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _codeImageView = [[WKVerCodeImageView alloc] initWithFrame:CGRectMake(160, 60, 80, 35)];
    _codeImageView.bolck = ^(NSString *imageCodeStr){//看情况是否需要
        NSLog(@"imageCodeStr = %@",imageCodeStr);
        str=[NSString stringWithFormat:@"%@", imageCodeStr];
    };
    //是否需要斜体
    _codeImageView.isRotation = NO;
    [_codeImageView freshVerCode];
    
    //点击刷新
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [_codeImageView addGestureRecognizer:tap];
    [self.view addSubview: _codeImageView];}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clicked{
    
    [testFiled resignFirstResponder];
    
    
    // compare 比较规则options
    // NSLiteralSearch 区分大小写(完全比较)
    // NSCaseInsensitiveSearch 不区分大小写
    // NSNumericSearch 只比较字符串的个数，而不比较字符串的字面值
    BOOL result1 =  [testFiled.text compare:str
                                    options:NSCaseInsensitiveSearch | NSNumericSearch]==NSOrderedSame;
    
    if (result1) {
        NSLog(@"succes");
    }else{
        NSLog(@"faile");
    }
}

- (void)tapClick:(UITapGestureRecognizer*)tap
{
    [_codeImageView freshVerCode];
}




@end

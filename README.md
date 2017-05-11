# WKVerCodeView
Encapsulation of a third-party library, direct call, for graphics code generation and validation


使用方法

1.直接在viewController中初始化添加

_codeImageView = [[MQVerCodeImageView alloc] initWithFrame:CGRectMake(100, 100, 80, 35)];
    _codeImageView.bolck = ^(NSString *imageCodeStr){
    //打印生成的验证码
      NSLog(@"imageCodeStr = %@",imageCodeStr);
    };
   //验证码字符是否可以斜着
    _codeImageView.isRotation = NO;
    [_codeImageView freshVerCode];
    [self.view addSubview: _codeImageView];}

2.点击验证码，重新获取验证码的方法

 [_codeImageView freshVerCode];


3.在button的点击事件里可以判断是否为图形验证的字符串,dome中提供了字符串比较的方法(可自行选择是不是要区分大小写)

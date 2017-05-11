# WKVerCodeView
Encapsulation of a third-party library, direct call, for graphics code generation and validation


使用方法

1.直接在在你需要的viewController中初始化添加 alloc init的方法

2.在里面封装了一个block事用来将图像上的string传出来作为比较,如果需要这个字符串则可以调用这个block拿到这个值
    _codeImageView.bolck = ^(NSString *imageCodeStr){
    //打印生成的验证码
      NSLog(@"imageCodeStr = %@",imageCodeStr);
    };

3.isRotation这个属性是是否为斜体(可以自行添加)

4.调用这个方法显示图形验证码

5.将初始化的图形验证视图添加到你要的view上


6.点击验证码，重新获取验证码的方法

 [_codeImageView freshVerCode];


7.在button的点击事件里可以判断是否为图形验证的字符串,dome中提供了字符串比较的方法(可自行选择是不是要区分大小写)

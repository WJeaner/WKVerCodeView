//
//  WKVerCodeImageView.h
//  WKVerCodeView
//
//  Created by Jeaner on 17/5/9.
//  Copyright © 2017年 Jeaner. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WKCodeImageBlock)(NSString *codeStr);
@interface WKVerCodeImageView : UIView

@property (nonatomic, strong) NSString *imageCodeStr;
@property (nonatomic, assign) BOOL isRotation;
@property (nonatomic, copy) WKCodeImageBlock bolck;

-(void)freshVerCode;

@end

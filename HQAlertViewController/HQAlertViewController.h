//
//  HQAlertViewController.h
//  HQAlertViewControllerDemo
//
//  Created by 惠强 on 2017/4/17.
//  Copyright © 2017年 惠强. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HQAlertViewControllerDelegate;
@interface HQAlertViewController : UIViewController

/**
 代理 可使用回调
 */
@property (nonatomic, weak) id <HQAlertViewControllerDelegate> delegate;
/// 确定按钮的文字颜色
@property (nonatomic, strong) UIColor * sureButtonTitleColor;
/// 确定按钮的背景颜色
@property (nonatomic, strong) UIColor * sureButtonBackgroundColor;
/// 取消按钮的文字颜色
@property (nonatomic, strong) UIColor * cancelButtonTitleColor;
/// 取消按钮的背景颜色
@property (nonatomic, strong) UIColor * cancelButtonBackgroundColor;
/**
 确认按钮的回调
 
 */
@property (nonatomic, copy) void(^surenButtonClickBlock)(UIButton *sureBtn);


/**
 初始化方法

 @param title 标题
 @param subTitle 副标题 属性字符串
 @param detailTitle 详细标题 属性字符串
 @param cancelTitle 取消按钮的文字
 @param sureTitle 确认按钮的文字
 @return 当前控制器
 */
+ (instancetype)alertWithTitle:(NSString *)title
                      subTitle:(NSAttributedString *)subTitle
                   detailTitle:(NSAttributedString *)detailTitle
             cancelButtonTitle:(NSString *)cancelTitle
               sureButtonTitle:(NSString *)sureTitle;

- (void)showWithPresentViewController:(UIViewController *)presentVC;

@end
@protocol HQAlertViewControllerDelegate <NSObject>

@optional

- (void)alertView:(HQAlertViewController *)alter sureButtonClick:(UIButton *)sureBtn;

@end

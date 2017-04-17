//
//  HQAlertViewController.m
//  HQAlertViewControllerDemo
//
//  Created by 惠强 on 2017/4/17.
//  Copyright © 2017年 惠强. All rights reserved.
//

#import "HQAlertViewController.h"
#import "Masonry.h"
#define HQBLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__);};

@interface HQAlertViewController ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, weak) UIButton *sureButton;
@property (nonatomic, weak) UIButton *cancelButton;


@end

@implementation HQAlertViewController

+ (instancetype)alertWithTitle:(NSString *)title
                      subTitle:(NSAttributedString *)subTitle
                   detailTitle:(NSAttributedString *)detailTitle
             cancelButtonTitle:(NSString *)cancelTitle
               sureButtonTitle:(NSString *)sureTitle
{
    return [[self alloc]initWithTitle:title subTitle:subTitle detailTitle:detailTitle cancelButtonTitle:cancelTitle sureButtonTitle:sureTitle];
}

- (instancetype)initWithTitle:(NSString *)title
                     subTitle:(NSAttributedString *)subTitle
                  detailTitle:(NSAttributedString *)detailTitle
            cancelButtonTitle:(NSString *)cancelTitle
              sureButtonTitle:(NSString *)sureTitle
{
    if (self = [super init]) {
        
        [self.view addSubview:self.bgView];
        _sureButtonTitleColor = [UIColor whiteColor];
        
        _sureButtonBackgroundColor = [UIColor redColor];
        _cancelButtonTitleColor = [UIColor lightGrayColor];
        _cancelButtonBackgroundColor = [UIColor whiteColor];
        UILabel *titleLab = [self lableWithFont:17];
        titleLab.textColor = [UIColor blackColor];
        [self.bgView addSubview:titleLab];
        
        UILabel *subTitleLab = [self lableWithFont:14];
        subTitleLab.textColor = [UIColor darkGrayColor];
        [self.bgView addSubview:subTitleLab];
        
        UILabel *detailTitleLab = [self lableWithFont:14];
        detailTitleLab.textColor = [UIColor darkGrayColor];
        [self.bgView addSubview:detailTitleLab];
        
        UIButton *cancelBtn = [self buttonWithTitle:cancelTitle isCancel:YES];
        [cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
        self.cancelButton = cancelBtn;
        [self.bgView addSubview:cancelBtn];
        
        UIButton *sureBtn = [self buttonWithTitle:sureTitle isCancel:NO];
        [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.sureButton = sureBtn;
        [self.bgView addSubview:sureBtn];
        
        titleLab.text = title;
        if (subTitle) {
            subTitleLab.attributedText = subTitle;
        }
        if (detailTitle) {
            detailTitleLab.attributedText = detailTitle;
        }
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.offset(260);
        }];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView).offset(10);
            make.left.right.equalTo(self.bgView);
        }];
        
        [subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLab.mas_bottom).offset(20);
            make.centerX.equalTo(self.bgView);
            make.width.equalTo(self.bgView).offset(-16);
        }];
        
        [detailTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(subTitleLab.mas_bottom).offset(10);
            make.centerX.width.equalTo(subTitleLab);
        }];
        
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(detailTitleLab.mas_bottom).offset(20);
            make.bottom.equalTo(self.bgView.mas_bottom).offset(- 10);
            make.left.equalTo(self.bgView).offset(30);
            make.height.offset(28);
        }];
        
        [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.height.width.equalTo(cancelBtn);
            make.left.equalTo(cancelBtn.mas_right).offset(20);
            make.right.equalTo(self.bgView).offset(-30);
        }];
        
    }
    return self;
}

- (void)dealloc {
    NSLog(@" --- %@ dealloc --- ",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showAnimated];
}

- (void)cancelClick:(UIButton *)cancelBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sureBtnClick:(UIButton *)sureBtn {
    __weak typeof(self) weakself = self;
    [self dismissViewControllerAnimated:YES completion:^{
        [weakself execDelegateMethodWithButton:sureBtn];
    }];
    
}

- (void)execDelegateMethodWithButton:(UIButton *)sureBtn {
    if (_delegate && [_delegate respondsToSelector:@selector(alertView:sureButtonClick:)]) {
        [_delegate alertView:self sureButtonClick:sureBtn];
    }
    HQBLOCK_EXEC(_surenButtonClickBlock, sureBtn);
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.layer.cornerRadius = 3;
        _bgView.layer.masksToBounds = YES;
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)lableWithFont:(CGFloat)font {
    UILabel *lable = [[UILabel alloc]init];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:font];
    return lable;
}

- (UIButton *)buttonWithTitle:(NSString *)title isCancel:(BOOL)cancel {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    UIColor *titleColor = self.sureButtonTitleColor;
    UIColor *bgColor = self.sureButtonBackgroundColor;
    if (cancel) {
        titleColor = self.cancelButtonTitleColor;
        bgColor = self.cancelButtonBackgroundColor;
        
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth = 0.8;
    }
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.backgroundColor = bgColor;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.layer.cornerRadius = 6;
    btn.layer.masksToBounds = YES;
    return btn;
}
- (void)setSureButtonTitleColor:(UIColor *)sureButtonTitleColor {
    _sureButtonTitleColor = sureButtonTitleColor;
    [self.sureButton setTitleColor:sureButtonTitleColor forState:UIControlStateNormal];
}
- (void)setSureButtonBackgroundColor:(UIColor *)sureButtonBackgroundColor {
    _sureButtonBackgroundColor = sureButtonBackgroundColor;
    self.sureButton.backgroundColor = sureButtonBackgroundColor;
}
- (void)setCancelButtonTitleColor:(UIColor *)cancelButtonTitleColor {
    _cancelButtonTitleColor = cancelButtonTitleColor;
    [self.cancelButton setTitleColor:cancelButtonTitleColor forState:UIControlStateNormal];
    
}
- (void)setCancelButtonBackgroundColor:(UIColor *)cancelButtonBackgroundColor {
    _cancelButtonBackgroundColor = cancelButtonBackgroundColor;
    self.cancelButton.backgroundColor = cancelButtonBackgroundColor;
}

- (void)showWithPresentViewController:(UIViewController *)presentVC {
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [presentVC presentViewController:self animated:YES completion:nil];
}

- (void)showAnimated {
    [self.view layoutIfNeeded];
    CGFloat scale = 1 - 220.0/260;
    _bgView.transform = CGAffineTransformMakeScale(1 + scale, 1 + scale);
    [UIView animateWithDuration:0.1 animations:^{
        [UIView setAnimationCurve:7];
        _bgView.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

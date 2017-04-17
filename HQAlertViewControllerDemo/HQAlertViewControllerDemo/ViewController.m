//
//  ViewController.m
//  HQAlertViewControllerDemo
//
//  Created by 惠强 on 2017/4/17.
//  Copyright © 2017年 惠强. All rights reserved.
//

#import "ViewController.h"
#import "HQAlertViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClicked:(id)sender {
    [self showAlertViewController];
}

- (void)showAlertViewController {
    
    NSAttributedString *subTitle = [[NSAttributedString alloc] initWithString:@"我们将对您的手机发出校验码"];
    NSAttributedString *detail = [[NSAttributedString alloc] initWithString:@"13812341234"];
    
    HQAlertViewController *alertVC = [HQAlertViewController alertWithTitle:@"手机号确认"
                                                                  subTitle:subTitle
                                                               detailTitle:detail
                                                         cancelButtonTitle:@"取消"
                                                           sureButtonTitle:@"确认"];
    alertVC.sureButtonBackgroundColor = [UIColor blueColor];
    [alertVC setSurenButtonClickBlock:^(UIButton *sureBtn) {
        NSLog(@"确认按钮被点击了");
    }];
    [alertVC showWithPresentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

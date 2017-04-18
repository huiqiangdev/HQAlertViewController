# 项目中遇到的一个弹框
## 项目中使用Masonry 布局，所以要导入Masonry
###如下图所示

![](snap_images.png)

##使用方法

```objc
// 在按钮的方法中调用
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
    // 此处的self 为当前控制器
    [alertVC showWithPresentViewController:self];
}


```
##  安装
### 1.手动添加:==推荐==<br> 
*   1.将 HQAlertViewController 文件夹添加到工程目录中<br>
*   2.导入 HQAlertViewController.h

### 2.CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'HQAlertViewController'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 HQAlertViewController.h

##  Tips
*   使用中有什么问题可以在github中联系我，也可以加我QQ **805376471**

##  系统要求
*   该项目最低支持 iOS 7.0 和 Xcode 7.0

##  许可证
HQAlertViewController 使用 MIT 许可证，详情见 LICENSE 文件


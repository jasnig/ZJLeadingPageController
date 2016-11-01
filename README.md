# ZJLeadingPageController
App的启动的引导页面---简单demo

* ZJLeadingPageController 一个非常简单的引导页面demo. 使用可以是这样的.


![leading1.gif](http://upload-images.jianshu.io/upload_images/1271831-084572fb3b11f10a.gif?imageMogr2/auto-orient/strip)


```
// 如果是第一次安装打开App --- 显示引导页面
    ZJLeadingPageController *leadController = [[ZJLeadingPageController alloc] initWithPagesCount:5 setupCellHandler:^(ZJLeadingPageCell *cell, NSIndexPath *indexPath) {
        
        // 设置图片
        NSString *imageName = [NSString stringWithFormat:@"wangyiyun%ld",indexPath.row];
        cell.imageView.image = [UIImage imageNamed:imageName];

        // 设置按钮属性
        [cell.finishBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [cell.finishBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
    } finishHandler:^(UIButton *finishBtn) {
        NSLog(@"点击了完成按钮-----");
    }];
    // 自定义属性
    leadController.pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    leadController.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
```
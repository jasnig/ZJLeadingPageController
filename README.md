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

> 这是我写的<iOS自定义控件剖析>这本书籍中的一个demo, 如果你希望知道具体的实现过程和其他的一些常用效果的实现, 那么你应该能轻易在网上下载到免费的盗版书籍. 

> 当然作为本书的写作者, 还是希望有人能支持正版书籍. 如果你有意购买书籍, 在[这篇文章中](http://www.jianshu.com/p/510500f3aebd), 介绍了书籍中所有的内容和书籍适合阅读的人群, 和一些试读章节, 以及购买链接. 在你准备[购买](http://www.qingdan.us/product/13)之前, 请一定读一读里面的说明. 否则, 如果不适合你阅读, 虽然书籍售价35不是很贵, 但是也是一笔损失.


> 如果你希望联系到我, 可以通过[简书](http://www.jianshu.com/users/fb31a3d1ec30/latest_articles)联系到我

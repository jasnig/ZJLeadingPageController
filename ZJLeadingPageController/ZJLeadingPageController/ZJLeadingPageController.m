//
//  ZJLeadingPageController.m
//  ZJLeadingPageController
//
//  Created by ZeroJ on 16/10/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJLeadingPageController.h"
@interface ZJLeadingPageController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>
@property (copy, nonatomic) ZJLeadingPageSetupCellHandler setupCellHandler;
@property (copy, nonatomic) ZJLeadingPageFinishHandler finishHandler;

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIPageControl *pageControl;

@property (assign, nonatomic) NSInteger count;

@end

static NSString *const kZJLeadingPageCellId = @"kZJLeadingPageCellId";
@implementation ZJLeadingPageController

#pragma mark - lefe cycle
- (instancetype)initWithPagesCount:(NSInteger)count setupCellHandler:(ZJLeadingPageSetupCellHandler)setupCellHandler finishHandler:(ZJLeadingPageFinishHandler)finishHandler {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _count = count;
        _setupCellHandler = [setupCellHandler copy];
        _finishHandler = [finishHandler copy];
        // 添加collectionView -- 使用懒加载初始化
        [self.view addSubview:self.collectionView];
        // 添加pageControl  -- 使用懒加载初始化
        [self.view addSubview:self.pageControl];
        // 注册cell
        [self.collectionView registerClass:[ZJLeadingPageCell class] forCellWithReuseIdentifier:kZJLeadingPageCellId];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJLeadingPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kZJLeadingPageCellId forIndexPath:indexPath];
    if (indexPath.row != self.count-1) {
        cell.finishBtn.hidden = YES;
    }
    else {
        // 随后一页 显示按钮, 并且添加响应方法
        cell.finishBtn.hidden = NO;
        [cell.finishBtn addTarget:self action:@selector(finishBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    // 设置数据
    if (self.setupCellHandler) {
        self.setupCellHandler(cell, indexPath);
    }
    return cell;
}

- (void)finishBtnOnClick:(UIButton *)finishBtn {
    if (self.finishHandler) {
        self.finishHandler(finishBtn);
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 向下取整
    NSInteger currentPage = scrollView.contentOffset.x/scrollView.bounds.size.width + 0.5;
    if (self.pageControl.currentPage != currentPage) {
        self.pageControl.currentPage = currentPage;
    }
}
#pragma mark - getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.view.bounds.size;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.numberOfPages = self.count;
        pageControl.currentPage = 0;
        CGSize pageControlSize = [pageControl sizeForNumberOfPages:self.count];
        CGFloat pageControlX = (self.view.bounds.size.width - pageControlSize.width)/2;
        // 距离屏幕下方为 50 请根据具体情况修改吧
        CGFloat pageControlY = (self.view.bounds.size.height - pageControlSize.height - 50.f);
        pageControl.frame = CGRectMake(pageControlX, pageControlY, pageControlSize.width, pageControlSize.height);
        _pageControl = pageControl;
    }
    return _pageControl;
}

@end

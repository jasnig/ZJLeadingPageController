//
//  ZJLeadingPageController.h
//  ZJLeadingPageController
//
//  Created by ZeroJ on 16/10/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJLeadingPageCell.h"
typedef void(^ZJLeadingPageSetupCellHandler)(ZJLeadingPageCell *cell, NSIndexPath *indexPath);
typedef void(^ZJLeadingPageFinishHandler)(UIButton *finishBtn);

@interface ZJLeadingPageController : UIViewController

- (instancetype)initWithPagesCount:(NSInteger)count setupCellHandler:(ZJLeadingPageSetupCellHandler)setupCellHandler finishHandler:(ZJLeadingPageFinishHandler)finishHandler ;
@property (strong, nonatomic, readonly) UIPageControl *pageControl;
@property (strong, nonatomic, readonly) UICollectionView *collectionView;
@property (assign, nonatomic, readonly) NSInteger count;

@end

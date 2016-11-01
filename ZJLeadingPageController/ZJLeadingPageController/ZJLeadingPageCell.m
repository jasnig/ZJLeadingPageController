//
//  ZJLeadingPageCell.m
//  ZJLeadingPageController
//
//  Created by ZeroJ on 16/10/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJLeadingPageCell.h"

@implementation ZJLeadingPageCell
- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.finishBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
    // 根据字数自动调整宽高
    [self.finishBtn sizeToFit];
    CGFloat margin = 10.f;
    
    CGFloat btnHeight = self.finishBtn.bounds.size.height+2*margin;
    CGFloat btnWidth = self.finishBtn.bounds.size.width+2*margin;
    CGFloat btnX = (self.bounds.size.width - btnWidth)/2;
    // 距离屏幕下方的距离为 100
    CGFloat btnY = self.bounds.size.height - 100.f - btnHeight;
    self.finishBtn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
    
}

- (UIButton *)finishBtn {
    if (!_finishBtn) {
        UIButton *button = [UIButton new];
        button.backgroundColor = [UIColor yellowColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 10.f;
        _finishBtn = button;
    }
    return _finishBtn;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}
@end

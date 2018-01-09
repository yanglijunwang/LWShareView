//
//  ArtShareSheetView.m
//  LWShareView
//
//  Created by LeeWong on 2018/1/9.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import "ArtShareSheetView.h"
#import "UIColor+ArtBox.h"
#import "ArtShareContentView.h"
#import <Masonry.h>

@interface ArtShareSheetView ()
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) ArtShareContentView *contentView;

@end

@implementation ArtShareSheetView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self buildUI];
    }
    return self;
}


- (void)buildUI
{
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.height.equalTo(@50);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.equalTo(self.cancelBtn.mas_top).offset(-10);
    }];
    
}

- (void)setShareBtnClickBlock:(void (^)(NSIndexPath *))shareBtnClickBlock
{
    _shareBtnClickBlock = shareBtnClickBlock;
    self.contentView.shareBtnClickBlock = shareBtnClickBlock;
}

#pragma mark - Lazy Load


- (ArtShareContentView *)contentView
{
    if (_contentView == nil) {
        _contentView = [[ArtShareContentView alloc] init];
        _contentView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
        _contentView.layer.cornerRadius = 12;
        _contentView.layer.masksToBounds = YES;
        _contentView.menus = [self menus];
        [self addSubview:_contentView];
    }
    return _contentView;
}

- (UIButton *)cancelBtn
{
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _cancelBtn.layer.cornerRadius = 12;
        _cancelBtn.layer.masksToBounds = YES;
        [self addSubview:_cancelBtn];
    }
    return _cancelBtn;
}

- (NSArray *)menus
{
    return @[@[@{kShareIcon:@"share_artbox",kShareTitle:@"转发"},@{kShareIcon:@"share_artchat",kShareTitle:@"艺信好友"}],
             @[@{kShareIcon:@"share_qqzone",kShareTitle:@"QQ空间"},@{kShareIcon:@"share_qq",kShareTitle:@"QQ好友"},
               @{kShareIcon:@"share_timeline",kShareTitle:@"微信朋友圈"},@{kShareIcon:@"share_wechat",kShareTitle:@"微信好友"},
               @{kShareIcon:@"share_weibo",kShareTitle:@"微博"}]];
}

@end

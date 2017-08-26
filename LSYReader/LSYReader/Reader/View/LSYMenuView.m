//
//  LSYMenuView.m
//  LSYReader
//
//  Created by Labanotation on 16/6/1.
//  Copyright © 2016年 okwei. All rights reserved.
//

#import "LSYMenuView.h"
#import "LSYTopMenuView.h"
#import "LSYBottomMenuView.h"
#import "SMQSetMenuView.h"
#define AnimationDelay 0.3f
#define TopViewHeight 64.0f
#define BottomViewHeight 130.0f
#define SettingViewHeight 300.0f
@interface LSYMenuView ()<LSYMenuViewDelegate>


@property (nonatomic, strong) SMQSetMenuView *setMenuView;

@property (nonatomic,assign)BOOL showSet;
@end
@implementation LSYMenuView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup
{
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.topView];
    [self addSubview:self.bottomView];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenSelf)]];
}
-(LSYTopMenuView *)topView
{
    if (!_topView) {
        _topView = [[LSYTopMenuView alloc] init];
        _topView.delegate = self;
    }
    return _topView;
}
-(LSYBottomMenuView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[LSYBottomMenuView alloc] init];
        _bottomView.delegate = self;
    }
    return _bottomView;
}

- (SMQSetMenuView *)setMenuView {
    if (!_setMenuView) {
        
        _setMenuView = [SMQSetMenuView loadXibView];
        _setMenuView.frame = CGRectMake(0, ViewSize(self).height, ViewSize(self).width,SettingViewHeight);
        [self addSubview:_setMenuView];
    }
    
    return _setMenuView;
}
-(void)setRecordModel:(LSYRecordModel *)recordModel
{
    _recordModel = recordModel;
    _bottomView.readModel = recordModel;
}
#pragma mark - LSYMenuViewDelegate

-(void)menuViewInvokeCatalog:(LSYBottomMenuView *)bottomMenu//目录被点击
{
    if ([self.delegate respondsToSelector:@selector(menuViewInvokeCatalog:)]) {
        [self.delegate menuViewInvokeCatalog:bottomMenu];
    }
}
-(void)menuViewJumpChapter:(NSUInteger)chapter page:(NSUInteger)page//章节跳转
{
    if ([self.delegate respondsToSelector:@selector(menuViewJumpChapter:page:)]) {
        [self.delegate menuViewJumpChapter:chapter page:page];
    }
}
-(void)menuViewFontSize:(LSYBottomMenuView *)bottomMenu//字体设置
{
    if ([self.delegate respondsToSelector:@selector(menuViewFontSize:)]) {
        [self.delegate menuViewFontSize:bottomMenu];
    }
}
-(void)menuViewMark:(LSYBottomMenuView *)bottomMenu  ///标签被点击
{
    if ([self.delegate respondsToSelector:@selector(menuViewMark:)]) {
        [self.delegate menuViewMark:bottomMenu];
    }
}

- (void)menuViewSet:(LSYBottomMenuView *)bottomMenu {//设置被点击
        //隐藏bottomView
        [self hiddenBottom:YES];
        //显示设置view
        [self showSettingView:YES];
    
}
- (void)menuViewCache:(LSYBottomMenuView *)bottomMenu {//缓存被点击
    
}
- (void)menuViewDay:(LSYBottomMenuView *)bottomMenu {//夜间按钮被点击
    
}
#pragma mark -
-(void)hiddenSelf
{
    [self hiddenAnimation:YES];
}
-(void)showAnimation:(BOOL)animation
{
    self.hidden = NO;
    [UIView animateWithDuration:animation?AnimationDelay:0 animations:^{
        _topView.frame = CGRectMake(0, 0, ViewSize(self).width, TopViewHeight);
        _bottomView.frame = CGRectMake(0, ViewSize(self).height-BottomViewHeight, ViewSize(self).width,BottomViewHeight);
    } completion:^(BOOL finished) {
        
    }];
    if ([self.delegate respondsToSelector:@selector(menuViewDidAppear:)]) {
        [self.delegate menuViewDidAppear:self];
    }
}
-(void)hiddenAnimation:(BOOL)animation
{
    [UIView animateWithDuration:animation?AnimationDelay:0 animations:^{
        _topView.frame = CGRectMake(0, -TopViewHeight, ViewSize(self).width, TopViewHeight);
        _bottomView.frame = CGRectMake(0, ViewSize(self).height, ViewSize(self).width,BottomViewHeight);
        _setMenuView.frame = CGRectMake(0, ViewSize(self).height, ViewSize(self).width,SettingViewHeight);
    } completion:^(BOOL finished) {
        self.hidden = YES;
        self.showSet = NO;
    }];
    if ([self.delegate respondsToSelector:@selector(menuViewDidHidden:)]) {
        [self.delegate menuViewDidHidden:self];
    }
}

//隐藏底部bottomView
- (void)hiddenBottom:(BOOL)animation {
    
    [UIView animateWithDuration:animation?AnimationDelay:0 animations:^{
       _bottomView.frame = CGRectMake(0, ViewSize(self).height, ViewSize(self).width,BottomViewHeight);
    } completion:^(BOOL finished) {
        
    }];
    
}
//显示设置view
- (void)showSettingView:(BOOL)animation {
    self.showSet = YES;
    self.setMenuView.backgroundColor = RGB(0, 0, 0);
    
    [UIView animateWithDuration:animation?AnimationDelay:0 animations:^{
        _setMenuView.frame = CGRectMake(0, ViewSize(self).height-SettingViewHeight, ViewSize(self).width,SettingViewHeight);
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _topView.frame = CGRectMake(0,_showSet?0:-TopViewHeight, ViewSize(self).width,TopViewHeight);
    _bottomView.frame = CGRectMake(0, ViewSize(self).height, ViewSize(self).width,BottomViewHeight);
    
}
@end

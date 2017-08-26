//
//  LSYMenuView.h
//  LSYReader
//
//  Created by Labanotation on 16/6/1.
//  Copyright © 2016年 okwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSYRecordModel.h"
#import "LSYTopMenuView.h"
@class LSYMenuView;
@class LSYBottomMenuView;
@protocol LSYMenuViewDelegate <NSObject>
@optional
-(void)menuViewDidHidden:(LSYMenuView *)menu;
-(void)menuViewDidAppear:(LSYMenuView *)menu;

-(void)menuViewJumpChapter:(NSUInteger)chapter page:(NSUInteger)page;
-(void)menuViewFontSize:(LSYBottomMenuView *)bottomMenu;
-(void)menuViewMark:(LSYBottomMenuView *)topMenu;//笔记被点击
-(void)menuViewSet:(LSYBottomMenuView *)bottomMenu;//设置被点击
-(void)menuViewCache:(LSYBottomMenuView *)bottomMenu;//缓存被点击
-(void)menuViewDay:(LSYBottomMenuView *)bottomMenu;//夜间被点击
-(void)menuViewInvokeCatalog:(LSYBottomMenuView *)bottomMenu;//目录被点击
@end
@interface LSYMenuView : UIView
@property (nonatomic,weak) id<LSYMenuViewDelegate> delegate;
@property (nonatomic,strong) LSYRecordModel *recordModel;
@property (nonatomic,strong) LSYTopMenuView *topView;
@property (nonatomic,strong) LSYBottomMenuView *bottomView;
-(void)showAnimation:(BOOL)animation;
-(void)hiddenAnimation:(BOOL)animation;
@end

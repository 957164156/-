//
//  SMQContentController.h
//  LSYReader
//
//  Created by 孙明卿 on 2017/8/24.
//  Copyright © 2017年 okwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMQReadCell.h"
@class SMQContentController;
@protocol LSYReadViewControllerDelegate <NSObject>
-(void)readViewEditeding:(SMQContentController *)readView;
-(void)readViewEndEdit:(SMQContentController *)readView;
@end
@interface SMQContentController : UICollectionViewController

@property (nonatomic,strong) NSString *content; //显示的内容
@property (nonatomic,strong) id epubFrameRef;  //epub显示内容
@property (nonatomic,strong) NSArray *imageArray;  //epub显示的图片
@property (nonatomic,assign) ReaderType type;   //文本类型
@property (nonatomic,strong) LSYRecordModel *recordModel;   //阅读进度

@property (nonatomic, strong) LSYReadModel *readModel;//阅读模型

@property (nonatomic, strong) NSURL *resourceURL;//阅读原地址

@property (nonatomic,strong) LSYReadView *readView;

@property (nonatomic,weak) id<LSYReadViewControllerDelegate>delegate;

@end

//
//  SMQReadCell.h
//  LSYReader
//
//  Created by 孙明卿 on 2017/8/24.
//  Copyright © 2017年 okwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSYReadView.h"
@interface SMQReadCell : UICollectionViewCell

@property (nonatomic,strong)LSYReadView *readView;


@property (nonatomic,strong) NSString *content; //显示的内容
@property (nonatomic,strong) id epubFrameRef;  //epub显示内容
@property (nonatomic,strong) NSArray *imageArray;  //epub显示的图片
@property (nonatomic,assign) ReaderType type;   //文本类型
@property (nonatomic,strong) LSYRecordModel *recordModel;   //阅读进度
@end

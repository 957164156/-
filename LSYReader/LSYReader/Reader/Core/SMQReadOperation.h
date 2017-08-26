//
//  SMQReadOperation.h
//  LSYReader
//
//  Created by jzb on 2017/8/25.
//  Copyright © 2017年 okwei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SMQContentController;
@class LSYReadModel;
@interface SMQReadOperation : NSObject


//获取阅读控制器
/**
 获取阅读控制器

 @param chapter 章节
 @param page 页码
 */
+ (SMQContentController *)getReadViewControllerWithChapter:(NSUInteger)chapter page:(NSUInteger)page readModel:(LSYReadModel *)model;

//获取上一个控制器
+ (SMQContentController *)getAboveReadViewControllerWithChapter:(NSUInteger)chapter page:(NSUInteger)page readModel:(LSYReadModel *)model;

+ (SMQContentController *)getNextReadViewControllerWithChapter:(NSUInteger)chapter page:(NSUInteger)page readModel:(LSYReadModel *)model;

@end

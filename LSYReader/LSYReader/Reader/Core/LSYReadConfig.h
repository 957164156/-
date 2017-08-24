//
//  LSYReadConfig.h
//  LSYReader
//
//  Created by Labanotation on 16/5/30.
//  Copyright © 2016年 okwei. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    
    effectSimulation = 0,//仿真
    effectTranslation,//平移
    effectUpAndDown//上下
    
}EffectType;
@interface LSYReadConfig : NSObject<NSCoding>
+(instancetype)shareInstance;
@property (nonatomic) CGFloat fontSize;
@property (nonatomic) CGFloat lineSpace;
@property (nonatomic,strong) UIColor *fontColor;
@property (nonatomic,strong) UIColor *theme;

//翻页类型
@property (nonatomic,assign)EffectType currentEffect;

@end

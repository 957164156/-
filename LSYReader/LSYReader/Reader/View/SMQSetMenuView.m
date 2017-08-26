//
//  SMQSetMenuView.m
//  LSYReader
//
//  Created by jzb on 2017/8/25.
//  Copyright © 2017年 okwei. All rights reserved.
//

#import "SMQSetMenuView.h"

@interface SMQSetMenuView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

static NSString *identifier = @"setMenuItem";

@implementation SMQSetMenuView

+ (instancetype)loadXibView {
    
    return [[NSBundle mainBundle] loadNibNamed:@"SMQSetMenuView" owner:nil options:nil].firstObject;
}






#pragma mark ===== UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    //为item设置颜色
    
    
    return item;
    
}

@end

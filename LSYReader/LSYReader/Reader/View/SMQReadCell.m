//
//  SMQReadCell.m
//  LSYReader
//
//  Created by 孙明卿 on 2017/8/24.
//  Copyright © 2017年 okwei. All rights reserved.
//

#import "SMQReadCell.h"

@implementation SMQReadCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //
        _readView = [[LSYReadView alloc] initWithFrame:CGRectMake(LeftSpacing,TopSpacing, self.contentView.frame.size.width-LeftSpacing-RightSpacing, self.contentView.frame.size.height-TopSpacing-BottomSpacing)];
        LSYReadConfig *config = [LSYReadConfig shareInstance];
        if (_type == ReaderEpub) {
            _readView.frameRef = (__bridge CTFrameRef)_epubFrameRef;
            _readView.imageArray = _imageArray;
        }
        else{
            _readView.frameRef = [LSYReadParser parserContent:_content config:config bouds:CGRectMake(0,0, _readView.frame.size.width, _readView.frame.size.height)];
        }
        _readView.content = _content;
        [self.contentView addSubview:_readView];
        
    }
    
    return self;
}
@end

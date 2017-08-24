//
//  SMQReadRootController.m
//  LSYReader
//
//  Created by 孙明卿 on 2017/8/24.
//  Copyright © 2017年 okwei. All rights reserved.
//

#import "SMQReadRootController.h"
#import "SMQConfig.h"
@interface SMQReadRootController ()


@property (nonatomic,strong)SMQConfig *config;
@end

@implementation SMQReadRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.config = [SMQConfig shareConfig];
    //根据当前的配置加载控制器
    [self createReadController];
    
}

- (void)createReadController {
    if (self.config.currentEffect == effectSimulation) {//仿真翻页
    //创建pageController
    
    }else {//覆盖翻页和滑动翻页
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

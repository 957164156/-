//
//  SMQContentController.m
//  LSYReader
//
//  Created by 孙明卿 on 2017/8/24.
//  Copyright © 2017年 okwei. All rights reserved.
//

#import "SMQContentController.h"
#import "LSYReadConfig.h"
@interface SMQContentController ()<LSYReadViewControllerDelegate>

@property (nonatomic, weak) UILabel *topTitle;

@end

@implementation SMQContentController

static NSString * const reuseIdentifier = @"readViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    //添加顶部的用来显示章节
    [self addHeaderTitleView];
    //添加底部用来显示电量时间
    [self addFooterTitleView];
    //设置配置
    self.collectionView.backgroundColor = [LSYReadConfig shareInstance].theme;
    self.collectionView.scrollEnabled = [LSYReadConfig shareInstance].currentEffect == effectUpAndDown ? YES : NO;//当前的翻页样式来确定是否能滚动
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    if ([LSYReadConfig shareInstance].currentEffect == effectUpAndDown) {//当前是滚动翻页
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.recordModel.page inSection:self.recordModel.chapter];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    }
    // self.clearsSelectionOnViewWillAppear = NO;
    // Register cell classes
    [self.collectionView registerClass:[SMQReadCell class] forCellWithReuseIdentifier:reuseIdentifier];
}


- (void)addHeaderTitleView {
    //
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 20)];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 20)];
    title.font = [UIFont systemFontOfSize:15.0f];
    title.textColor = [UIColor blackColor];
    self.topTitle = title;
    [header addSubview:title];
    [self.view addSubview:header];
}

- (void)addFooterTitleView {
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.recordModel.chapterCount;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([LSYReadConfig shareInstance].currentEffect == effectUpAndDown) {//滚动的
        return self.readModel.chapters[section].pageCount;
    }
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SMQReadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.readView.delegate = self;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(SMQReadCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    //在这里跟新章节,首先更新数据
    self.recordModel.chapter = indexPath.section;
    self.recordModel.page = indexPath.row;
    //保存阅读记录
    [LSYReadModel updateLocalModel:self.readModel url:self.resourceURL];
    //当前的数据
    LSYChapterModel *chaptModel = self.readModel.chapters[indexPath.section];
    //填充数据
    cell.content = [chaptModel stringOfPage:indexPath.row];
    cell.epubFrameRef = _epubFrameRef;
    cell.imageArray = _imageArray;
    cell.type = ReaderTxt;
    cell.recordModel = _recordModel;
    [cell createReadView];
}

//数据显示完毕
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(SMQReadCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([LSYReadConfig shareInstance].currentEffect == effectUpAndDown) {//上下滚动
        //
        [cell.readView removeFromSuperview];
        cell.readView = nil;
        cell.content = nil;
        cell.epubFrameRef = nil;
        cell.imageArray = nil;
        cell.recordModel = nil;
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
#pragma mark  =======  LSYReadViewControllerDelegate

-(void)readViewEditeding:(SMQContentController *)readView {
   //
    if (self.delegate && [self.delegate respondsToSelector:@selector(readViewEditeding:)]) {
        [self.delegate readViewEditeding:self];
    }
}

-(void)readViewEndEdit:(SMQContentController *)readView {
   //
    if (self.delegate && [self.delegate respondsToSelector:@selector(readViewEndEdit:)]) {
        [self.delegate readViewEndEdit:self];
}
}
@end

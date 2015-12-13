//
//  XYCollectionView.m
//  collectionView
//
//  Created by 朱海波 on 15/12/8.
//  Copyright © 2015年 朱海波. All rights reserved.
//

#import "XYCollectionView.h"
#import "CollectionReusableView.h"
#import "WaterFLayout.h"

#define SCREEN [UIScreen mainScreen].bounds.size
#define SCREEN_SCALE [UIScreen mainScreen].scale

@interface XYCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) CollectionReusableView *headerView;
@end

@implementation XYCollectionView
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self uiconfig];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self uiconfig];
    }
    return self;
}

- (void)uiconfig {
    self.delegate = self;
    self.dataSource = self;
    
    WaterFLayout *flayout = [WaterFLayout new];
    flayout.minimumColumnSpacing = 3;
    flayout.minimumInteritemSpacing = 3;
    flayout.columnCount = 3;
    self.collectionViewLayout = flayout;

    [self registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:WaterFallSectionHeader withReuseIdentifier:CollectionReusableViewIdentify];
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:WaterFallSectionHeader withReuseIdentifier:CollectionReusableViewIdentify forIndexPath:indexPath];
    self.headerView = (CollectionReusableView*)view;
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section {
    return 175 + 42;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.headerView setScrollView:scrollView];
    [self sendSubviewToBack:self.headerView];
}

@end

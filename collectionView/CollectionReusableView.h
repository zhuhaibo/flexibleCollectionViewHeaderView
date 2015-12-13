//
//  CollectionReusableView.h
//  collectionView
//
//  Created by 朱海波 on 15/12/8.
//  Copyright © 2015年 朱海波. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *CollectionReusableViewIdentify = @"CollectionReusableViewIdentify";

@interface CollectionReusableView : UICollectionReusableView
@property (nonatomic, strong) UIScrollView *scrollView;
@end

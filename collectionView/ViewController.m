//
//  ViewController.m
//  collectionView
//
//  Created by 朱海波 on 15/12/8.
//  Copyright © 2015年 朱海波. All rights reserved.
//

#import "ViewController.h"
#import "XYCollectionView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XYCollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self requestData:^(BOOL success, NSArray *arr) {
        self.collectionView.dataArray = arr;
    }];
}

- (void)requestData:(requestData)success {
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 20; i++) {
        [arr addObject:@(i)];
    }
    if (success) {
        success(YES, arr);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

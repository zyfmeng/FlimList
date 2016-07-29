//
//  ViewController.m
//  FilmScroll
//
//  Created by md on 16/6/7.
//  Copyright © 2016年 HKQ. All rights reserved.
//

#import "ViewController.h"
#import "FilmView.h"
#import "FilmScrollView.h"

@interface ViewController ()<FilmScrollViewDelegate,FilmScrollViewDataSource>
{
    FilmView *mView;
    NSMutableArray *images;
    NSString *coverString;
    NSInteger mIndex;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    images = [NSMutableArray arrayWithCapacity:10];
    //滚动电影图
    mView = [[FilmView alloc] initWithFrame:CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.width, 120)];
    mView.pageScrollView.dataSource = self;
    mView.pageScrollView.delegate = self;
    mView.pageScrollView.padding = 20;
    mView.pageScrollView.leftRightOffset = 0;
    mView.pageScrollView.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width -100)/2, 10, 100, 100);
    mView.backgroundColor = [UIColor clearColor];

    for (int i = 1; i <= 11; i++) {
        [images addObject:[NSString stringWithFormat:@"%d.jpg",i]];
    }
    if (images.count > 0) {
        coverString = images[0];
    }
    [mView.pageScrollView reloadData];
    [self.view addSubview:mView];
    

}
#pragma mark - scrollView delegate,电影滚动图
- (NSInteger)numberOfPageInPageScrollView:(FilmScrollView*)pageScrollView{
    return [images count];
}
- (UIView*)pageScrollView:(FilmScrollView*)pageScrollView viewForRowAtIndex:(int)index{
    UIView *cell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 100)];
    cell.tag = 40000+index;
    cell.backgroundColor = [UIColor purpleColor];
    ;
    UIImageView *netImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    netImageView.tag = 30000+index;
    netImageView.image = [UIImage imageNamed:images[index]];
    
    [cell addSubview:netImageView];
    if (index == 0) {
        cell.frame = CGRectMake(-5, -20, 90, 120);
        netImageView.frame = CGRectMake(-8, -20, cell.frame.size.width+8, cell.frame.size.height+20);
    }
    return cell;
}
- (CGSize)sizeCellForPageScrollView:(FilmScrollView*)pageScrollView
{
    return CGSizeMake(80, 100);
}
- (void)pageScrollView:(FilmScrollView *)pageScrollView didTapPageAtIndex:(NSInteger)index{
    mIndex = index;
    UIView *cell = (UIView *)[mView viewWithTag:40000+index];
    UIImageView *netImageView = (UIImageView *)[cell viewWithTag:30000+index];
    [UIView animateWithDuration:1 animations:^{
        netImageView.frame = CGRectMake(-8, -20, 98, 140);
        coverString = images[index];
    }];
    for (int i = 0; i < images.count; i++) {
        if (i != index) {
            UIView *cell = (UIView *)[mView viewWithTag:40000+i];
            UIImageView *netImageView = (UIImageView *)[cell viewWithTag:30000+i];
            [UIView animateWithDuration:1 animations:^{
                netImageView.frame = CGRectMake(0, 0, 80, 100);
            }];
        }
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    mIndex = index;
    UIView *cell = (UIView *)[mView viewWithTag:40000+index];
    UIImageView *netImageView = (UIImageView *)[cell viewWithTag:30000+index];
    [UIView animateWithDuration:1 animations:^{
        netImageView.frame = CGRectMake(-8, -20, 98, 140);
        coverString = images[index];
    }];
    for (int i = 0; i < images.count; i++) {
        if (i != index) {
            UIView *cell = (UIView *)[mView viewWithTag:40000+i];
            UIImageView *netImageView = (UIImageView *)[cell viewWithTag:30000+i];
            [UIView animateWithDuration:1 animations:^{
                netImageView.frame = CGRectMake(0, 0, 80, 100);
            }];
        }
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

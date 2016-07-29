//
//  FilmScrollView.h
//  FilmScroll
//
//  Created by md on 16/6/7.
//  Copyright © 2016年 HKQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmScrollView;
@protocol FilmScrollViewDelegate <UIScrollViewDelegate>
@required
- (NSInteger)numberOfPageInPageScrollView:(FilmScrollView*)pageScrollView;
@optional
- (CGSize)sizeCellForPageScrollView:(FilmScrollView*)pageScrollView;
- (void)pageScrollView:(FilmScrollView *)pageScrollView didTapPageAtIndex:(NSInteger)index;
@end

@protocol FilmScrollViewDataSource <UIScrollViewDelegate>
@required
- (UIView*)pageScrollView:(FilmScrollView *)pageScrollView viewForRowAtIndex:(int)index;
@end

@interface FilmScrollView : UIScrollView
@property (nonatomic, assign) CGSize  cellSize;

@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) float leftRightOffset;
@property (nonatomic, strong) UIImageView* backgroundView;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSArray* visibleCell;
@property (nonatomic, strong) NSMutableSet* cacheCells;
@property (nonatomic, strong) NSMutableDictionary* visibleCellsMap;
@property (nonatomic, assign) CGFloat pageViewWith;

@property (nonatomic, weak) id<FilmScrollViewDataSource> dataSource;
@property (nonatomic, weak) id<FilmScrollViewDelegate> delegate;

- (void)reloadData;
- (UIView*)viewForRowAtIndex:(NSInteger)index;


@end

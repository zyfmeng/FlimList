//
//  FilmPageView.h
//  FilmScroll
//
//  Created by md on 16/6/7.
//  Copyright © 2016年 HKQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmPageView : UIView
@property (strong, nonatomic) UIView* contentView;
@property (strong, nonatomic) UIView* selectedBackgroundView;
@property (assign, nonatomic) BOOL isSelected;
@property (strong, nonatomic) NSString* identifiy;
@property (assign, nonatomic) NSInteger index;

- (instancetype)initWithIdentifiy:(NSString*)identifiy;


@end

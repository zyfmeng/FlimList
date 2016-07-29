//
//  FilmPageView.m
//  FilmScroll
//
//  Created by md on 16/6/7.
//  Copyright © 2016年 HKQ. All rights reserved.
//

#import "FilmPageView.h"

@implementation FilmPageView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView* contentV = [UIView new];
        contentV.backgroundColor = [UIColor clearColor];
        [self setContentView:contentV];
        
        UIView* selectedV = [UIView new];
        selectedV.backgroundColor = [UIColor lightGrayColor];
        [self setSelectedBackgroundView:selectedV];
    }
    return self;
}

- (instancetype)initWithIdentifiy:(NSString*)identifiy{
    self = [super init];
    if (self) {
        _identifiy = identifiy;
    }
    return self;
}

- (void) layoutSubviews
{
    _contentView.frame = self.bounds;
    if (_isSelected) {
        _selectedBackgroundView.frame = _contentView.bounds;
        _selectedBackgroundView.hidden =  NO;
        [_contentView insertSubview:_selectedBackgroundView atIndex:0];
    }
    else
    {
        _selectedBackgroundView.hidden = YES;
    }
}

- (void) setContentView:(UIView *)contentView
{
    if (_contentView != contentView) {
        [_contentView removeFromSuperview];
        _contentView = contentView;
        [self addSubview:contentView];
        [self setNeedsLayout];
    }
}

- (void) setSelectedBackgroundView:(UIView *)selectedBackgroundView{
    if (_selectedBackgroundView != selectedBackgroundView) {
        [_selectedBackgroundView removeFromSuperview];
        _selectedBackgroundView = selectedBackgroundView;
        [self addSubview:_selectedBackgroundView];
        [self setNeedsLayout];
    }
}

- (void) setIsSelected:(BOOL)isSelected
{
    if (_isSelected != isSelected) {
        _isSelected = isSelected;
        [self setNeedsLayout];
    }
}

- (void) prepareForReused
{
    _index = NSNotFound;
    [self setIsSelected:NO];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

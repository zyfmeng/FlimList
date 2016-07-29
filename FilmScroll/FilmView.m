//
//  FilmView.m
//  FilmScroll
//
//  Created by md on 16/6/7.
//  Copyright © 2016年 HKQ. All rights reserved.
//

#import "FilmView.h"

@implementation FilmView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pageScrollView = [[FilmScrollView alloc] init];
        [self.pageScrollView setPagingEnabled:YES];
        [self.pageScrollView setClipsToBounds:NO];
        self.pageScrollView.pageViewWith = self.frame.size.width;
        [self addSubview:self.pageScrollView];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!CGRectContainsPoint(self.pageScrollView.frame, point)) {
        return self.pageScrollView;
    }
    return [super hitTest:point withEvent:event];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

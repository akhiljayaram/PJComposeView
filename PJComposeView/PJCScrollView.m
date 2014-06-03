//
//  PJCScrollView.m
//  PJComposerTrial
//
//  Created by user on 5/26/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import "PJCScrollView.h"

@implementation PJCScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubViews];
    }
    return self;
}


- (void) setUpSubViews
{

    
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

    self.mainContainerView = [[PJCContentVIew alloc]initWithFrame:frame];

    self.mainContainerView.delegate = self;
    self.mainContainerView.composeDelegate = self.composeDelegate;

    [self addSubview:self.mainContainerView];
    self.mainContainerView.frame = frame;

}
- (void)updatedScrollContainerFrame
{
    self.contentSize = self.mainContainerView.frame.size;

}

- (void)addHeaderView:(UIView *)headerView
{
    [self.mainContainerView addHeaderView:headerView];
}
- (void)addFooterView:(UIView *)footerView
{
    [self.mainContainerView addFooterView:footerView];
}
- (void)addComposingView:(UIView *)composingView
{
    [self.mainContainerView addComposingView:composingView];
}

- (void)textViewCursorPositionChanged:(CGFloat)cursorPosition
{
    CGFloat differenceInCursorHeight = cursorPosition  - self.frame.size.height;
    
    if(differenceInCursorHeight>0 && (differenceInCursorHeight != INFINITY))
    {
        self.contentOffset = CGPointMake(0, differenceInCursorHeight);
    }
}
- (void)scrollToBottom
{
    CGFloat offsetHeight = self.contentSize.height - self.bounds.size.height;
    if(offsetHeight > 0 )
    {
        CGPoint bottomOffset = CGPointMake(0, offsetHeight);
        [self setContentOffset:bottomOffset animated:YES];
    }
}
@end

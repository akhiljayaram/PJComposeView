//
//  PJCContentVIew.m
//  PJComposerTrial
//
//  Created by user on 5/26/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import "PJCContentVIew.h"
#define MIN_TEXT_VIEW_HEIGHT 50
@implementation PJCContentVIew
{
    
}

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
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, 0);
    self.headerContainerView = [[UIView alloc]initWithFrame:frame ];
    [self addSubview:self.headerContainerView];
    self.textViewContainerView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:self.textViewContainerView];
    [self setupTextviewContainerView];
    self.footerContainerView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:self.footerContainerView];
    [self updateAllSubviewFrames];
  }

- (void)setupTextviewContainerView
{
    CGRect frame = CGRectMake(0, 0, self.frame.size.width,50);
    self.mainTextView = [[UITextView alloc]initWithFrame:frame];
    self.mainTextView.scrollEnabled = NO;
    self.mainTextView.delegate = self;
    [self.textViewContainerView addSubview:self.mainTextView];
    
    CGRect placeHolderFrame = CGRectMake(5, 5, self.frame.size.width-10,20);
    self.placeholderLabel = [[UILabel alloc]initWithFrame:placeHolderFrame];
    [self.textViewContainerView addSubview:self.placeholderLabel];
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];

    self.placeholderLabel.hidden = YES;

    
    self.textViewContainerView.frame = frame;

}

-(void)setPlaceholderLabelText:(NSString *)placeholderLabelText
{
    self.placeholderLabel.text = placeholderLabelText;
    [self updatePlaceHolderVisibility];

}
- (CGRect)rectWithHeight:(CGFloat)height belowFrame:(CGRect)rect inFrame:(CGRect)parentFrame
{
    return CGRectMake(0, rect.origin.y+rect.size.height,parentFrame.size.width, height);
}

- (void)addHeaderView:(UIView *)headerView
{
    [self.headerContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.headerContainerView addSubview:headerView];
    [self updateFrameOfParentView:self.headerContainerView withChildView:headerView];
    
    
}
- (void)addFooterView:(UIView *)footerView
{
    [self.footerContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.footerContainerView addSubview:footerView];
    [self updateFrameOfParentView:self.footerContainerView withChildView:footerView];
}

- (void)addComposingView:(UIView *)composingView
{
    [self.textViewContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    self.textViewContainerView = composingView;
    for (UIView *v in self.textViewContainerView.subviews) {
        if([v isKindOfClass:[UITextView class]])
            {
                self.mainTextView = (UITextView *)v;
            }
    }
    self.mainTextView.scrollEnabled = NO;
    self.mainTextView.delegate = self;
    [self updateFrameOfParentView:self.textViewContainerView withChildView:composingView];

}

- (void)updateFrameOfParentView:(UIView *)parentView withChildView:(UIView *)childView
{
    CGRect parentFrame = parentView.frame;
    CGRect childFrame = childView.frame;
    parentFrame.size.height = childFrame.size.height;
    parentView.frame = parentFrame;
    [self updateAllSubviewFrames];
}

- (void)updateAllSubviewFrames
{

    CGRect headerContainerViewFrame = self.headerContainerView.frame;
    CGRect textviewContainerViewFrame = self.textViewContainerView.frame;
    CGRect footerContainerViewFrame = self.footerContainerView.frame;
    textviewContainerViewFrame.origin.y = headerContainerViewFrame.origin.y+headerContainerViewFrame.size.height;
    self.textViewContainerView.frame = textviewContainerViewFrame;

    footerContainerViewFrame.origin.y = textviewContainerViewFrame.origin.y+textviewContainerViewFrame.size.height;
    self.footerContainerView.frame = footerContainerViewFrame;
    [self updateFrame];

}

- (void)updateFrame
{
    CGRect containerFrame = self.frame;
    containerFrame.size.height = self.headerContainerView.frame.size.height +  self.textViewContainerView.frame.size.height + self.footerContainerView.frame.size.height;
    self.frame = containerFrame;
    [self.delegate updatedScrollContainerFrame];
}


- (void)updateMainTextViewSize
{
    CGRect textViewFrame = self.mainTextView.frame;
    CGRect textViewContainerViewFrame = self.textViewContainerView.frame;
    CGFloat heightDiff = textViewContainerViewFrame.size.height - textViewFrame.size.height;
    CGSize textViewSize = [self.mainTextView sizeThatFits:CGSizeMake(self.mainTextView.frame.size.width, FLT_MAX)];
    if(textViewSize.height<MIN_TEXT_VIEW_HEIGHT)
    {
        textViewSize.height = MIN_TEXT_VIEW_HEIGHT;
    }

    textViewFrame.size.height = textViewSize.height;
    textViewContainerViewFrame.size.height = textViewSize.height+heightDiff;
    self.mainTextView.frame = textViewFrame;
    self.textViewContainerView.frame = textViewContainerViewFrame;
    [self updateAllSubviewFrames];
    [self adjustScrollViewOffsetWithTextView:self.mainTextView];

}

- (void)adjustScrollViewOffsetWithTextView:(UITextView *)textView
{
    CGRect textViewContainerViewFrame = self.textViewContainerView.frame;
    CGFloat textViewContainerViewPositionY = textViewContainerViewFrame.origin.y;
    
    CGRect cursorRect = [textView caretRectForPosition:textView.selectedTextRange.end];
    CGFloat cursorPositionY = cursorRect.origin.y;
    CGFloat cursorPosition = (textViewContainerViewPositionY+cursorPositionY+20);
    [self.delegate textViewCursorPositionChanged:cursorPosition];
    
}








#pragma mark textview delegates




- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.composeDelegate composeViewDidBeginEditing:textView];

}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self.composeDelegate composeViewDidEndEditing:textView];
}


- (void)updatePlaceHolderVisibility
{
    if(self.placeholderLabel.text != nil && ![self.placeholderLabel.text isEqualToString:@""])
    {
        if([self.mainTextView.text isEqualToString:@""])
        {
            self.placeholderLabel.hidden = NO;
        }
        else
        {
            self.placeholderLabel.hidden = YES;
        }
    }
    
}

- (void)textViewDidChange:(UITextView *)textView
{
   
    [self updatePlaceHolderVisibility];
    [self updateMainTextViewSize];
    [self.composeDelegate composeViewDidChange:textView];

    
}
- (void)textViewDidChangeSelection:(UITextView *)textView
{
    [self updateMainTextViewSize];
    [self.composeDelegate composeViewDidChangeSelection:textView];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([self.composeDelegate respondsToSelector:@selector(composeViewShouldBeginEditing:)] )
    {
        return [self.composeDelegate composeViewShouldBeginEditing:textView];
    }
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if ([self.composeDelegate respondsToSelector:@selector(composeViewShouldEndEditing:)] )
    {
        return [self.composeDelegate composeViewShouldEndEditing:textView];
    }
    return YES;

}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([self.composeDelegate respondsToSelector:@selector(composeView:shouldChangeTextInRange: replacementText:)] )
    {
        return [self.composeDelegate composeView:textView shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    if ([self.composeDelegate respondsToSelector:@selector(composeView:shouldInteractWithURL: inRange:)] )
    {
        return [self.composeDelegate composeView:textView shouldInteractWithURL:URL inRange:characterRange];
    }
    return NO;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    if ([self.composeDelegate respondsToSelector:@selector(composeView:shouldInteractWithTextAttachment: inRange:)] )
    {
        return [self.composeDelegate composeView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
    }
    return NO;
}
@end

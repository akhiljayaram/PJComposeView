//
//  PJComposeView.m
//  PJComposerTrial
//
//  Created by user on 5/20/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import "PJComposeView.h"

@implementation PJComposeView
{
    CGFloat keyBoardIntrudingHeight;
    CGFloat keyBoardHeight;
    
    PJCScrollView *mainScrollView;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
- (id) initWithCoder:(NSCoder*)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])){
    }
    return self;
}



- (void) setUpSubViews
{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(0, 0);
    mainScrollView = [[PJCScrollView alloc]initWithFrame:frame];
    mainScrollView.composeDelegate = self.composeDelegate;
    [self addSubview:mainScrollView];
    [self registerForKeyboardNotifications];
    [self setScrollViewHeightWhileKeyBoardNotVisible];

}


- (UITextView *) getComposeTextView
{
    return mainScrollView.mainContainerView.mainTextView;
}
- (void)addHeaderView:(UIView *)headerView
{
    [mainScrollView addHeaderView:headerView];
}
- (void)addFooterView:(UIView *)footerView
{
    [mainScrollView addFooterView:footerView];
}
- (void)addComposingView:(UIView *)composingView
{
    [mainScrollView addComposingView:composingView];
}

#pragma mark - Keyboard events


- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}


- (void)setUpkeyboardIntrudingHeight:(CGFloat)keyboardHeight
{
    keyBoardIntrudingHeight = keyboardHeight - (self.superview.frame.size.height - (self.frame.size.height +  self.frame.origin.y)) ;

}

- (void)UnRegisterForKeyboardNotifications
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}


// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* keyboardInfo = [aNotification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    keyBoardHeight = keyboardFrameBeginRect.size.height;
    [self setUpkeyboardIntrudingHeight:keyBoardHeight];

    [self setScrollViewHeightWhileKeyBoardVisible];
    
}


// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    
    [self setScrollViewHeightWhileKeyBoardNotVisible];
    
}

- (void)setScrollViewHeightWhileKeyBoardVisible
{
    if(keyBoardIntrudingHeight>0 && self.frame.origin.y < self.superview.frame.size.height - keyBoardHeight)
    {
    CGRect scrollViewFrame = mainScrollView.frame;
    scrollViewFrame.size.height = self.frame.size.height - keyBoardIntrudingHeight;
    mainScrollView.frame = scrollViewFrame;
    }
}


- (void)setScrollViewHeightWhileKeyBoardNotVisible
{
    CGRect scrollViewFrame = mainScrollView.frame;
    scrollViewFrame.size.height = self.frame.size.height;
    mainScrollView.frame = scrollViewFrame;
}
- (void)scrollToBottom
{
    [mainScrollView scrollToBottom];
}
- (void)resignFirstResponder
{
    [mainScrollView.mainContainerView.mainTextView resignFirstResponder];
}

- (void)setFont:(UIFont *)font
{
    self.font = font;
    mainScrollView.mainContainerView.mainTextView.font = font;
}

- (void)setText:(NSString *)text
{
    self.text = text;
    mainScrollView.mainContainerView.mainTextView.text = text;
 
}
- (void)setTextColor:(UIColor *)textColor
{
    self.textColor = textColor;
    mainScrollView.mainContainerView.mainTextView.textColor = textColor;
    
}
- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.backgroundColor = backgroundColor;
    mainScrollView.backgroundColor = backgroundColor;
    
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    self.textAlignment = textAlignment;
    mainScrollView.mainContainerView.mainTextView.textAlignment = textAlignment;

}
- (void)setSelectedRange:(NSRange)selectedRange
{
    self.selectedRange = selectedRange;
    mainScrollView.mainContainerView.mainTextView.selectedRange = selectedRange;
    
}

- (UIFont *)getFont
{
    return mainScrollView.mainContainerView.mainTextView.font;
}

- (NSString *)getText
{
    return mainScrollView.mainContainerView.mainTextView.text;

}





@end

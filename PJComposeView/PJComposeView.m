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
        [self setUpSubViews];

    }
    return self;
}
- (id) initWithCoder:(NSCoder*)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])){
        [self setUpSubViews];
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
    [mainScrollView.mainContainerView.placeholderLabel becomeFirstResponder];
}

- (void)setComposeFont:(UIFont *)font
{
    mainScrollView.mainContainerView.mainTextView.font = font;
}

- (void)setText:(NSString *)text
{
    mainScrollView.mainContainerView.mainTextView.text = text;
 
}
- (void)setComposeTextColor:(UIColor *)textColor
{
    mainScrollView.mainContainerView.mainTextView.textColor = textColor;
    
}
- (void)setComposeBackgroundColor:(UIColor *)backgroundColor
{
    mainScrollView.mainContainerView.mainTextView.backgroundColor = backgroundColor;
    
}
- (void)setComposeTextAlignment:(NSTextAlignment)textAlignment
{
    mainScrollView.mainContainerView.mainTextView.textAlignment = textAlignment;

}
- (void)setComposeSelectedRange:(NSRange)selectedRange
{
    mainScrollView.mainContainerView.mainTextView.selectedRange = selectedRange;
    
}
- (void)setComposeInputView:(UIView *)inputView
{
     mainScrollView.mainContainerView.mainTextView.inputView = inputView;
    
}
- (void)setComposeInputAccessoryView:(UIView *)inputAccessoryView
{
    mainScrollView.mainContainerView.mainTextView.inputAccessoryView = inputAccessoryView;
    
}
-(void)setPlaceHolderText:(NSString *)placeholderLabelText
{
    mainScrollView.mainContainerView.placeholderLabelText = placeholderLabelText;

    
}

- (UIFont *)getComposeFont
{
    return mainScrollView.mainContainerView.mainTextView.font;
}

- (NSString *)getText
{
    return mainScrollView.mainContainerView.mainTextView.text;

}
- (UIColor *)getComposeTextColor
{
    return mainScrollView.mainContainerView.mainTextView.textColor;
    
}
- (UIColor *)getComposeBackgroundColor
{
    return mainScrollView.backgroundColor;
    
}
- (NSTextAlignment)setComposeTextAlignment
{
    return mainScrollView.mainContainerView.mainTextView.textAlignment;
    
}
- (NSRange)getComposeSelectedRange
{
   return  mainScrollView.mainContainerView.mainTextView.selectedRange;
    
}
- (UIView *)getComposeInputView
{
   
   return mainScrollView.mainContainerView.mainTextView.inputView ;
    
}
- (UIView *)getComposeInputAccessoryView
{
    
    return mainScrollView.mainContainerView.mainTextView.inputAccessoryView ;
    
}

@end

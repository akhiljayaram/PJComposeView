//
//  PJComposeView.h
//  PJComposerTrial
//
//  Created by user on 5/20/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJCScrollView.h"
@interface PJCComposeView : UIView


@property (assign, nonatomic) id<PJCComposeDelegate> composeDelegate;

@property(nonatomic,copy) NSString *text;
@property(nonatomic,retain) UIFont *font;
@property(nonatomic,retain) UIColor *textColor;
@property (strong, nonatomic) UIColor *backgroundColor;

@property(nonatomic) NSTextAlignment textAlignment;  
@property(nonatomic) NSRange selectedRange;

@property (readwrite, retain) UIView *inputView;
@property (readwrite, retain) UIView *inputAccessoryView;

- (void) setUpSubViews;
- (UITextView *) getComposeTextView;
- (void)addHeaderView:(UIView *)headerView;
- (void)addFooterView:(UIView *)footerView;
- (void)addComposingView:(UIView *)composingView;

- (void)resignFirstResponder;
@end




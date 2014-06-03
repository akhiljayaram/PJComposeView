//
//  PJComposeView.h
//  PJComposerTrial
//
//  Created by user on 5/20/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJCScrollView.h"
@interface PJComposeView : UIView


@property (assign, nonatomic) id<PJCComposeDelegate> composeDelegate;

@property(nonatomic,copy) NSString *text;
@property(nonatomic,retain) UIFont *composeFont;
@property(nonatomic,retain) UIColor *composeTextColor;
@property (strong, nonatomic) UIColor *composeBackgroundColor;

@property(nonatomic) NSTextAlignment composeTextAlignment;
@property(nonatomic) NSRange composeSelectedRange;

@property (nonatomic, retain) UIView *composeInputView;
@property (nonatomic, retain) UIView *composeInputAccessoryView;
@property (nonatomic, retain) NSString *placeHolderText;

- (void) setUpSubViews;
- (UITextView *) getComposeTextView;
- (void)addHeaderView:(UIView *)headerView;
- (void)addFooterView:(UIView *)footerView;
- (void)addComposingView:(UIView *)composingView;
- (void)resignFirstResponder;
@end




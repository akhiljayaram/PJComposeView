//
//  PJCContentVIew.h
//  PJComposerTrial
//
//  Created by user on 5/26/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PJCComposeTextDelegate

@required

- (void)updatedScrollContainerFrame;
- (void)textViewCursorPositionChanged:(CGFloat)cursorPosition;

@end

@protocol PJCComposeDelegate<NSObject>

@optional
- (BOOL)composeViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)composeViewShouldEndEditing:(UITextView *)textView;

- (void)composeViewDidBeginEditing:(UITextView *)textView;
- (void)composeViewDidEndEditing:(UITextView *)textView;

- (BOOL)composeView:(UITextView *)composeView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)composeViewDidChange:(UITextView *)composeView;

- (void)composeViewDidChangeSelection:(UITextView *)composeView;

- (BOOL)composeView:(UITextView *)composeView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0);
- (BOOL)composeView:(UITextView *)composeView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0);
@end



@interface PJCContentVIew : UIView <UITextViewDelegate>
@property (strong, nonatomic) UIView *headerContainerView;
@property (strong, nonatomic) UIView *footerContainerView;

@property (strong, nonatomic) UIView *textViewContainerView;
@property (strong, nonatomic) UITextView *mainTextView;
@property (strong, nonatomic) UILabel *placeholderLabel;
@property (strong, nonatomic) NSString *placeholderLabelText;

@property (assign, nonatomic) id<PJCComposeTextDelegate> delegate;
@property (assign, nonatomic) id<PJCComposeDelegate> composeDelegate;

- (void)addHeaderView:(UIView *)headerView;
- (void)addFooterView:(UIView *)footerView;
- (void)addComposingView:(UIView *)composingView;

- (void) setUpSubViews;

@end

//
//  PJCScrollView.h
//  PJComposerTrial
//
//  Created by user on 5/26/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJCContentVIew.h"
@interface PJCScrollView : UIScrollView <PJCComposeTextDelegate>


@property (strong, nonatomic) PJCContentVIew *mainContainerView;
@property (assign, nonatomic) id<PJCComposeDelegate> composeDelegate;
- (void)addHeaderView:(UIView *)headerView;
- (void)addFooterView:(UIView *)footerView;
- (void)addComposingView:(UIView *)composingView;
- (void)scrollToBottom;

- (void) setUpSubViews;

@end



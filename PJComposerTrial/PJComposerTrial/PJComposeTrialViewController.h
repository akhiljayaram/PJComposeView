//
//  PJComposeTrialViewController.h
//  PJComposerTrial
//
//  Created by user on 5/20/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJCComposeView.h"
@interface PJComposeTrialViewController : UIViewController <PJCComposeDelegate>

@property (strong, nonatomic) IBOutlet PJCComposeView *composeView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *textContainerView;

- (IBAction)onTappedinView:(id)sender;


@end

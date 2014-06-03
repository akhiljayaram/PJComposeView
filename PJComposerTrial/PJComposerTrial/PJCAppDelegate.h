//
//  PJCAppDelegate.h
//  PJComposerTrial
//
//  Created by user on 5/20/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJComposeTrialViewController.h"
@interface PJCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) PJComposeTrialViewController *composeVC;

@end

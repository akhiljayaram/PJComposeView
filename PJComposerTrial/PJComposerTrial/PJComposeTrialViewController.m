//
//  PJComposeTrialViewController.m
//  PJComposerTrial
//
//  Created by user on 5/20/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import "PJComposeTrialViewController.h"
#define KEY_BOARD_HEIGHT   261
#define IMAGE_VIEW_TOP_MARGIN   15
#define TEXT_SIZE_OFFSET   25
#define SCROLL_VIEW_BOTTOM_OFFSET   45
#define SCROLL_VIEW_BOTTOM_SIZE   125
@interface PJComposeTrialViewController ()

@end

@implementation PJComposeTrialViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.composeView setUpSubViews];
    self.composeView.composeDelegate = self;
    [self.composeView addHeaderView:self.headerView];
    [self.composeView addFooterView:self.footerView];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}























- (IBAction)onTappedinView:(id)sender {
    [self.composeView resignFirstResponder];
}
@end

//
//  PJCViewControllerttttt.m
//  PJComposerTrial
//
//  Created by user on 5/26/14.
//  Copyright (c) 2014 akhiljayaram. All rights reserved.
//

#import "PJCViewControllerttttt.h"

@interface PJCViewControllerttttt ()

@end

@implementation PJCViewControllerttttt

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
    // Do any additional setup after loading the view.
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    keyBoardIntrudingHeight = KEY_BOARD_HEIGHT - (self.view.frame.size.height - (self.scrollParentView.frame.size.height +  self.scrollParentView.frame.origin.y)) ;
//    self.scrollView.contentSize = self.scrollContainerView.frame.size;
//    [self updateImageViewFrameOrigin];
//    [self setScrollViewHeightWhileKeyBoardNotVisible];
//    [self registerForKeyboardNotifications];
//    self.plusLabel.hidden = YES;
//    [self setLabelData];
//}
//
//
//- (void)setScrollViewHeightWhileKeyBoardVisible
//{
//    CGRect scrollViewFrame = self.scrollView.frame;
//    scrollViewFrame.size.height = self.scrollParentView.frame.size.height - keyBoardIntrudingHeight;
//    self.scrollView.frame = scrollViewFrame;
//}
//
//
//- (void)setScrollViewHeightWhileKeyBoardNotVisible
//{
//    CGRect scrollViewFrame = self.scrollView.frame;
//    scrollViewFrame.size.height = self.scrollParentView.frame.size.height;
//    self.scrollView.frame = scrollViewFrame;
//}
//
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [self UnRegisterForKeyboardNotifications];
//}
//
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//}
//
//
//#pragma mark private methods
//
//
//- (void)scrollToBottom
//{
//    CGFloat offsetHeight = self.scrollView.contentSize.height - self.scrollView.bounds.size.height;
//    if(offsetHeight > 0 )
//    {
//        CGPoint bottomOffset = CGPointMake(0, offsetHeight);
//        [self.scrollView setContentOffset:bottomOffset animated:YES];
//    }
//}
//
//
//- (void)fetchMessageUsersWithIndicator:(BOOL)indicatorFlag
//{
//    [FUMessagesAPIManager getMessageUsersWithSuccess:^(id object)
//     {
//         NSDictionary *responseDictionary = (NSDictionary *)object;
//         NSArray *tempArray;
//         tempArray = [responseDictionary objectForKey:FOLLOWERS];
//         _fuzersArray = [self getUsersFromArray:tempArray];
//         
//         NSArray *followings;
//         followings = [responseDictionary objectForKey:FOLLOWINGS];
//         NSMutableArray *messageUsers = [NSMutableArray array];
//         [messageUsers addObjectsFromArray:tempArray];
//         [messageUsers addObjectsFromArray:followings];
//         
//         NSOrderedSet *mySet = [[NSOrderedSet alloc] initWithArray:messageUsers];
//         messageUsers = [[NSMutableArray alloc] initWithArray:[mySet array]];
//         
//         _usersArray = [self getUsersFromArray:messageUsers];
//         
//     }
//                                             andFail:^(NSString *errorMessage)
//     {
//         
//     }
//                                 needToShowIndicator:indicatorFlag];
//}
//
//
//- (NSArray *)getUsersFromArray:(NSArray *)tempArray
//{
//    NSMutableArray *userArray = [NSMutableArray array];
//    for (NSDictionary *dictionary in tempArray)
//    {
//        FUUser *user = [FUUser createUserWithData:dictionary];
//        [userArray addObject:user];
//    }
//    return userArray;
//}
//
//
//- (void)setMessageRecipients
//{
//    for (FUUser *user in self.conversationUsersArray)
//    {
//        [messageRecipients addObject:user.userID];
//    }
//}
//
//
//- (IBAction)tappedOnTitleView:(id)sender
//{
//    [self.textView resignFirstResponder];
//}
//
//
//- (IBAction)closeButtonTapped:(id)sender
//{
//    [self.textView resignFirstResponder];
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
//
//- (void)setLabelData
//{
//    NSInteger count = 0;
//    count = _conversationUsersArray.count;
//    
//    FUUser *firstuser;
//    FUUser *secondUser;
//    
//    if (count > 0)
//    {
//        firstuser = _conversationUsersArray[0];
//        self.toNameLabel.text = [NSString stringWithFormat:@"%@", firstuser.firstName];
//    }
//    
//    if (count > 1)
//    {
//        secondUser = _conversationUsersArray[1];
//        self.toNameLabel.text = [NSString stringWithFormat:@"%@, %@", firstuser.firstName, secondUser.firstName];
//    }
//    
//    if (count > 2)
//    {
//        count -= 2;
//        self.plusLabel.hidden = NO;
//        self.countLabel.hidden = NO;
//        self.countLabel.text = [NSString stringWithFormat:@"%ld more..", (long)count];
//    }
//    else
//    {
//        self.plusLabel.hidden = YES;
//        self.countLabel.hidden = YES;
//    }
//    
//    if (count <= 0)
//    {
//        self.toNameLabel.text = @"Recipient Name(s)";
//    }
//}
//
//
//-(void)showBottomView:(BOOL)show
//{
//    CGRect imageandVidContFrame = self.imageAndVideoContainerView.frame;
//    CGFloat imageFrameHeight = imageandVidContFrame.size.height;
//    
//    if(show && imageFrameHeight >0)
//    {
//        return;
//    }
//    
//    if(!show && imageFrameHeight == 0)
//    {
//        return;
//    }
//    
//    CGFloat height = 0;
//    
//    if(show)
//    {
//        height = SCROLL_VIEW_BOTTOM_SIZE;
//    }
//    
//    imageandVidContFrame.size.height =height;
//    self.imageAndVideoContainerView.frame = imageandVidContFrame;
//    CGRect scrollViewContainerFrame = self.scrollContainerView.frame ;
//    int direction = (show)?1:-1;
//    
//    scrollViewContainerFrame.size.height = scrollViewContainerFrame.size.height+(direction*SCROLL_VIEW_BOTTOM_SIZE);
//    self.scrollContainerView.frame = scrollViewContainerFrame;
//    self.scrollView.contentSize = self.scrollContainerView.frame.size;
//}
//
//
//- (IBAction)headerViewTapped:(id)sender
//{
//    [self.textView resignFirstResponder];
//    [self.videoURLTextField resignFirstResponder];
//    _recipientsVC = [[FUmessageRecipientsViewController alloc] initWithNibName:@"FUmessageRecipientsViewController" bundle:nil];
//    _recipientsVC.conversationRecipientsArray = _conversationUsersArray;
//    _recipientsVC.disableSearchFilter = NO;
//    if ([self.filterTextField.text isEqualToString:MESSAGE_COMPOSE_USERS]) {
//        _recipientsVC.userArrayToSearch = _usersArray;
//    }
//    else if ([self.filterTextField.text isEqualToString:MESSAGE_COMPOSE_FUZERS]) {
//        _recipientsVC.userArrayToSearch = _fuzersArray;
//    }
//    _recipientsVC.delegate = self;
//    
//    CGRect recipientsVCFrame = _recipientsVC.view.frame;
//    recipientsVCFrame.origin = CGPointMake(0, 0);
//    _recipientsVC.view.center = [[FUAppDelegate application] window].center;
//    [[[FUAppDelegate application] window] addSubview:_recipientsVC.view];
//}
//
//
//- (IBAction)attachImageButtonTapped:(id)sender
//{
//    [self.textView resignFirstResponder];
//    [self.videoURLTextField resignFirstResponder];
//    
//    [self.attachImageButton setSelected:YES];
//    [self.footerAttachImageButton setSelected:YES];
//    [self.footerAttachVideoButton setSelected:NO];
//    [self.attachVideoButton setSelected:NO];
//    [self.videoURLTextField setHidden:YES];
//    [self.videoURLTextField setText:@""];
//    UIActionSheet *actionSheet = [[UIActionSheet alloc]
//                                  initWithTitle:@""
//                                  delegate:self
//                                  cancelButtonTitle:@"Cancel"
//                                  destructiveButtonTitle:nil
//                                  otherButtonTitles:MESSAGE_REPLY_VC_TAKE_PHOTO, MESSAGE_REPLY_VC_CHOOSE_PHOTO, nil];
//    [actionSheet showInView:self.view];
//    
//    if([self.imageContainerView isHidden])
//    {
//        [self showBottomView:NO];
//    }
//    
//    [self scrollToBottom];
//    
//}
//
//
//- (IBAction)attachVideoTapped:(id)sender
//{
//    [self.attachImageButton setSelected:NO];
//    [self.footerAttachImageButton setSelected:NO];
//    [self removeImage:self];
//    storyImageUrl = @"";
//    imageNameToPost = @"";
//    
//    if([self.attachVideoButton isSelected] && [self.footerAttachVideoButton isSelected])
//    {
//        [self showBottomView:NO];
//        [self.attachVideoButton setSelected:NO];
//        [self.footerAttachVideoButton setSelected:NO];
//        [self.videoURLTextField setHidden:YES];
//        [self.videoURLTextField resignFirstResponder];
//        [self.videoURLTextField setText:@""];
//    }
//    else
//    {
//        [self showBottomView:YES];
//        
//        [self.attachVideoButton setSelected:YES];
//        [self.footerAttachVideoButton setSelected:YES];
//        [self.videoURLTextField setHidden:NO];
//        [self.videoURLTextField becomeFirstResponder];
//    }
//    
//    [self scrollToBottom];
//}
//
//
//- (void)updateImageViewFrameOrigin
//{
//    CGRect textViewContainerFrame = self.textViewContainerView.frame;
//    CGFloat textViewContainerFrameOriginY = textViewContainerFrame.origin.y;
//    CGFloat textViewContainerFrameHeight = textViewContainerFrame.size.height;
//    
//    CGRect imageViewFrame = self.imageAndVideoContainerView.frame;
//    imageViewFrame.origin.y = textViewContainerFrameOriginY+textViewContainerFrameHeight+IMAGE_VIEW_TOP_MARGIN;
//    self.imageAndVideoContainerView.frame = imageViewFrame;
//    
//}
//
//
//- (void)updateReplyTextViewSize
//{
//    CGRect textViewFrame = self.textView.frame;
//    CGRect textViewContainerViewFrame = self.textViewContainerView.frame;
//    CGFloat heightDiff = textViewContainerViewFrame.size.height - textViewFrame.size.height;
//    CGSize textViewSize = [self.textView sizeThatFits:CGSizeMake(self.textView.frame.size.width, FLT_MAX)];
//    
//    textViewFrame.size.height = textViewSize.height;
//    textViewContainerViewFrame.size.height = textViewSize.height+heightDiff;
//    
//    self.textView.frame = textViewFrame;
//    self.textViewContainerView.frame = textViewContainerViewFrame;
//}
//
//
//- (IBAction)removeImage:(id)sender
//{
//    [self.attachImageButton setSelected:NO];
//    [self.footerAttachImageButton setSelected:NO];
//    [self.imageContainerView setHidden:YES];
//    self.imageView.image = [UIImage imageNamed:IMAGE_SIGNUP_ADD_PROFILE_PLACEHOLDER];
//    [self showBottomView:NO];
//}
//
//
//- (IBAction)sendMessageTapped:(id)sender
//{
//    if ([FUUtility isEmptyString:self.textView.text] && [self.imageContainerView isHidden] && [self.videoURLTextField isHidden])
//    {
//        [FUUtility showAlert:nil withCustomMessage:MESSAGE_ALERT_NO_CONTENT havingOkButton:ALERT_BUTTON_OK andCancelButton:nil];
//        
//    }
//    else if (self.videoURLTextField.hidden == NO)
//    {
//        if ([FUUtility isEmptyString:self.videoURLTextField.text])
//        {
//            [FUUtility showAlert:nil withCustomMessage:MESSAGE_ALERT_PLEASE_PROVIDE_A_VIDEO_URL havingOkButton:ALERT_BUTTON_OK andCancelButton:nil];
//        }
//        else
//        {
//            [self postMessage];
//        }
//    }
//    else
//    {
//        [self postMessage];
//    }
//}
//
//
//- (void)postMessage
//{
//    NSMutableArray *userIDArray = [NSMutableArray array];
//    if (_conversationUsersArray.count == 0)
//    {
//        if ([self.filterTextField.text isEqualToString:MESSAGE_COMPOSE_FUZERS])
//        {
//            _conversationUsersArray = [NSMutableArray arrayWithArray:_fuzersArray];
//        }
//    }
//    
//    for (FUUser *user in self.conversationUsersArray)
//    {
//        [userIDArray addObject:user.userID];
//    }
//    
//    NSString *messagetext = [NSString notNullAndWhiteSpaceTrimmedString:self.textView.text];
//    messagetext = [messagetext stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    
//    if (userIDArray.count > 0)
//    {
//        [FUMessagesAPIManager postMessageWithRecipients:userIDArray messageText:messagetext imageName:imageNameToPost andVideoUrl:self.videoURLTextField.text withSuccess:^(id object)
//         {
//             NSDictionary *responseDictionary = (NSDictionary *)object;
//             NSNumber *errorCode =  [responseDictionary objectForKey:API_RESPONSE_ERROR_CODE_KEY];
//             
//             if ( [errorCode isEqualToNumber:[NSNumber numberWithInteger:API_SUCCESS_CODE]])
//             {
//                 [self.textView resignFirstResponder];
//                 [self dismissViewControllerAnimated:YES completion:nil];
//             }
//             
//             else
//             {
//                 NSString *message = [responseDictionary objectForKey:API_MESSAGE_FIELD_KEY];
//                 [FUUtility showAlert:ALERT_TITLE_ERROR withCustomMessage:message havingOkButton:ALERT_BUTTON_OK andCancelButton:nil];
//             }
//             
//         }
//                                                andFail:^(NSString *errorMessage)
//         {
//         }];
//    }
//    else
//    {
//        [FUUtility showAlert:nil withCustomMessage:MESSAGE_ADD_RECIPIENT_MESSAGE havingOkButton:ALERT_BUTTON_OK andCancelButton:nil];
//    }
//}
//
//
//#pragma mark - UIActionSheetDelegate method implementation
//
//
//- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    switch (buttonIndex)
//    {
//        case 0:
//            [self useCamera];
//            break;
//            
//        case 1:
//            [self useCameraRoll];
//            break;
//            
//        case 2:
//            if([self.imageContainerView isHidden])
//            {
//                [self.attachImageButton setSelected:NO];
//                [self.footerAttachImageButton setSelected:NO];
//            }
//            break;
//    }
//}
//
//
//- (void)useCamera
//{
//    if ([UIImagePickerController isSourceTypeAvailable:
//         UIImagePickerControllerSourceTypeCamera])
//    {
//        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//        imagePicker.delegate = self;
//        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        imagePicker.mediaTypes = [NSArray arrayWithObjects: (NSString *) kUTTypeImage, nil];
//        imagePicker.allowsEditing = NO;
//        [self presentViewController:imagePicker animated:YES completion:nil];
//    }
//}
//
//
//- (void)useCameraRoll
//{
//    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum])
//    {
//        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//        imagePicker.delegate = self;
//        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        imagePicker.mediaTypes = [NSArray arrayWithObjects: (NSString *) kUTTypeImage, nil];
//        imagePicker.allowsEditing = NO;
//        [self presentViewController:imagePicker animated:YES completion:nil];
//    }
//}
//
//
//#pragma mark - UIImagepickerDelegate method implementation
//
//
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    [self.textView resignFirstResponder];
//    [self.videoURLTextField resignFirstResponder];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.imageContainerView setHidden:NO];
//    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:@"public.image"])
//    {
//        UIImage *selectedImage = [[info objectForKey:UIImagePickerControllerOriginalImage] fixOrientation];
//        NSData *imageData = UIImageJPEGRepresentation(selectedImage, 0.7);
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *docDir = [paths objectAtIndex:0];
//        NSString *imageFilePath = [docDir stringByAppendingPathComponent:@"image.jpg"];
//        [imageData writeToFile:imageFilePath atomically:YES];
//        [self showBottomView:YES];
//        
//        [FUMessagesAPIManager saveMessageAttachImageWIthURL:[NSURL fileURLWithPath:imageFilePath] withSuccess:^(id object)
//         {
//             NSError *error;
//             NSDictionary *responseDictionary =  [NSJSONSerialization JSONObjectWithData:object options:kNilOptions error:&error];
//             NSNumber *errorCode = [responseDictionary objectForKey:API_RESPONSE_ERROR_CODE_KEY];
//             
//             if ([errorCode isEqualToNumber:[NSNumber numberWithInt:API_SUCCESS_CODE]])
//             {
//                 NSDictionary *data = [responseDictionary objectForKey:API_DATA_FIELD_KEY];
//                 storyImageUrl = [data objectForKey:API_IMAGE_URL_FIELD_KEY];
//                 
//                 if (storyImageUrl.length > 0)
//                 {
//                     [self.imageView setImageWithURL:[NSURL URLWithString:storyImageUrl] placeholderImage:[UIImage imageNamed:IMAGE_SIGNUP_ADD_PROFILE_PLACEHOLDER] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//                     imageNameToPost = [data objectForKey:API_IMAGE_NAME_FIELD_KEY];
//                 }
//                 else
//                 {
//                     self.imageView.image = [UIImage imageNamed:IMAGE_SIGNUP_ADD_PROFILE_PLACEHOLDER];
//                 }
//             }
//             else
//             {
//                 NSString *message = [responseDictionary objectForKey:API_MESSAGE_FIELD_KEY];
//                 [FUUtility showAlert:ALERT_TITLE_ERROR withCustomMessage:message havingOkButton:ALERT_BUTTON_OK andCancelButton:nil];
//                 self.imageView.image = [UIImage imageNamed:IMAGE_SIGNUP_ADD_PROFILE_PLACEHOLDER];
//                 [self.imageContainerView setHidden:YES];
//                 [self.attachImageButton setSelected:NO];
//                 [self.footerAttachImageButton setSelected:NO];
//                 [self showBottomView:NO];
//             }
//             [self scrollToBottom];
//         }
//                                                    andFail:^(NSString *errorMessage)
//         {
//             
//         }];
//    }
//}
//
//
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//    if([self.imageContainerView isHidden])
//    {
//        [self.attachImageButton setSelected:NO];
//        [self.footerAttachImageButton setSelected:NO];
//    }
//    else
//    {
//        [self.attachImageButton setSelected:YES];
//        [self.footerAttachImageButton setSelected:YES];
//    }
//}
//
//
//#pragma mark textview delegates
//
//
//- (void)textViewDidChange:(UITextView *)textView
//{
//    
//    if ([textView.text isEqualToString:@""])
//    {
//        self.placeHolderLabel.hidden = NO;
//    }
//    else
//    {
//        self.placeHolderLabel.hidden = YES;
//    }
//    
//    CGRect scrollViewContainerFrame = self.scrollContainerView.frame;
//    
//    CGFloat contentSizeHeightBeforeUpdating = scrollViewContainerFrame.size.height;
//    CGFloat contentSizeWithoutTextViewHeight = contentSizeHeightBeforeUpdating - self.textViewContainerView.frame.size.height ;
//    
//    [self updateReplyTextViewSize];
//    [self updateImageViewFrameOrigin];
//    CGFloat newcontentSizeWitTextViewHeight = contentSizeWithoutTextViewHeight + self.textViewContainerView.frame.size.height ;
//    scrollViewContainerFrame.size.height = newcontentSizeWitTextViewHeight;
//    self.scrollContainerView.frame = scrollViewContainerFrame;
//    self.scrollView.contentSize = self.scrollContainerView.frame.size;
//    
//    [self adjustScrollViewOffsetWithTextView:textView];
//}
//
//
//- (void)adjustScrollViewOffsetWithTextView:(UITextView *)textView
//{
//    CGRect scrollViewFrame = self.scrollView.frame;
//    CGRect textViewContainerViewFrame = self.textViewContainerView.frame;
//    
//    CGFloat scrollViewHeight = scrollViewFrame.size.height;
//    CGFloat textViewContainerViewPositionY = textViewContainerViewFrame.origin.y;
//    
//    CGRect cursorRect = [textView caretRectForPosition:textView.selectedTextRange.end];
//    CGFloat cursorPositionY = cursorRect.origin.y;
//    CGFloat differenceInCursorHeight = (textViewContainerViewPositionY+cursorPositionY+TEXT_SIZE_OFFSET)   - (scrollViewHeight);
//    
//    if(differenceInCursorHeight>0 && (differenceInCursorHeight != INFINITY))
//    {
//        self.scrollView.contentOffset = CGPointMake(0, differenceInCursorHeight);
//    }
//    
//}
//
//
//- (void)textViewDidChangeSelection:(UITextView *)textView
//{
//    [self adjustScrollViewOffsetWithTextView:textView];
//}
//
//
//#pragma mark picker view delegates
//
//
//- (void)setPickerViewAsFirstResponder
//{
//    self.filterTextField.inputView = self.pickerView;
//    self.filterTextField.inputAccessoryView = self.pickerToolBar;
//}
//
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//{
//    return 1;
//}
//
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{
//    return 2;
//}
//
//
//- (IBAction)pickerCancelButtonClicked:(id)sender
//{
//    [self.filterTextField resignFirstResponder];
//}
//
//
//- (IBAction)pickerDoneButtonClicked:(id)sender
//{
//    NSInteger index = [self.pickerView selectedRowInComponent:0];
//    self.filterTextField.text = [_typeList objectAtIndex:index];
//    [self.filterTextField resignFirstResponder];
//}
//
//
//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    NSString *itemName;
//    itemName = [_typeList objectAtIndex:row];
//    UIColor *itemColor = [UIColor blackColor];
//    NSAttributedString *attItemName = [[NSAttributedString alloc] initWithString:itemName attributes:@{NSForegroundColorAttributeName:itemColor}];
//    return attItemName;
//}
//
//
//#pragma mark textField delegates
//
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    NSInteger row = [_typeList indexOfObject:textField.text];
//    [self.pickerView selectRow:row inComponent:0 animated:NO];
//}
//
//
//#pragma mark - Keyboard events
//
//
//- (void)registerForKeyboardNotifications
//{
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWasShown:)
//                                                 name:UIKeyboardWillShowNotification object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillBeHidden:)
//                                                 name:UIKeyboardWillHideNotification object:nil];
//}
//
//
//- (void)UnRegisterForKeyboardNotifications
//{
//    // unregister for keyboard notifications while not visible.
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardWillShowNotification
//                                                  object:nil];
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardWillHideNotification
//                                                  object:nil];
//}
//
//
//// Called when the UIKeyboardDidShowNotification is sent.
//- (void)keyboardWasShown:(NSNotification*)aNotification
//{
//    
//    [self setScrollViewHeightWhileKeyBoardVisible];
//    
//}
//
//
//// Called when the UIKeyboardWillHideNotification is sent
//- (void)keyboardWillBeHidden:(NSNotification*)aNotification
//{
//    
//    [self setScrollViewHeightWhileKeyBoardNotVisible];
//    
//}
//
//
//- (IBAction)navigationRightMenuClicked:(id)sender
//{
//    [self.textView resignFirstResponder];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    
//}
//
//
//- (void)addedRecipients:(NSMutableArray *)recipentUsersArray
//{
//    self.conversationUsersArray = recipentUsersArray;
//    [self setLabelData];
//}

@end

//
//  ViewController.m
//  LM_Share
//
//  Created by Tywin on 2019/2/21.
//  Copyright © 2019 LionMobi. All rights reserved.
//

#import "ViewController.h"
#import "TYShareSDK.h"
@interface ViewController ()<TYShareSDKDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)FB:(id)sender {
    
    TYShareItem *item = [[TYShareItem alloc] init];
    item.shareImage = [UIImage imageNamed:@"img.jpg"];
    TYShareSDK *share = [[TYShareSDK alloc] init];
    share.delegate = self;
    [share share:item to:TYShareType_FB inViewController:self];
    
//    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
//    photo.image = [UIImage imageNamed:@"img.jpg"];
//    photo.userGenerated = YES;
//    FBSDKSharePhoto *photo  =  [FBSDKSharePhoto photoWithImage:[UIImage imageNamed:@"img.jpg"] userGenerated:YES];
//    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
//    content.photos = @[photo];
//    [FBSDKShareDialog showFromViewController:self
//                                 withContent:content
//                                    delegate:self];
    
//    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
//    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
    
//    FBSDKShareDialog *dialog = [[FBSDKShareDialog alloc] init];
//    dialog.fromViewController = self;
//    dialog.content = content;
//    dialog.mode = FBSDKShareDialogModeShareSheet;
//    [dialog show];
}

- (IBAction)Ins:(id)sender {
    
    TYShareItem *item = [[TYShareItem alloc] init];
    item.shareImage = [UIImage imageNamed:@"img.jpg"];
    TYShareSDK *share = [[TYShareSDK alloc] init];
    share.delegate = self;
    [share share:item to:TYShareType_INS inViewController:self];
}

- (IBAction)Me:(id)sender {
    
    TYShareItem *item = [[TYShareItem alloc] init];
    item.title = @"WallPaper";
    item.shareImageUrlString = @"https://img1.mydrivers.com/img/20170918/s_9f00703d05634617b9b9856b2fdd95e8.png";
    TYShareSDK *share = [[TYShareSDK alloc] init];
    share.organizationUrl = @"https://www.baidu.com";
    share.organizationTitle = @"Test";
    share.pageID = @"Test-294008251288537";
    share.delegate = self;
    [share share:item to:TYShareType_MSG inViewController:self];
    
//    FBSDKShareMessengerURLActionButton *urlButton = [[FBSDKShareMessengerURLActionButton alloc] init];
//    urlButton.title = @"Visit Facebook";
//    urlButton.url = [NSURL URLWithString:@"https://www.baidu.com"];
//
//    FBSDKShareMessengerGenericTemplateElement *element = [[FBSDKShareMessengerGenericTemplateElement alloc] init];
//    element.title = @"This is a Cat Picture";
//    element.subtitle = @"Look at this cat, wow! Amazing.";
//    element.imageURL = [NSURL URLWithString:@"https://img1.mydrivers.com/img/20170918/s_9f00703d05634617b9b9856b2fdd95e8.png"];
////    element.button = urlButton;
//
//    FBSDKShareMessengerGenericTemplateContent *content = [[FBSDKShareMessengerGenericTemplateContent alloc] init];
//    content.pageID = @"Test-294008251288537";
//    content.element = element;
//
//    FBSDKMessageDialog *messageDialog = [[FBSDKMessageDialog alloc] init];
//    messageDialog.shareContent = content;
//
//    if ([messageDialog canShow]) {
//        [messageDialog show];
//    }
}

- (void)share:(TYShareType)type didCompleteWithResults:(NSDictionary *)results
{
    
}

- (void)share:(TYShareType)type didFailWithError:(NSError *)error
{
    
}

- (void)sharerDidCancel:(TYShareType)type
{
    
}
@end

//
//  TYShareSDK.m
//  LM_Share
//
//  Created by Tywin on 2019/2/21.
//  Copyright © 2019 LionMobi. All rights reserved.
//

#import "TYShareSDK.h"
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "Instagram.h"
@implementation TYShareItem

@end


@interface TYShareSDK()<FBSDKSharingDelegate,UIDocumentInteractionControllerDelegate>
@property(nonatomic, strong) UIDocumentInteractionController *documentController;
@property(nonatomic, strong) UIViewController *owner;
@end


@implementation TYShareSDK

+(BOOL)checkInstallWith:(TYShareType)type
{
    BOOL result = NO;
    switch (type) {
        case TYShareType_FB:
            {
                BOOL isInstalled = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb://"]];
                
                if (isInstalled) {
                    result = YES;
                } else {
                    result = NO;
                }
            }
            break;
        case TYShareType_INS:
        {
            BOOL isInstalled = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"instagram://"]];
            
            if (isInstalled) {
                result = YES;
            } else {
                result = NO;
            }
        }
            break;
        case TYShareType_MSG:
        {
            BOOL isInstalled = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb-messenger://"]];
            
            if (isInstalled) {
                result = YES;
            } else {
                result = NO;
            }
        }
            break;
        default:
            break;
    }
    return result;
}

- (void)share:(TYShareItem *)shareItem to:(TYShareType)type inViewController:(nonnull UIViewController *)viewController
{
    self.owner = viewController;
    self.type = type;
    switch (type) {
        case TYShareType_FB:
        {
            FBSDKSharePhoto *photo  =  [FBSDKSharePhoto photoWithImage:shareItem.shareImage userGenerated:YES];
            FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
            content.photos = @[photo];
            [FBSDKShareDialog showFromViewController:viewController
                                         withContent:content
                                            delegate:self];
        }
            break;
        case TYShareType_INS:
        {
            [Instagram postImage:shareItem.shareImage inView:self.owner.view];
        }
            break;
        case TYShareType_MSG:
        {
            FBSDKShareMessengerURLActionButton *urlButton = [[FBSDKShareMessengerURLActionButton alloc] init];
            urlButton.title = self.organizationTitle;
            urlButton.url = [NSURL URLWithString:self.organizationUrl];
            
            FBSDKShareMessengerGenericTemplateElement *element = [[FBSDKShareMessengerGenericTemplateElement alloc] init];
            element.title = shareItem.title;
            element.subtitle = shareItem.text;
            element.imageURL = [NSURL URLWithString:shareItem.shareImageUrlString];
            element.button = urlButton;
            
            FBSDKShareMessengerGenericTemplateContent *content = [[FBSDKShareMessengerGenericTemplateContent alloc] init];
            content.pageID = self.pageID;
            content.element = element;
            
            FBSDKMessageDialog *messageDialog = [[FBSDKMessageDialog alloc] init];
            messageDialog.shareContent = content;
            
            if ([messageDialog canShow]) {
                [messageDialog show];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results
{
    [self.delegate share:self.type didCompleteWithResults:results];
}

- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error
{
//    NSLog(@"error--->%@",error);
    [self.delegate share:self.type didFailWithError:error];
}

- (void)sharerDidCancel:(id<FBSDKSharing>)sharer
{
//    NSLog(@"sharer--->%@",sharer);
    [self.delegate sharerDidCancel:self.type];
}

@end

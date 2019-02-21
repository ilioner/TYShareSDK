//
//  TYShareSDK.h
//  LM_Share
//
//  Created by Tywin on 2019/2/21.
//  Copyright © 2019 LionMobi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TYShareType) {
    TYShareType_FB,
    TYShareType_INS,
    TYShareType_MSG
};

@interface TYShareItem : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *text;

@property(nonatomic, strong) UIImage *shareImage;
@property(nonatomic, copy) NSString *shareImageUrlString;


@end
@protocol TYShareSDKDelegate;
@interface TYShareSDK : UICollectionViewCell

@property(nonatomic, copy) NSString *organizationTitle;
@property(nonatomic, copy) NSString *organizationUrl;
@property(nonatomic, copy) NSString *pageID;
@property(nonatomic, weak) id<TYShareSDKDelegate> delegate;
@property(nonatomic, assign) TYShareType type;

-(void)share:(TYShareItem *)shareItem to:(TYShareType)type inViewController:(UIViewController *)viewController;
+(BOOL)checkInstallWith:(TYShareType)type;
@end

@protocol TYShareSDKDelegate <NSObject>

- (void)share:(TYShareType)type didCompleteWithResults:(NSDictionary *)results;

- (void)share:(TYShareType)type didFailWithError:(NSError *)error;

- (void)sharerDidCancel:(TYShareType)type;

@end
NS_ASSUME_NONNULL_END

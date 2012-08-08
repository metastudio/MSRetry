//
//  RequestRetry.h
//  PicYou
//
//  Created by Ильдар Шайнуров on 12.01.12.
//  Copyright (c) 2012 Metastudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MSRetryAction.h"

typedef enum {
    MSRetryAlertQueueCancelTypeCancel = 1,
    MSRetryAlertQueueCancelTypeLogout
} MSRetryAlertQueueCancelType;

@interface MSRetryAlertQueue : NSObject
+ (MSRetryAlertQueue *)sharedRequestRetry;
+ (void)retry:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message;
+ (void)retry:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message andCancelType:(MSRetryAlertQueueCancelType)cancelType;

- (void)retryOrCancel:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message;
- (void)retryOrLogout:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message;
@end
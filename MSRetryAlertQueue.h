//
//  RequestRetry.h
//  PicYou
//
//  Created by Ильдар Шайнуров on 12.01.12.
//  Copyright (c) 2012 Metastudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MSRetryAction.h"

@interface MSRetryAlertQueue : NSObject
+ (MSRetryAlertQueue *)sharedRetryAlertQueue;
+ (void)retry:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message;

- (void)retryOrCancel:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message;
@end
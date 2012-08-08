//
//  RequestRetryAction.h
//  PicYou
//
//  Created by Ильдар Шайнуров on 12.01.12.
//  Copyright (c) 2012 Metastudio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MSRetryActionBlock)();

@interface MSRetryAction : NSObject
@property (nonatomic, copy) MSRetryActionBlock actionBlock;
+ (MSRetryAction *)retryAction:(MSRetryActionBlock)actionBlock;
- (id)initWithRetryActionBlock:(MSRetryActionBlock)actionBlock;
@end

//
//  RequestRetryAction.m
//  PicYou
//
//  Created by Ильдар Шайнуров on 12.01.12.
//  Copyright (c) 2012 Metastudio. All rights reserved.
//

#import "MSRetryAction.h"

@implementation MSRetryAction

+ (RetryAction *)retryAction:(MSRetryActionBlock)actionBlock
{
    return [[[self alloc] initWithRetryActionBlock:actionBlock] autorelease];
}

@synthesize actionBlock = _actionBlock;

- (id)initWithRetryActionBlock:(MSRetryActionBlock)actionBlock
{
    self = [self init];
    if (self) {
        self.actionBlock = actionBlock;
    }
    return self;
}

- (void)dealloc
{
    self.actionBlock = nil;
    [super dealloc];
}

@end
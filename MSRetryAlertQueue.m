//
//  RequestRetry.m
//  PicYou
//
//  Created by Ильдар Шайнуров on 12.01.12.
//  Copyright (c) 2012 Metastudio. All rights reserved.
//

#import "MSRetryAlertQueue.h"

#import "UIAlertView+Blocks.h"

@interface MSRetryAlertQueue()
@property (nonatomic, strong) NSMutableArray *queue;
@property (nonatomic, assign, getter=isAllertShown) BOOL alertShown;
@end

@implementation MSRetryAlertQueue

@synthesize queue = _queue;
@synthesize alertShown = _alertShown;

static MSRetryAlertQueue *sharedQueue = nil;

+ (MSRetryAlertQueue *)sharedRetryAlertQueue
{
    if (sharedQueue == nil) {
        sharedQueue = [[MSRetryAlertQueue allocWithZone:NULL] init];
    }
    return sharedQueue;
}

+ (void)retry:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message
{
    [[self sharedRetryAlertQueue] retryOrCancel:actionBlock withMessage:message];
}

#pragma mark - Object lifecycle

- (void)dealloc
{
    self.alertShown = NO;
}

#pragma mark - Properties

- (NSMutableArray *)queue
{
    if (_queue == nil) {
        _queue = [[NSMutableArray alloc] init];
    }
    return _queue;
}

#pragma mark - Private

- (void)runQueue
{
    for (MSRetryAction *retryAction in self.queue) {
        retryAction.actionBlock();
    }
    [self.queue removeAllObjects];
}

#pragma mark - Public

- (void)retry:(MSRetryActionBlock)actionBlock
  withMessage:(NSString *)message andCancelButton:(RIButtonItem *)cancelButton
{
    [self.queue addObject:[MSRetryAction retryAction:actionBlock]];
    
    if (!self.isAllertShown) {
        self.alertShown = YES;
        RIButtonItem *retryButton = [RIButtonItem itemWithLabel:@"Retry" andAction:^{
            [self runQueue];
            self.alertShown = NO;
        }];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                   cancelButtonItem:cancelButton
                                                   otherButtonItems:retryButton, nil];
        [alertView show];
    }
}

- (void)retryOrCancel:(MSRetryActionBlock)actionBlock
          withMessage:(NSString *)message
{
    [self retry:actionBlock withMessage:message andCancelButton:[RIButtonItem itemWithLabel:@"Cancel" andAction:^{
        [self.queue removeAllObjects];
        self.alertShown = NO;
    }]];
}

@end

//
//  DispatchTimer.m
//  DispatchTimer
//
//  Created by 啟倫 陳 on 2014/3/30.
//  Copyright (c) 2014年 啟倫 陳. All rights reserved.
//

#import "DispatchTimer.h"

@interface DispatchTimer ()
@property (nonatomic) dispatch_source_t source;
@end

@implementation DispatchTimer

+(DispatchTimer*) fireBlock : (void(^)(void)) block afterDelay : (NSTimeInterval) delay timeInterval : (NSTimeInterval) timeInterval onMainThread : (BOOL) onMainThread once : (BOOL) once {
    
    DispatchTimer *newTimer = [DispatchTimer new];

    if (onMainThread) {
        newTimer.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    } else {
        newTimer.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    }
    
    if (once) {
        dispatch_source_set_timer(newTimer.source,
                                  dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC),
                                  DISPATCH_TIME_FOREVER, 0);
        void(^onceBlock)(void) = ^() {
            block();
            [newTimer invalidate];
        };
        dispatch_source_set_event_handler(newTimer.source, onceBlock);
    } else {
        dispatch_source_set_timer(newTimer.source,
                                  dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC),
                                  timeInterval * NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(newTimer.source, block);
    }
    
    dispatch_resume(newTimer.source);
    
    return newTimer;
    
}

-(void) invalidate {
    if (self.source) {
        dispatch_source_cancel(self.source);
        self.source = nil;
    }
}

@end

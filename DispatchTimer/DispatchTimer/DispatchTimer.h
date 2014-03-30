//
//  DispatchTimer.h
//  DispatchTimer
//
//  Created by 啟倫 陳 on 2014/3/30.
//  Copyright (c) 2014年 啟倫 陳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DispatchTimer : NSObject

+(DispatchTimer*) fireBlock : (void(^)(void)) block afterDelay : (NSTimeInterval) delay timeInterval : (NSTimeInterval) timeInterval onMainThread : (BOOL) onMainThread once : (BOOL) once;


-(void) invalidate;

@end

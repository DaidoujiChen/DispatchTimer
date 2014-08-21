//
//  MainViewController.m
//  DispatchTimer
//
//  Created by 啟倫 陳 on 2014/3/30.
//  Copyright (c) 2014年 啟倫 陳. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - life cycle

- (void)viewDidLoad {
	[super viewDidLoad];
	self.myTimer = [DispatchTimer scheduledInBackgroundAfterDelay:1.0f timeInterval:1.0f block: ^{
	    static int count = 0;
	    NSLog(@"count : %d", count++);
	}];
}

@end

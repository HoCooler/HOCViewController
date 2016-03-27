//
//  HOCSliceAnimation.h
//  HOCSlideViewController
//
//  Created by HoCooler on 16/3/22.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionContext.h"

@interface HOCSliceTransitionContext : NSObject <UIViewControllerContextTransitioning>
- (instancetype)initWithFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController goingRight:(BOOL)goingRight; /// Designated initializer.
@property (nonatomic, copy) void (^completionBlock)(BOOL didComplete); /// A block of code we can set to execute after having received the completeTransition: message.
@property (nonatomic, assign) NSInteger margin;

@end

//@interface HOCSliceTransitionContext : TransitionContext
//
//@property (nonatomic, assign) NSInteger margin;
//
//@end

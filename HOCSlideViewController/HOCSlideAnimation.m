//
//  HOCSlideAnimation.m
//  HOCSlideViewController
//
//  Created by HoCooler on 16/3/22.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import "HOCSlideAnimation.h"

@implementation HOCSlideAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect fromViewFinalFrame   = [transitionContext finalFrameForViewController:fromViewController];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    toViewController.view.frame = toViewFinalFrame;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
 
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        //        if (self.coordinatorAnimations) self.coordinatorAnimations((id<UIViewControllerTransitionCoordinatorContext>)transitionContext);
        fromViewController.view.frame = fromViewFinalFrame;
    } completion:^(BOOL finished) {
        //        if (self.coordinatorCompletion) self.coordinatorCompletion((id<UIViewControllerTransitionCoordinatorContext>)transitionContext);
        [transitionContext completeTransition:finished];
    }];
}

@end

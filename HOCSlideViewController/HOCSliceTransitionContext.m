//
//  HOCSliceAnimation.m
//  HOCSlideViewController
//
//  Created by HoCooler on 16/3/22.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import "HOCSliceTransitionContext.h"

@interface HOCSliceTransitionContext()

@property (nonatomic, strong) NSDictionary *privateViewControllers;
@property (nonatomic, assign) CGRect privateDisappearingFromRect;
@property (nonatomic, assign) CGRect privateAppearingFromRect;
@property (nonatomic, assign) CGRect privateDisappearingToRect;
@property (nonatomic, assign) CGRect privateAppearingToRect;
@property (nonatomic, weak) UIView *containerView;
@property (nonatomic, assign) UIModalPresentationStyle presentationStyle;

@property (nonatomic, assign) BOOL goRight;

@end

@implementation HOCSliceTransitionContext

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController goingRight:(BOOL)goingRight {
    NSAssert ([fromViewController isViewLoaded] && fromViewController.view.superview, @"The fromViewController view must reside in the container view upon initializing the transition context.");
    
    if ((self = [super init])) {
        self.presentationStyle = UIModalPresentationCustom;
        self.containerView = fromViewController.view.superview;
        self.privateViewControllers = @{
                                        UITransitionContextFromViewControllerKey:fromViewController,
                                        UITransitionContextToViewControllerKey:toViewController,
                                        };
        
        // Set the view frame properties which make sense in our specialized ContainerViewController context. Views appear from and disappear to the sides, corresponding to where the icon buttons are positioned. So tapping a button to the right of the currently selected, makes the view disappear to the left and the new view appear from the right. The animator object can choose to use this to determine whether the transition should be going left to right, or right to left, for example.
        
        self.goRight = goingRight;
        
        CGFloat travelDistance = (goingRight ? -self.containerView.bounds.size.width : self.containerView.bounds.size.width);
        self.privateDisappearingFromRect = self.privateAppearingToRect = self.containerView.bounds;
        self.privateDisappearingToRect = CGRectOffset (self.containerView.bounds, travelDistance, 0);
        self.privateAppearingFromRect = CGRectOffset (self.containerView.bounds, -travelDistance, 0);
    }
    
    return self;
}

- (void)setMargin:(NSInteger)margin
{
    if (_margin != margin) {
        _margin = margin;
        
        self.privateDisappearingFromRect = CGRectOffset(self.containerView.bounds, 0, 0);
        self.privateAppearingToRect = CGRectOffset(self.containerView.bounds,  margin-self.containerView.bounds.size.width, 0);
        
         self.privateAppearingFromRect = CGRectOffset (self.containerView.bounds, -self.containerView.bounds.size.width, 0);
        self.privateDisappearingToRect = CGRectOffset (self.containerView.bounds, margin, 0);
       
    }
}

- (CGRect)initialFrameForViewController:(UIViewController *)viewController {
    if (viewController == [self viewControllerForKey:UITransitionContextFromViewControllerKey]) {
        return !self.goRight ? self.privateDisappearingFromRect : self.privateAppearingToRect;
    } else {
        return !self.goRight ? self.privateAppearingFromRect : self.privateDisappearingToRect;
    }
}

- (CGRect)finalFrameForViewController:(UIViewController *)viewController {
    if (viewController == [self viewControllerForKey:UITransitionContextFromViewControllerKey]) {
        return !self.goRight ? self.privateDisappearingToRect : self.privateAppearingFromRect;
    } else {
        return !self.goRight ? self.privateAppearingToRect : self.privateDisappearingFromRect;
    }
}

- (UIViewController *)viewControllerForKey:(NSString *)key {
    return self.privateViewControllers[key];
}

- (void)completeTransition:(BOOL)didComplete {
    if (self.completionBlock) {
        self.completionBlock (didComplete);
    }
}

- (BOOL)transitionWasCancelled { return NO; } // Our non-interactive transition can't be cancelled (it could be interrupted, though)

@end

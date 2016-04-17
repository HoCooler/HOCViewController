//
//  HOCSlideViewController.m
//  HOCSlideViewController
//
//  Created by HoCooler on 16/3/22.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import "HOCSlideViewController.h"
#import "HOCAnimation.h"
#import "HOCSlideAnimation.h"
#import "TransitionContext.h"
#import "HOCSliceTransitionContext.h"

@interface HOCSlideViewController()

@end

@implementation HOCSlideViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _leftViewController = [UIViewController new];
    UIButton *lslideButton = [UIButton new];
    [_leftViewController.view addSubview:lslideButton];
    lslideButton.frame = CGRectMake(200, 200, 150, 50);
    lslideButton.backgroundColor = [UIColor blueColor];
    lslideButton.tag = 1;
    [lslideButton setTitle:@"SlideToRight" forState:UIControlStateNormal];
    [lslideButton addTarget:self action:@selector(slideViewController:) forControlEvents:UIControlEventTouchUpInside];
//    [lslideButton addTarget:self action:@selector(slideViewControllerWithFrame:) forControlEvents:UIControlEventTouchUpInside];
    
    _leftViewController.view.backgroundColor = [UIColor orangeColor];
    _leftViewController.title = @"Left";
    [self addChildViewController:self.leftViewController];
    [self.view addSubview:self.leftViewController.view];
    [self.leftViewController didMoveToParentViewController:self];
   
    _rightViewController = [UIViewController new];
    UIButton *rslideButton = [UIButton new];
    rslideButton.backgroundColor = [UIColor redColor];
    [_rightViewController.view addSubview:rslideButton];
    rslideButton.frame = CGRectMake(200, 200, 150, 50);
    [rslideButton setTitle:@"SlideToLeft" forState:UIControlStateNormal];
    [rslideButton addTarget:self action:@selector(slideViewController:) forControlEvents:UIControlEventTouchUpInside];
//    [rslideButton addTarget:self action:@selector(slideViewControllerWithFrame:) forControlEvents:UIControlEventTouchUpInside];

    rslideButton.tag = 2;
    
    _rightViewController.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:self.rightViewController];
    [self.view addSubview:self.rightViewController.view];
    [self.rightViewController didMoveToParentViewController:self];
    self.rightViewController.title = @"Right";

}


- (void)slideViewController:(id)sender
{
    if (![self isViewLoaded]) {
        return;
    }
    BOOL goRight = YES;
    UIButton *clickButton = (UIButton *)sender;
    if (clickButton.tag == 1) {
        goRight = YES;
    } else {
        goRight = NO;
    }
    
    UIViewController *fromVC, *toVC;
    if (goRight) {
        fromVC = self.leftViewController;
        toVC = self.rightViewController;
    } else {
        fromVC = self.rightViewController;
        toVC = self.leftViewController;
    }
    
    //ViewController transformation
//    [fromVC willMoveToParentViewController:nil];
//    [fromVC.view removeFromSuperview];
//    [fromVC removeFromParentViewController];
//    
//    [self addChildViewController:toVC];
//    [self.view addSubview:toVC.view];
//    [toVC didMoveToParentViewController:self];
    
    //Use Animation
    id<UIViewControllerAnimatedTransitioning> animator = nil;
    
    BOOL isSlideAnimation = NO;
    BOOL isSlideContext = YES;
    
    if (isSlideAnimation) {
        animator = [HOCSlideAnimation new];
    } else {
        animator = [HOCAnimation new];
    }
    
    if (isSlideContext) {
        HOCSliceTransitionContext *transitionContext = [[HOCSliceTransitionContext alloc] initWithFromViewController:fromVC toViewController:toVC goingRight:goRight];
        ((HOCSliceTransitionContext *)transitionContext).margin = 250;
        [animator animateTransition:transitionContext];
    } else {
       TransitionContext *transitionContext = [[TransitionContext alloc] initWithFromViewController:fromVC toViewController:toVC goingRight:goRight];
        [animator animateTransition:transitionContext];
    }
    
}
@end






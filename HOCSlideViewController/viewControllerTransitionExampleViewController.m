//
//  viewControllerTransitionExampleViewController.m
//  HOCSlideViewController
//
//  Created by HoCooler on 16/4/17.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import "viewControllerTransitionExampleViewController.h"
#import "HOCAnimation.h"
#import "TransitionContext.h"

@interface viewControllerTransitionExampleViewController ()

@property (nonatomic, strong) UISwitch *useAnimationSwitch;

@end

@implementation viewControllerTransitionExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.useAnimationSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(200, 160, 100, 50)];
	self.useAnimationSwitch.on = YES;
	[self.view addSubview:self.useAnimationSwitch];
	[self.view bringSubviewToFront:self.useAnimationSwitch];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
	
	if (self.useAnimationSwitch.on) {
		[fromVC willMoveToParentViewController:nil];
		[fromVC.view removeFromSuperview];
		[fromVC removeFromParentViewController];
		
		[self addChildViewController:toVC];
		[self.view addSubview:toVC.view];
		[toVC didMoveToParentViewController:self];
	} else {
		id<UIViewControllerAnimatedTransitioning> animator = [HOCAnimation new];
	
		TransitionContext *transitionContext = [[TransitionContext alloc] initWithFromViewController:fromVC toViewController:toVC];
		[animator animateTransition:transitionContext];
	}
	
	[self.view bringSubviewToFront:self.useAnimationSwitch];

}
@end

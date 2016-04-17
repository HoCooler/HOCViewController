//
//  slideViewWithTransitionViewController.m
//  HOCSlideViewController
//
//  Created by HoCooler on 16/4/18.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import "slideViewWithTransitionViewController.h"
#import "HOCSlideAnimation.h"
#import "HOCSliceTransitionContext.h"

@interface slideViewWithTransitionViewController ()

@end

@implementation slideViewWithTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

	//Use Animation
	id<UIViewControllerAnimatedTransitioning> animator = [HOCSlideAnimation new];
	
	HOCSliceTransitionContext *transitionContext = [[HOCSliceTransitionContext alloc] initWithFromViewController:fromVC toViewController:toVC goingRight:goRight];
	((HOCSliceTransitionContext *)transitionContext).margin = 250;
	[animator animateTransition:transitionContext];
}
@end

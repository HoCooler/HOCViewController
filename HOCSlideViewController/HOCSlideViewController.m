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
	[NSException raise:@"Error"
				format:@"The subclass should implement the method of slideViewController"];
}
@end






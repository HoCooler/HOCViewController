//
//  simpleSlideViewWithFrameViewController.m
//  HOCSlideViewController
//
//  Created by HoCooler on 16/4/17.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import "simpleSlideViewWithFrameViewController.h"

@interface simpleSlideViewWithFrameViewController ()

@end

@implementation simpleSlideViewWithFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.view.backgroundColor = [UIColor whiteColor];
	self.navigationItem.title = @"SlideView theory";
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)slideViewController:(id)sender
{
	NSInteger margin = 250;
	if (self.rightViewController.view.frame.origin.x == 0) {
			//左移
		[UIView animateWithDuration:0.25 animations:^{
			self.rightViewController.view.frame = CGRectOffset(self.view.bounds, margin, 0);
			self.leftViewController.view.frame = CGRectOffset(self.view.bounds, margin - self.view.bounds.size.width, 0);
		} completion:^(BOOL finished) {
		}];
		
	}else{
		[UIView animateWithDuration:0.25 animations:^{
			self.rightViewController.view.frame = CGRectOffset(self.view.bounds, 0, 0);
			self.leftViewController.view.frame = CGRectOffset(self.view.bounds, -self.view.bounds.size.width, 0);
			
		} completion:^(BOOL finished) {
			
		}];
	}
}

@end

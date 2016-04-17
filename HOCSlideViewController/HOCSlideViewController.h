//
//  HOCSlideViewController.h
//  HOCSlideViewController
//
//  Created by HoCooler on 16/3/22.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HOCSlideViewController : UIViewController

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *rightViewController;

- (void)slideViewController:(id)sender;

@end


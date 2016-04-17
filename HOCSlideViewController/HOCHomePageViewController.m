//
//  HOCHomePageViewController.m
//  HOCSlideViewController
//
//  Created by HoCooler on 16/4/17.
//  Copyright © 2016年 HoCooler. All rights reserved.
//

#import "HOCHomePageViewController.h"

@interface HOCHomePageViewController ()
@property (nonatomic, copy) NSArray *slideViewArray;
@property (nonatomic, strong) UITableView *listView;
@end

static NSString *kDefaultCellIdentifier = @"DefaultCellIdentifier";

@implementation HOCHomePageViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title = @"slideView Demo";
	
	self.slideViewArray = [[NSArray alloc] initWithObjects:@"simpleSlideViewWithFrame", @"viewControllerTransitionExample", @"slideViewWithTransition", nil];
	self.listView = [[UITableView alloc] initWithFrame:CGRectZero];
	self.listView.delegate = self;
	self.listView.dataSource = self;
	[self.listView registerClass:[UITableViewCell class] forCellReuseIdentifier:kDefaultCellIdentifier];
	
	[self.view addSubview:self.listView];
	self.listView.frame = self.view.bounds;
	
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDefaultCellIdentifier forIndexPath:indexPath];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDefaultCellIdentifier];
	}
	
	cell.textLabel.text = self.slideViewArray[indexPath.row];
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.slideViewArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.listView deselectRowAtIndexPath:indexPath animated:true];
	
	NSString *name = [self.slideViewArray[indexPath.row] stringByAppendingString:@"ViewController"];
	UIViewController *vc = [[NSClassFromString(name) alloc] init];
	[self.navigationController pushViewController:vc animated:true];
}

@end

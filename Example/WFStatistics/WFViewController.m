//
//  WFViewController.m
//  WFStatistics
//
//  Created by wyxlh on 02/17/2020.
//  Copyright (c) 2020 wyxlh. All rights reserved.
//

#import "WFViewController.h"
#import "WFDemoViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    WFDemoViewController *demo = [[WFDemoViewController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

@end

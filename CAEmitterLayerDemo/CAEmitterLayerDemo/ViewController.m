//
//  ViewController.m
//  CAEmitterLayerDemo
//
//  Created by Vols on 15/7/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "ViewController.h"
#import "VSnowView.h"
#import "VRainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    VSnowView * snowView = [[VSnowView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    [self.view addSubview:snowView];
    [snowView show];
    
    VRainView * rainView = [[VRainView alloc] initWithFrame:CGRectMake(60, 300, 200, 200)];
    [self.view addSubview:rainView];
    [rainView show];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  SDUpdate
//
//  Created by 宋东昊 on 2017/2/15.
//  Copyright © 2017年 songdh. All rights reserved.
//

#import "ViewController.h"
#import "SDUpdate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"检查更新" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)onClick:(id)sender
{
    SDUpdate *updater = [SDUpdate shareInstance];
    updater.curAppVersion = @"5.3.0";
    updater.controller = self;
    [updater begin];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  HeliosMutablieClick
//
//  Created by beyo-zhaoyf on 2017/7/14.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+Helios.h"
@interface ViewController ()
{
    UIButton *_button;
    UIButton *_repeatBtn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.backgroundColor = [UIColor blueColor];
    _button.frame = CGRectMake(200, 200, 100, 50);
    [_button setTitle:@"不重复点击" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    _repeatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _repeatBtn.backgroundColor = [UIColor blueColor];
    _repeatBtn.frame = CGRectMake(200, 400, 100, 50);
    [_repeatBtn setTitle:@"重复点击" forState:UIControlStateNormal];
    _repeatBtn.Helios_ignoreEvent = NO;
    _repeatBtn.Helios_acceptEventInterval = 3.0;
    [_repeatBtn addTarget:self action:@selector(repeatBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_repeatBtn];
}

- (void)buttonClick {
    NSLog(@"不重复");
}
- (void)repeatBtnClick {
     NSLog(@"重复");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

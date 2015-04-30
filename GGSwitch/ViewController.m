//
//  ViewController.m
//  GGSwitch
//
//  Created by __无邪_ on 15/4/29.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "GGSwitch.h"

@interface ViewController ()
@property (nonatomic, strong)GGSwitch *mySwitch;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mySwitch = [[GGSwitch alloc] initWithFrame:CGRectMake(10, 100, 400, 400)];//与此大小无关
    [self.mySwitch setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.mySwitch];
    
    /*可选Start*/
    [self.mySwitch setTintColor:[UIColor redColor]];
    [self.mySwitch setThumbTintColor:[UIColor whiteColor]];
    [self.mySwitch setOnTintColor:[UIColor orangeColor]];
    [self.mySwitch setOnText:@"lbs"];
    [self.mySwitch setOffText:@"kg"];
    [self.mySwitch setSwitchSize:CGSizeMake(78, 34)];//可设置大小
    /*End*/
    
    [self.mySwitch setOn:YES animated:YES];
    
    [self.mySwitch actionBlock:^(BOOL on) {
        NSLog(@"============%d",on);
    }];
    
    
    
//    UISwitch *switchsss = [[UISwitch alloc] initWithFrame:CGRectMake(200, 100, 100, 200)];
//    [self.view addSubview:switchsss];
//    [switchsss setTintColor:[UIColor redColor]];
//    [switchsss setThumbTintColor:[UIColor blueColor]];
//    [switchsss setOnTintColor:[UIColor cyanColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

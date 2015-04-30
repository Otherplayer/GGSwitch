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
@property (nonatomic, strong)GGSwitch *switchh;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.switchh = [[GGSwitch alloc] initWithFrame:CGRectMake(100, 100, 200, 400)];
    [self.switchh setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.switchh];
    [self.switchh setTintColor:[UIColor redColor]];
    [self.switchh setThumbTintColor:[UIColor whiteColor]];
    [self.switchh setOn:YES animated:YES];
    [self.switchh setOnTintColor:[UIColor orangeColor]];
    [self.switchh setOnText:@"lbs"];
    [self.switchh setOffText:@"kg"];
    [self.switchh setActionBlock:^(BOOL on) {
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

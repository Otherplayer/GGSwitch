# GGSwitch
=================================

Easy way to use Switch

![GGSwitch](https://github.com/Otherplayer/GGSwitch/master/Others/screenshot.png "")
## Usage ##

Import 
```objective-c
#import "GGSwitch.h" 
```

Use it!
```objective-c

@property (nonatomic, strong) UIColor *onTintColor;

@property (nonatomic, strong) UIColor *tintColor;

@property (nonatomic, strong) UIColor *thumbTintColor;

@property (nonatomic, strong) NSString *onText;

@property (nonatomic, strong) NSString *offText;

@property (nonatomic, strong) void(^actionBlock)(BOOL on);



@property(nonatomic,getter=isOn) BOOL on;


- (instancetype)initWithFrame:(CGRect)frame; // This class enforces a size appropriate for the control. The frame size is ignored.


- (void)setOn:(BOOL)on animated:(BOOL)animated; // does not send action


```


```objective-c

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

```

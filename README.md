# GGSwitch
=================================

Easy way to use Switch

![](https://github.com/Otherplayer/GGSwitch/master/Others/screenshot.png)
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

@property (nonatomic, unsafe_unretained) CGSize switchSize;// 设置大小， 建议宽高比2：1左右


@property (nonatomic, strong, setter=actionBlock:) void(^tapBlock)(BOOL on);
@property(nonatomic,getter=isOn) BOOL on;



- (instancetype)initWithFrame:(CGRect)frame;    // This class enforces a size appropriate for the control. The frame size is ignored.

- (void)setOn:(BOOL)on animated:(BOOL)animated; // does not send action


```


```objective-c

self.mySwitch = [[GGSwitch alloc] initWithFrame:CGRectMake(10, 100, 400, 400)];//与此大小无关
[self.mySwitch setBackgroundColor:[UIColor whiteColor]];
[self.view addSubview:self.mySwitch];

/*可选Start*/
[self.mySwitch setTintColor:[UIColor redColor]];
[self.mySwitch setThumbTintColor:[UIColor whiteColor]];
[self.mySwitch setOnTintColor:[UIColor orangeColor]];
[self.mySwitch setOnText:@"lbs"];
[self.mySwitch setOffText:@"kg"];
[self.mySwitch setSwitchSize:CGSizeMake(100, 50)];//可设置大小
/*End*/

[self.mySwitch setOn:YES animated:YES];

[self.mySwitch actionBlock:^(BOOL on) {
NSLog(@"============%d",on);
}];

```

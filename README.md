# GGSwitch
自定义Switch


@property (nonatomic, strong) UIColor *onTintColor;

@property (nonatomic, strong) UIColor *tintColor;

@property (nonatomic, strong) UIColor *thumbTintColor;

@property (nonatomic, strong) NSString *onText;

@property (nonatomic, strong) NSString *offText;

@property (nonatomic, strong) void(^actionBlock)(BOOL on);



@property(nonatomic,getter=isOn) BOOL on;


- (instancetype)initWithFrame:(CGRect)frame; // This class enforces a size appropriate for the control. The frame size is ignored.


- (void)setOn:(BOOL)on animated:(BOOL)animated; // does not send action


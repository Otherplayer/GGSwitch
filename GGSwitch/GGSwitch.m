//
//  GGSwitch.m
//  GGSwitch
//
//  Created by __无邪_ on 15/4/29.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "GGSwitch.h"
#define degreesToRadians(degrees) ((degrees) * M_PI / 180.0)
#define PROGRESS_LINE_WIDTH 1 //弧线的宽度

#define kSwitchWidth 64
#define kSwitchHeight 31

@interface GGSwitch ()
@property (nonatomic, strong)CAShapeLayer *trackLayer;
@property (nonatomic, strong)CAShapeLayer *bgLayer;

@property (nonatomic, unsafe_unretained)BOOL stateisOn;
@end
@implementation GGSwitch{
    BOOL shouldAnimated;
    UIColor *onColor;
    UIColor *offColor;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:CGRectMake(frame.origin.x, frame.origin.y, kSwitchWidth, kSwitchHeight)];
        [self setBackgroundColor:[UIColor whiteColor]];
        
        onColor = [UIColor colorWithRed:0.242 green:0.781 blue:0.126 alpha:1.000];
        offColor = [UIColor whiteColor];
        
        CGSize size = CGSizeMake(kSwitchWidth, kSwitchHeight);
        _bgLayer = [CAShapeLayer layer];
        _bgLayer.frame = self.bounds;
//        [self.layer addSublayer:_bgLayer];
        _bgLayer.fillColor = [offColor CGColor];
        _bgLayer.strokeColor = [[UIColor grayColor] CGColor];
        _bgLayer.opacity = 0.35;
        _bgLayer.lineCap = kCALineCapRound;
        _bgLayer.lineWidth = PROGRESS_LINE_WIDTH;
        
        
        _trackLayer = [CAShapeLayer layer];
        _trackLayer.frame = CGRectMake(0, 0, size.height, size.width);
        [self.layer addSublayer:_trackLayer];
        _trackLayer.fillColor = [[UIColor whiteColor] CGColor];
//        _trackLayer.strokeColor = [[UIColor greenColor] CGColor];//指定path的渲染颜色
        _trackLayer.opacity = 1;
        _trackLayer.lineCap = kCALineCapRound;
        _trackLayer.lineWidth = PROGRESS_LINE_WIDTH;
        _trackLayer.shadowColor = [UIColor grayColor].CGColor;
        _trackLayer.shadowOffset = CGSizeMake(0.5, 0);
        _trackLayer.shadowOpacity = 1.0;
        _trackLayer.shadowRadius = 1.0;
        
        self.stateisOn = NO;
        shouldAnimated = YES;
        
        [self addTapGesture];
        
    }
    return self;
}




- (void)addTapGesture{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchStateChanged)];
    [self addGestureRecognizer:tapGesture];
}

- (void)switchStateChanged{
    
    self.stateisOn = !self.stateisOn;
    
    CGSize size = CGSizeMake(kSwitchWidth, kSwitchHeight);
    CGRect newBounds;
    UIColor *color = nil;
    if (self.stateisOn) {
        newBounds = CGRectMake(size.width / 2, 0, size.height, size.height);
        color = onColor;
    }else{
        newBounds = CGRectMake(0, 0, size.height, size.width);
        color = offColor;
    }
    
    if (shouldAnimated) {
        [CATransaction begin];
        [CATransaction setDisableActions:!YES];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [CATransaction setAnimationDuration:0.15];
        _trackLayer.frame = newBounds;
        [CATransaction commit];
    }else{
        _trackLayer.frame = newBounds;
    }
    
    _bgLayer.fillColor = color.CGColor;
    if (self.actionBlock) {
        self.actionBlock(self.stateisOn);
    }
    [self setNeedsDisplay];
    NSLog(@"---%d",self.stateisOn);
}


#pragma mark - Color
-(void)setTintColor:(UIColor *)tintColor{
    
}
-(void)setThumbTintColor:(UIColor *)thumbTintColor{
    _trackLayer.fillColor = [thumbTintColor CGColor];
}
-(void)setOnTintColor:(UIColor *)onTintColor{
    onColor = onTintColor;
    if (self.stateisOn) {
//        _bgLayer.fillColor = [onTintColor CGColor];
        [self setNeedsDisplay];
    }
}


#pragma mark - Public

-(BOOL)isOn{
    return self.stateisOn;
}

-(void)setOn:(BOOL)on animated:(BOOL)animated{
    shouldAnimated = YES;
    self.stateisOn = !on;
    
    [self switchStateChanged];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGSize size = CGSizeMake(kSwitchWidth, kSwitchHeight);
    
    size.height = size.height / 2;
    UIBezierPath* pathLeft = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.height, size.height)//圆弧中心
                                                         radius:size.height//半径
                                                     startAngle:degreesToRadians(90)//开始角度
                                                       endAngle:degreesToRadians(270)//结束角度
                                                      clockwise:YES];//是否顺时针
    pathLeft.lineWidth = 1.0;
    pathLeft.lineCapStyle = kCGLineCapRound; //线条拐角
    pathLeft.lineJoinStyle = kCGLineCapRound; //终点处理
    [pathLeft addLineToPoint:CGPointMake(size.width - size.height, 0)];
    
    UIBezierPath *pathRight = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width - size.height, size.height)
                                                         radius:size.height
                                                     startAngle:degreesToRadians(270)
                                                       endAngle:degreesToRadians(90)
                                                      clockwise:YES];
    pathRight.lineWidth = 1.0;
    [pathLeft appendPath:pathRight];
    [pathLeft addLineToPoint:CGPointMake(size.height, size.height * 2)];
    UIColor *fontColor = [UIColor whiteColor];
    if (self.stateisOn) {
        [onColor setStroke];
        [onColor setFill];
        fontColor = [UIColor whiteColor];
    }else{
        [[UIColor groupTableViewBackgroundColor] setStroke];
        [offColor setFill];
        fontColor = [UIColor darkGrayColor];
    }
    [pathLeft fill];
    [pathLeft stroke];
    
    
    
    UIBezierPath* pathCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.height, size.height)//圆弧中心
                                                            radius:size.height//半径
                                                        startAngle:degreesToRadians(0)//开始角度
                                                          endAngle:degreesToRadians(360)//结束角度
                                                         clockwise:YES];//是否顺时针
    pathCircle.lineWidth = 1.0;
    pathCircle.lineCapStyle = kCGLineCapRound; //线条拐角
    pathCircle.lineJoinStyle = kCGLineCapRound; //终点处理
//
//    
//    _bgLayer.path = [pathLeft CGPath];
    _trackLayer.path =[pathCircle CGPath];
    
    
//
    NSDictionary *attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                         NSForegroundColorAttributeName:fontColor};
    if (self.onText && self.onText.length > 0) {
        CGSize size = [self.onText sizeWithAttributes:attributes];
        
        [self.onText drawInRect:CGRectMake((kSwitchWidth/2 - size.width)/2, (kSwitchHeight-size.height) / 2, kSwitchWidth / 2, kSwitchHeight) withAttributes:attributes];
    }
    if (self.offText && self.offText.length > 0) {
        CGSize size = [self.onText sizeWithAttributes:attributes];
        [self.offText drawInRect:CGRectMake(kSwitchWidth/2 + (kSwitchWidth/2 - size.width)/2, (kSwitchHeight-size.height) / 2, kSwitchWidth / 2, kSwitchHeight) withAttributes:attributes];
    }
}


@end

//
//  ViewController.m
//  LayerAnimations
//
//  Created by Vols on 16/3/8.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "ViewController.h"

#import "VPulseLayer.h"


#import "VSnowView.h"
#import "VRainView.h"


#define kMaxRadius 160

#define kSCREEN_SIZE  [UIScreen mainScreen].bounds.size

@interface ViewController ()

@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) UIView * contentView;
@property (nonatomic, strong) UIButton * btn;



@property (nonatomic, strong) UIImageView *beaconView;
@property (nonatomic, strong) VPulseLayer *pulse;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupIconLayer];
    
    [self setupPulse];
    
    [self setupEmitter];
}

- (void)setupIconLayer{
    _count = 0;
    [self.view addSubview:self.btn];
    self.btn.backgroundColor = [UIColor orangeColor];
//    [self drawError];
}


- (void)setupPulse{
    
    [self.view addSubview:self.beaconView];
    self.pulse = [VPulseLayer layer];
    self.pulse.position = self.beaconView.center;
    [self.view.layer insertSublayer:self.pulse below:self.beaconView.layer];
    [self setupInitialValues];
}


- (void)setupEmitter{
    
    VSnowView * snowView = [[VSnowView alloc] initWithFrame:CGRectMake(0, kSCREEN_SIZE.height-160, 160, 160)];
    [self.view addSubview:snowView];
    [snowView show];
    
    VRainView * rainView = [[VRainView alloc] initWithFrame:CGRectMake(kSCREEN_SIZE.width-160, kSCREEN_SIZE.height-160, 160, 160)];
    [self.view addSubview:rainView];
    [rainView show];
    
    NSLog(@"%@", NSStringFromCGRect(snowView.frame));
}

#pragma mark - Private

- (void)setupInitialValues {
    
    //    self.radiusSlider.value = 0.5;
    //    [self radiusChanged:nil];
    
    //    self.rSlider.value = 0;
    //    self.gSlider.value = 0.487;
    //    self.bSlider.value = 1.0;
    //    [self colorChanged:nil];
    
    
}




#pragma mark -  method

- (void)drawError {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100/2, 100/2) radius:100/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CGPoint p1 =  CGPointMake(100/4, 100/4);
    [path moveToPoint:p1];
    
    CGPoint p2 =  CGPointMake(100/4*3, 100/4*3);
    [path addLineToPoint:p2];
    
    CGPoint p3 =  CGPointMake(100/4*3, 100/4);
    [path moveToPoint:p3];
    
    CGPoint p4 =  CGPointMake(100/4, 100/4*3);
    [path addLineToPoint:p4];
    
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.lineWidth = 5;
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 0.5;
    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    
    [self.contentView.layer addSublayer:layer];
}


- (void)drawTick {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100/2, 100/2) radius:100/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(100/4, 100/2)];
    CGPoint p1 = CGPointMake(100/4+10, 100/2+10);
    [path addLineToPoint:p1];
    
    
    CGPoint p2 = CGPointMake(100/4*3, 100/4);
    [path addLineToPoint:p2];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor greenColor].CGColor;
    layer.lineWidth = 5;
    layer.path = path.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 0.5;
    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    
    [self.contentView.layer addSublayer:layer];
}


- (void)drawWraning {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100/2, 100/2) radius:100/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(100/2, 100/6)];
    CGPoint p1 = CGPointMake(100/2, 100/6*3.8);
    [path addLineToPoint:p1];
    
    [path moveToPoint:CGPointMake(100/2, 100/6*4.5)];
    [path addArcWithCenter:CGPointMake(100/2, 100/6*4.5) radius:2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    layer.lineWidth = 5;
    layer.path = path.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 0.5;
    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    
    [self.contentView.layer addSublayer:layer];
}


- (void)clickAction:(UIButton *)btn{
    
    if (_contentView != nil) {
        [_contentView removeFromSuperview];
        _contentView = nil;
    }
    
    [self.view addSubview:self.contentView];

    _count ++;
    
    if (_count%3 == 0) {
        [self drawTick];
    }else if (_count%3 == 1) {
        [self drawWraning];
    }else{
        [self drawError];
    }
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(kSCREEN_SIZE.width/2, 20, 100, 100)];
        _contentView.center = CGPointMake(self.view.center.x, 100);
    }
    return _contentView;
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(20, 80, 80, 40);
        [_btn setTitle:@"Click" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [_btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}





- (UIImageView *)beaconView {
    if (!_beaconView) {
        _beaconView = [[UIImageView alloc] init];
        _beaconView.frame = CGRectMake(5, 205, 20, 20);
        _beaconView.image = [UIImage imageNamed:@"IPhone_5s"];
        _beaconView.backgroundColor = [UIColor orangeColor];
        _beaconView.center = self.view.center;
        _beaconView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _beaconView;
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

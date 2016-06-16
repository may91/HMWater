//
//  HMWaterView.m
//  PrivateBeauty
//
//  Created by 小金子 on 16/6/16.
//  Copyright © 2016年 小金子. All rights reserved.
//

#import "HMWaterView.h"

@interface HMWaterView ()
{
    UIColor *_currentWaterColor1;
    float _currentLinePointY1;
    float a1;
    float b1;
    BOOL jia1;
    
    UIColor *_currentWaterColor2;
    float _currentLinePointY2;
    float a2;
    float b2;
    BOOL jia2;
    
    UIColor *_currentWaterColor3;
    float _currentLinePointY3;
    float a3;
    float b3;
    BOOL jia3;

}

@end


@implementation HMWaterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        a1 = 3.5;
        b1 = 0;
        jia1 = NO;
        _currentWaterColor1 = [UIColor colorWithWhite:1 alpha:0.2];
        _currentLinePointY1 = 15;
        
        a2 = 2.5;
        b2 = 160;
        jia2 = NO;
        _currentWaterColor2 = [UIColor colorWithWhite:1 alpha:0.6];
        _currentLinePointY2 = 23;
        
        a3 = 1.5;
        b3 = 320;
        jia3 = NO;
        _currentWaterColor3 = [UIColor colorWithWhite:1 alpha:1.0];
        _currentLinePointY3 = 35;
        
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        
    }
    return self;
}


-(void)animateWave
{
    //11111111111111
    if (jia1) {
        a1 += 0.08;
    }else{
        a1 -= 0.08;
    }
    
    if (a1 <= 1) {
        jia1 = YES;
    }
    
    if (a1 >= 3.5) {
        jia1 = NO;
    }
    b1 += 0.13;
    
    //222222222222
    if (jia2) {
        a2 += 0.06;
    }else{
        a2 -= 0.06;
    }
    
    if (a2 <= 1) {
        jia2 = YES;
    }
    
    if (a2 >= 2.5) {
        jia2 = NO;
    }
    b2 += 0.10;
    
    //3333333333333333
    if (jia3) {
        a3 += 0.01;
    }else{
        a3 -= 0.01;
    }
    
    if (a3 <= 1) {
        jia3 = YES;
    }
    
    if (a3 >= 1.5) {
        jia3 = NO;
    }
    b3 += 0.09;
    
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    //画水line1
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    CGContextSetLineWidth(context1, 1);
    CGContextSetFillColorWithColor(context1, [_currentWaterColor1 CGColor]);
    
    float y1 = _currentLinePointY1;
    CGPathMoveToPoint(path1, NULL, 0, y1);
    for(float x = 0; x <= kScreenWidth; x++){
        y1 = a1 * sin( x/180*M_PI + 4*b1 /M_PI ) * 5 + _currentLinePointY1;
        CGPathAddLineToPoint(path1, nil, x, y1);
    }
    
    CGPathAddLineToPoint(path1, nil, kScreenWidth, rect.size.height);
    CGPathAddLineToPoint(path1, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path1, nil, 0, _currentLinePointY1);
    
    CGContextAddPath(context1, path1);
    CGContextFillPath(context1);
    CGContextDrawPath(context1, kCGPathStroke);
    CGPathRelease(path1);
    
    
    //画水line2
    CGContextRef context2 = UIGraphicsGetCurrentContext();
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGContextSetLineWidth(context2, 1);
    CGContextSetFillColorWithColor(context2, [_currentWaterColor2 CGColor]);
    
    float y2 = _currentLinePointY2;
    CGPathMoveToPoint(path2, NULL, 0, y2);
    for(float x = 0; x <= kScreenWidth; x++){
        y2= a2 * sin( x/180 * M_PI + 4 * b2/M_PI ) * 5 + _currentLinePointY2;
        CGPathAddLineToPoint(path2, nil, x, y2);
    }
    
    CGPathAddLineToPoint(path2, nil, kScreenWidth, rect.size.height);
    CGPathAddLineToPoint(path2, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path2, nil, 0, _currentLinePointY2);
    
    CGContextAddPath(context2, path2);
    CGContextFillPath(context2);
    CGContextDrawPath(context2, kCGPathStroke);
    CGPathRelease(path2);
    
    //画水line2
    CGContextRef context3 = UIGraphicsGetCurrentContext();
    CGMutablePathRef path3 = CGPathCreateMutable();
    CGContextSetLineWidth(context3, 1);
    CGContextSetFillColorWithColor(context3, [_currentWaterColor3 CGColor]);
    
    float y3 = _currentLinePointY3;
    CGPathMoveToPoint(path3, NULL, 0, y3);
    for(float x = 0; x <= kScreenWidth; x++){
        y3= a3 * sin( x/180 * M_PI + 4 * b3/M_PI ) * 5 + _currentLinePointY3;
        CGPathAddLineToPoint(path3, nil, x, y3);
    }
    
    CGPathAddLineToPoint(path3, nil, kScreenWidth, rect.size.height);
    CGPathAddLineToPoint(path3, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path3, nil, 0, _currentLinePointY3);
    
    CGContextAddPath(context3, path3);
    CGContextFillPath(context3);
    CGContextDrawPath(context3, kCGPathStroke);
    CGPathRelease(path3);

}


@end

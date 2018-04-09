//
//  drawRectView.m
//  MyCalculator
//
//  Created by zhengcc on 14/12/28.
//  Copyright (c) 2014年 SSE USTC. All rights reserved.
//

#import "drawRectView.h"

@implementation drawRectView

#define  DEFAULT_FACE_CARD_SCALE_FACTOR 0.90
#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12
- (CGFloat)cornerScaleFacctor { return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT; }
- (CGFloat)cornerRadius { return  CORNER_RADIUS * [self cornerScaleFacctor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }

-(void)drawRect:(CGRect)rect{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    [roundedRect addClip];
    [[UIColor whiteColor] setStroke];
    [roundedRect stroke];
    
    
}

- (void)setup
{
    self.backgroundColor = nil; //don't draw background
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;//bounds change call drawRect
}
- (void)awakeFromNib
{
    [self setup];
    [self setNeedsDisplay];
    [super awakeFromNib];
}

@end

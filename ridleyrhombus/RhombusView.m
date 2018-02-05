//
//  RhombusView.m
//  ridleyrhombus
//
//  Created by Hassan Ahmed Khan on 2/2/18.
//  Copyright © 2018 Hassan Ahmed Khan. All rights reserved.
//

#import "RhombusView.h"
#import "Colors.h"

@implementation RhombusView
- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    CGContextTranslateCTM(context, -30.0, 0.0);
    [self doRhombus:context];
    [super drawRect:dirtyRect];
}

- (void)doRhombus:(CGContextRef)context {
    // Load colors
    NSArray *colors = [Colors colors];
    
    // Rotate ctm to 270 degrees
    CGContextRotateCTM(context, M_PI + M_PI_2);
    int totalCount = 0;
    for (int j = 0; j < 15; j++) {
        CGContextSaveGState(context);
        for (int i = 0; i < 13; i++) {
            NSColor *color = colors[totalCount % colors.count];
            CGContextSetRGBFillColor(context, color.redComponent, color.greenComponent, color.blueComponent, color.alphaComponent);
            [self addRhombusPath:context];
            CGContextFillPath(context);
            CGContextTranslateCTM(context, 0, 45);
            totalCount++;
        }
        CGContextRestoreGState(context);
        CGContextTranslateCTM(context, -30, j % 2 == 0? 23 : -23);
    }
    

}

- (void)addRhombusPath:(CGContextRef)context {
    // Begin path
    CGContextBeginPath(context);
    CGPoint p0 = {0, 0};
    CGContextMoveToPoint(context, p0.x, p0.y);
    // ***** Segment 1 *****
    CGContextAddLineToPoint(context, 30.0, 0.0);
    // ***** Segment 2 *****
    CGContextAddArc(context, 30.0, 5.0, 5.0, M_PI + M_PI_2, M_PI + M_PI_2 + M_PI_4, 0);
    // ***** Segment 3 *****
    CGContextAddArc(context, 45.0, 25.0, 5.0, M_PI + M_PI_2 + M_PI_4, M_PI_4, 0);
    // ***** Segment 4 *****
    CGContextAddArc(context, 30.0, 41.0, 5.0, M_PI_4, M_PI_2, 0);
    // ***** Segment 5 *****
    CGContextAddLineToPoint(context, 0, 46.0);
    CGContextClosePath(context);
}

- (void)doRhombusAgain:(CGContextRef)context {
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, 10);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 100.0, 0.0);
    CGContextAddLineToPoint(context, 120.0, 50.0);
    
    CGContextStrokePath(context);
}
@end

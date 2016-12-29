//
//  MoveableView.m
//  BubbleSpeechView
//
//  Created by  on 12/29/13.
//  Copyright © 2013 thanhnv. All rights reserved.
//

#import "MoveableView.h"

@interface MoveableView ()

@property (nonatomic) float oldX, oldY;

@end

@implementation MoveableView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    self.oldX = touchLocation.x;
    self.oldY = touchLocation.y;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    float deltaX = [[touches anyObject]locationInView:self].x - self.oldX;
    float deltaY = [[touches anyObject]locationInView:self].y - self.oldY;
    if (deltaX != 0 && deltaY != 0) {
        if ([self.delegate respondsToSelector:@selector(movableViewDidBeginMove:)]) {
            [self.delegate movableViewDidBeginMove:self];
        }
    }
    if ([self.delegate respondsToSelector:@selector(movableView:deltaX:deltaY:)]) {
        [self.delegate movableView:self deltaX:deltaX deltaY:deltaY];
    }
}

@end

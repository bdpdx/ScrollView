//
//  TapDetectingImageView.m
//  ZoomDemo
//
//  Created by jamie on 9/7/13.
//  Copyright (c) 2013 demo. All rights reserved.
//

#import "TapDetectingImageView.h"
#import "UIKit/UITapGestureRecognizer.h"

@implementation TapDetectingImageView {
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)initWithImage:(UIImage *)image {
  self = [super initWithImage:image];
  if (!self)
    return nil;
  
  UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
  [self addGestureRecognizer:recognizer];
  UITapGestureRecognizer *twoFingers = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
  twoFingers.numberOfTouchesRequired = 2;
  [self addGestureRecognizer:twoFingers];
  [self setUserInteractionEnabled:YES];
  
  return self;
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer {
  if(gestureRecognizer.numberOfTouches == 1){
    [self.delegate tapDetectingImageView:self gotOneFingerTapAtPoint:[gestureRecognizer locationInView:self]];
    NSLog(@"One Finger Tap!");
  }else if(gestureRecognizer.numberOfTouches == 2){
    [self.delegate tapDetectingImageView:self gotTwoFingerTapAtPoint:[gestureRecognizer locationInView:self]];
    NSLog(@"Two Finger Tap!");
  }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

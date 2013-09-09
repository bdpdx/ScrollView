//
//  TapDetectingImageView.h
//  ZoomDemo
//
//  Created by jamie on 9/7/13.
//  Copyright (c) 2013 demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TapDetectingImageViewDelegate;

@interface TapDetectingImageView : UIImageView

@property (nonatomic) id <TapDetectingImageViewDelegate> delegate;

@end

@protocol TapDetectingImageViewDelegate <NSObject>

- (void) tapDetectingImageView:(TapDetectingImageView*)view gotOneFingerTapAtPoint:(CGPoint) tapPoint;

- (void) tapDetectingImageView:(TapDetectingImageView*)view gotTwoFingerTapAtPoint:(CGPoint) tapPoint;

@end


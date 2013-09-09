//
//  RootViewController.m
//  ZoomDemo
//
//  Created by jamie on 9/7/13.
//  Copyright (c) 2013 demo. All rights reserved.
//

#import "RootViewController.h"
#import "TapDetectingImageView.h"

#define ZOOM_VIEW_TAG 99

@interface RootViewController ()<UIScrollViewDelegate, TapDetectingImageViewDelegate, UIGestureRecognizerDelegate>{
  UIScrollView *imageScrollView;
}
@end

@implementation RootViewController

- (void)loadView {
  [super loadView];
  imageScrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  imageScrollView.backgroundColor = [UIColor blackColor];
  [self.view addSubview:imageScrollView];
  
//  UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WeCanDoIt.jpg"]];
//  UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
//  [imageView addGestureRecognizer:tapRecognizer];
//  imageView.userInteractionEnabled = YES;
  TapDetectingImageView *imageView = [[TapDetectingImageView alloc] initWithImage:[UIImage imageNamed:@"WeCanDoIt.jpg"]];
  imageView.delegate = self;
  imageView.tag = ZOOM_VIEW_TAG;
  [imageScrollView addSubview:imageView];
  imageScrollView.contentSize = [imageView frame].size;
  
  imageScrollView.delegate = self;
  imageScrollView.bouncesZoom = YES;
  float minScale = imageScrollView.frame.size.width / imageView.frame.size.width;
  imageScrollView.minimumZoomScale = minScale;
  imageScrollView.zoomScale = minScale;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return [imageScrollView viewWithTag:ZOOM_VIEW_TAG];
}

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotOneFingerTapAtPoint:(CGPoint)tapPoint {
  float newScale = imageScrollView.zoomScale * 1.5;
  CGRect newZoomRect = [self zoomRectForScale:newScale withCenter:tapPoint];
  [imageScrollView zoomToRect:newZoomRect animated:YES];
  
}

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotTwoFingerTapAtPoint:(CGPoint)tapPoint {
  
  float newScale = imageScrollView.zoomScale / 1.5;
  CGRect newZoomRect = [self zoomRectForScale:newScale withCenter:tapPoint];
  [imageScrollView zoomToRect:newZoomRect animated:YES];
  
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark

- (CGRect) zoomRectForScale: (float)scale withCenter:(CGPoint)center {
  CGRect zoomRect;
  zoomRect.size.width = imageScrollView.frame.size.width / scale;
  zoomRect.size.height = imageScrollView.frame.size.height / scale;
  zoomRect.origin.x = center.x - (zoomRect.size.width /2.0f);
  zoomRect.origin.y = center.y - (zoomRect.size.height /2.0f);
  return zoomRect;
}

@end

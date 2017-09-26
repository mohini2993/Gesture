//
//  ViewController.h
//  day8ios_gesture
//
//  Created by Student 01 on 13/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextViewController.h"
@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *myImage;
- (IBAction)handlepan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)handlepinch:(UIPinchGestureRecognizer *)recognizer1;

- (IBAction)myZoomOutBtn:(id)sender;
@property CGRect originFrame;
@end


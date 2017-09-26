//
//  ViewController.m
//  day8ios_gesture
//
//  Created by Student 01 on 13/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originFrame=self.myImage.frame;
    //image single tap
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    singleTap.numberOfTapsRequired=1;
    [self.view addGestureRecognizer:singleTap];
    
    /*  //double tap gesture
     UITapGestureRecognizer *doubleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
     doubleTap.numberOfTapsRequired=2;
     [self.view addGestureRecognizer:doubleTap]; */
    
    
    //left & right tap
    UISwipeGestureRecognizer *leftSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleLeftSwipe:)];
    leftSwipe.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *rightSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleRightSwipe:)];
    rightSwipe.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
    
    //imagetap gesture
    UITapGestureRecognizer *imagetap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleImagetap:)];
    imagetap.numberOfTapsRequired=1;
    [self.myImage addGestureRecognizer:imagetap];
    
    //pan gesture
    UIPanGestureRecognizer *pantap=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlepan:)];
    [self.myImage addGestureRecognizer:pantap];
   
    //pinch gesture
    UIPinchGestureRecognizer *pinchImg=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlepinch:)];
    [self.myImage addGestureRecognizer:pinchImg];
    
    //zoom in
    UITapGestureRecognizer *imageTapZoomIn=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageZoomIn:)];
    imageTapZoomIn.numberOfTapsRequired=1;
    [self.myImage addGestureRecognizer:imageTapZoomIn];
    
    //zoom out
    UIGestureRecognizer *imageTapZoomOut=[[UIGestureRecognizer alloc]initWithTarget:self action:@selector(myZoomOutBtn:)];
    [self.myImage addGestureRecognizer:imageTapZoomOut];
    
    // Do any additional setup after loading the view, typically from a nib
}
-(void)handleTap:(UITapGestureRecognizer *)sender
{
    self.view.backgroundColor=[UIColor redColor];
}

-(void)handleImagetap:(UITapGestureRecognizer *)sender
{
    NextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    [self.navigationController pushViewController:nvc animated:YES];
}

-(void)handleLeftSwipe:(UITapGestureRecognizer *)sender
{
    self.view.backgroundColor=[UIColor blueColor];
}
-(void)handleRightSwipe:(UITapGestureRecognizer *)sender
{
    self.view.backgroundColor=[UIColor greenColor];
}

- (IBAction)handlepan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation=[recognizer translationInView:self.view];
    recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x,recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

- (IBAction)handlepinch:(UIPinchGestureRecognizer *)recognizer1
{
    recognizer1.view.transform=CGAffineTransformScale(recognizer1.view.transform,recognizer1.scale,recognizer1.scale);
    recognizer1.scale=1;
}
-(void)imageZoomIn:(UIGestureRecognizer *)sender
{
    self.myImage.frame=CGRectMake(self.myImage.frame.origin.x-10, self.myImage.frame.origin.y-10, self.myImage.frame.size.width+10, self.myImage.frame.size.height+10);
}

- (IBAction)myZoomOutBtn:(id)sender
{
    self.myImage.frame=self.originFrame;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

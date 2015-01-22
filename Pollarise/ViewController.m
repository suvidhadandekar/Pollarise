//
//  ViewController.m
//  Pollarise
//
//  Created by Suvidha on 20/01/15.
//  Copyright (c) 2015 Volga Infotech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *animTimer;
    int currentPage;
}

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

@end


@implementation ViewController

@synthesize myImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
<<<<<<< HEAD
  
    currentPage = 1;
    
    [self.imageScrollView setUserInteractionEnabled:NO];
    
    myImages = [[NSMutableArray alloc] initWithObjects:@"PollTest1.png", @"PollTest2.png", @"PollTest3.png", nil];
    
    
    for (int i = 0; i < myImages.count; i++)
    {
     
        CGRect origin;
        origin.origin.x = self.view.frame.size.width * i;
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(origin.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
       
        imageview.image  = [UIImage imageNamed:[myImages objectAtIndex:i]];
                [self.imageScrollView addSubview:imageview];
        
        
    }
    
    self.imageScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.imageScrollView.frame.size.height);
    self.imageScrollView.contentOffset = CGPointMake(0, 0);
    
}
- (IBAction)changePage:(id)sender
{

}


-(void)viewWillAppear:(BOOL)animated
{
      [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    //[self animateScroll];
    [self setTimer];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [animTimer invalidate];
}

-(void)setTimer
{
    animTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(animateScroll) userInfo:nil repeats:YES];
}

-(void)animateScroll
{
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{ [self.imageScrollView setContentOffset:CGPointMake(self.imageScrollView.frame.size.width * currentPage, 0)];}
                     completion:NULL];
}

- (IBAction)clickonTwitter:(id)sender
{
    NSLog(@"twitter");
    
}

- (IBAction)clickonFacebook:(id)sender
{
    NSLog(@"facebook");
    
=======
    // Do any additional setup after loading the view, typically from a nib.

>>>>>>> aad16f6a51c3815fa2ccf952ba080360514477b8
}

- (IBAction)clickonLogin:(id)sender
{
    NSLog(@"login click");
}

- (IBAction)clickonSignup:(id)sender
{
    
    NSLog(@"sign up click");
}


#pragma -mark scrollview delegate method

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    
    CGFloat pageWidth = self.imageScrollView.frame.size.width;
    int page = floor((self.imageScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pagecontroll.currentPage = page;

    currentPage = page + 1;
    
    [self performSelector:@selector(scrollViewDidEndScrollingAnimation:) withObject:nil afterDelay:1.0];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    if(self.imageScrollView.contentOffset.x >= 2*self.view.frame.size.width)
    {
        [self performSelector:@selector(resetScrollView) withObject:nil afterDelay:1.7];
        
    }
}


-(void)resetScrollView
{
    self.imageScrollView.contentOffset = CGPointMake(0, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end

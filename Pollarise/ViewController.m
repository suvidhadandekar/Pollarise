//
//  ViewController.m
//  Pollarise
//
//  Created by Suvidha on 20/01/15.
//  Copyright (c) 2015 Volga Infotech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

@end


@implementation ViewController

@synthesize myImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.title = @"First";
//    
    NSArray *colors = [NSArray arrayWithObjects:[UIColor grayColor], [UIColor greenColor], [UIColor blueColor], nil];
    myImages = [[NSMutableArray alloc] initWithObjects:@"PollTest1.png", @"PollTest2.png", @"PollTest3.png", nil];
    
    for (int i = 0; i < 3; i++)
    {
//        CGRect frame;
//        frame.origin.x = self.imageScrollView.frame.size.width * i;
//        frame.origin.y = 0;
//        frame.size = self.imageScrollView.frame.size;
//        
//        UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, 0, self.imageScrollView.frame.size.width, self.view.frame.size.height)];
//        subview.backgroundColor = [colors objectAtIndex:i];
//        [self.imageScrollView addSubview:subview];
        
        CGRect origin;
        origin.origin.x = self.view.frame.size.width * i;
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(origin.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        
        //        UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(origin.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
//        subview.backgroundColor = [colors objectAtIndex:i];
        imageview.image  = [UIImage imageNamed:[myImages objectAtIndex:i]];
        

        [self.imageScrollView addSubview:imageview];
        
        
    }
    
    self.imageScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.imageScrollView.frame.size.height);
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
   
    CGFloat pageWidth = self.imageScrollView.frame.size.width;
    int page = floor((self.imageScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pagecontroll.currentPage = page;
    
   
    
    
}
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    pageControlBeingUsed = NO;
//}

//- (IBAction)changePage:(id)sender
//{
//   
//    
//    CGRect frame = self.imageScrollView.frame;
//     NSLog(@"%@", NSStringFromCGRect(frame));
//    
//    int page = self.pagecontroll.currentPage;
//    NSLog(@"%d",page);
//    
//    
//    frame.origin.x = self.imageScrollView.frame.size.width * page;
//    
//    
//    frame.origin.y = 0;
//    frame.size = self.imageScrollView.frame.size;
//     NSLog(@"%@", NSStringFromCGRect(frame));
//    
//    [self.imageScrollView scrollRectToVisible:frame animated:YES];
////    pageControlBeingUsed = YES;
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

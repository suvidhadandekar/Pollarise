//
//  ViewController.h
//  Pollarise
//
//  Created by Suvidha on 20/01/15.
//  Copyright (c) 2015 Volga Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>{
    
    BOOL  pageControlBeingUsed;
    
}


@property (nonatomic, strong) NSMutableArray *myImages;

@property (weak, nonatomic) IBOutlet UIPageControl *pagecontroll;
- (IBAction)changePage:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnTwitter;

@property (weak, nonatomic) IBOutlet UIButton *btnFacebook;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnSignup;

- (IBAction)clickonTwitter:(id)sender;
- (IBAction)clickonFacebook:(id)sender;
- (IBAction)clickonLogin:(id)sender;
- (IBAction)clickonSignup:(id)sender;


@end


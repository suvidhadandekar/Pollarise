//
//  FollowFriendsSearchViewController.h
//  Pollarise
//
//  Created by Revati Parandekar on 21/01/15.
//  Copyright (c) 2015 Volga Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowFriendsSearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;
- (IBAction)clickonBack:(id)sender;

- (IBAction)clickonFollow:(id)sender;


@end

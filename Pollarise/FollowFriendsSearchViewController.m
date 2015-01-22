//
//  FollowFriendsSearchViewController.m
//  Pollarise
//
//  Created by Revati Parandekar on 21/01/15.
//  Copyright (c) 2015 Volga Infotech. All rights reserved.
//

#import "FollowFriendsSearchViewController.h"

@interface FollowFriendsSearchViewController ()


@end

@implementation FollowFriendsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)clickonFollow:(id)sender
{
    NSLog(@"Follow clicked");
    
}
- (IBAction)clickonBack:(id)sender
{
     [self.navigationController popViewControllerAnimated:YES];
    
}
@end

//
//  SignUpViewController.h
//  Pollarise
//
//  Created by Akash on 20/01/15.
//  Copyright (c) 2015 Volga Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownView.h"

@interface SignUpViewController : UIViewController<DropDownViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *txtcountryName;
-(IBAction)DropDownFieldClick;
@end

//
//  SignUpViewController.m
//  Pollarise
//
//  Created by Akash on 20/01/15.
//  Copyright (c) 2015 Volga Infotech. All rights reserved.
//

#import "SignUpViewController.h"
#import "DropDownView.h"

@implementation SignUpViewController{
    NSArray *countryListArray;
    DropDownView *dropDownView;
   // UITapGestureRecognizer *tapGestureRecognizer;
}

@synthesize txtcountryName;


-(void)viewDidLoad{
    //Arraylist for DropDown list view
    countryListArray = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"India",@"China",@"Brazil",@"London",nil]];
    [txtcountryName setTitle:[countryListArray objectAtIndex:0] forState:UIControlStateNormal];
  
    
//    tap Gesture for Remove the DropDown list while click on anther view
//    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDropDown)];
//    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    
    
}

#pragma mark -dropdownListMethods

-(void)dropDownCellSelected:(NSInteger)returnIndex{
    
    [txtcountryName setTitle:[countryListArray objectAtIndex:returnIndex]forState:UIControlStateNormal];
    
}

-(IBAction)DropDownFieldClick{
    [dropDownView openAnimation];
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"dropdown button  orientation and myUIView.x==%f and myUIView.y==%f",
          txtcountryName.frame.origin.x,
          txtcountryName.frame.origin.y );
    
    dropDownView = [[DropDownView alloc] initWithArrayData:countryListArray cellHeight:30 heightTableView:150 paddingTop:-8 paddingLeft:-5 paddingRight:-10 refView:txtcountryName animation:BLENDIN openAnimationDuration:1.5 closeAnimationDuration:1];
    
    dropDownView.delegate = self;
    
    [self.view addSubview:dropDownView.view];
}

#pragma mark -Gesture Method
-(void)hideDropDown{
    
   // [dropDownView closeAnimation];
}
@end

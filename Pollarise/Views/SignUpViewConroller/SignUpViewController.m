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
    UIDatePicker *dobPickerView;
    
     UITapGestureRecognizer *tapOnDatePicker;
}

@synthesize txtcountryName, txtDateOfBirth;


-(void)viewDidLoad{
    //Arraylist for DropDown list view
    countryListArray = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"India",@"China",@"Brazil",@"London",nil]];
    [txtcountryName setTitle:[countryListArray objectAtIndex:0] forState:UIControlStateNormal];
    self.txtDateOfBirth.delegate = self;
    
    //    tap Gesture for Remove the DropDown list while click on anther view
    //    tapOnDatePicker = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDropDown)];
    //    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"dropdown button  orientation and myUIView.x==%f and myUIView.y==%f",
          txtcountryName.frame.origin.x,
          txtcountryName.frame.origin.y );
    
    dropDownView = [[DropDownView alloc] initWithArrayData:countryListArray cellHeight:30 heightTableView:150 paddingTop:-8 paddingLeft:-5 paddingRight:-10 refView:txtcountryName animation:BLENDIN openAnimationDuration:1.5 closeAnimationDuration:1];
    
    dropDownView.delegate = self;
    
    [self.view addSubview:dropDownView.view];
    
    
}

#pragma mark -dropdownListMethods

-(void)dropDownCellSelected:(NSInteger)returnIndex{
    
    [txtcountryName setTitle:[countryListArray objectAtIndex:returnIndex]forState:UIControlStateNormal];
    
}

-(IBAction)DropDownFieldClick{
    [dropDownView openAnimation];
}


#pragma mark -Gesture Method
-(void)hideDropDown{
    
    // [dropDownView closeAnimation];
}



#pragma mark -TextField Delegate Methods


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
   
    
    if([textField isEqual:self.txtDateOfBirth]){
        [self.view addSubview:self.createPickerView];
        [self showPickerView];
    }else{
        [self hidePickerView];
    }
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
    if([textField isEqual:self.txtDateOfBirth]){
        [textField resignFirstResponder];
//        CGRect rc = [textField bounds];
//        rc = [textField convertRect:rc toView:self.view];
//        CGPoint pt = rc.origin ;
//        pt.x = 0 ;
//        pt.y -= 60 ;
//        [self.view setContentOffset:pt animated:YES];
    }
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark -PickerView Methods
-(UIView *)createPickerView{
    
    dobPickerView  = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, 200, 200)];
    dobPickerView.datePickerMode = UIDatePickerModeDate; ;
    dobPickerView.backgroundColor = [UIColor whiteColor];
    dobPickerView.hidden = NO;
    dobPickerView.date = [NSDate date];
    dobPickerView.maximumDate = [NSDate date];
   
    tapOnDatePicker = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnDatePicker:)];
    tapOnDatePicker.numberOfTapsRequired = 1;
    [dobPickerView addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    [dobPickerView addGestureRecognizer:tapOnDatePicker];
    [txtDateOfBirth setInputView:dobPickerView];
    
    return dobPickerView;
    
}




-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"did Select Row in DatePicker");
    [self hidePickerView];
}


-(void)showPickerView{
    [UIView animateWithDuration:0.5
                          delay:0.10
                        options: UIViewAnimationOptionBeginFromCurrentState
                     animations:^
     {
         [self->dobPickerView setFrame:CGRectMake(0, self.view.frame.size.height-self.view.frame.size.height/3, self.view.frame.size.width, self.view.frame.size.height-self.view.frame.size.height/3)];
     }
                     completion:^(BOOL finished)
     {
        // NSLog(@"Completed");
         
     }];
}



-(void)hidePickerView{
    [UIView animateWithDuration:0.5
                          delay:0.10
                        options: UIViewAnimationOptionBeginFromCurrentState
                     animations:^
     {
         [self->dobPickerView setFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-self.view.frame.size.height/3)];
     }
                     completion:^(BOOL finished)
     {
        // NSLog(@"Completed");
     }];
}


-(void)tapOnDatePicker:(UITapGestureRecognizer *)recognizer{
    
    NSLog(@"tapOnDatePicker");
    [self hidePickerView];
    
}

-(void)datePickerValueChanged{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:dobPickerView.date];
    txtDateOfBirth.text = strDate;
    
    
    
    
    
}
@end

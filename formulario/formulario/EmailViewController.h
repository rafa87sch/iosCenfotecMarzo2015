//
//  EmailViewController.h
//  formulario
//
//  Created by Cesar Brenes on 3/7/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;

@interface EmailViewController : UIViewController


@property (nonatomic,strong) Person *personObject;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
- (IBAction)showNextScreen:(id)sender;

@end

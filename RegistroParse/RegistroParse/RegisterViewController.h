//
//  RegisterViewController.h
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextFieldLimit.h"

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextFieldLimit *nameTextField;
@property (weak, nonatomic) IBOutlet UITextFieldLimit *emailTextField;
@property (weak, nonatomic) IBOutlet UITextFieldLimit *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextFieldLimit *password2TexField;
- (IBAction)registerAction:(id)sender;
@end

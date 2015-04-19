//
//  LoginViewController.m
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    
    [PFUser logInWithUsernameInBackground:self.emailTextfield.text password:self.passwordTextfield.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];
    
}

- (IBAction)SignInAction:(id)sender {
    RegisterViewController *registerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

- (IBAction)forgotPasswordAction:(id)sender {
}
@end

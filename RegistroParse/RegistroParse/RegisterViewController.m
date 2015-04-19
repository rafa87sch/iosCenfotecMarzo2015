//
//  RegisterViewController.m
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.emailTextField setLimit:50];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)registerAction:(id)sender {
    [self doRegistration];
}

-(void)doRegistration{
    BOOL passwordAreEqual = [self.password2TexField.text isEqualToString:self.passwordTextField.text];
    BOOL textFieldDontHaveSpacesInWhite = [self validateAllSpacesInWhiteInTextFields];
    if (passwordAreEqual && textFieldDontHaveSpacesInWhite) {
//        LISTO PARA TRABAJAR CON PARSE
        [self registerWithParse];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Verifique los campos ingresados" delegate:nil cancelButtonTitle:@"Aceptae" otherButtonTitles:nil, nil]
        ;
        [alert show];
    }
}


-(void)registerWithParse{
    PFUser *user = [PFUser user];
    user.username = self.emailTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.emailTextField.text;
    user[@"name"] = self.nameTextField.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"ERROR %@",errorString);
        }
    }];
}

//FUNCION PARA VALIDAR ESPACIOS EN BLANCO
-(BOOL)validateWhiteSpaces:(NSString*)textToEvaluate{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [textToEvaluate stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] == 0) {
        // Text was empty or only whitespace.
        return NO;
    }
    else{
        return YES;
    }
}
-(BOOL)validateAllSpacesInWhiteInTextFields{
    BOOL nameValidation = [self validateWhiteSpaces:self.nameTextField.text];
    BOOL emailValidation = [self validateWhiteSpaces:self.emailTextField.text];
    BOOL password1 = [self validateWhiteSpaces:self.passwordTextField.text];
    BOOL password2 = [self validateWhiteSpaces:self.password2TexField.text];
    if (nameValidation && emailValidation && password1 && password2) {
        return YES;
    }
    else{
        return NO;
    }
}


@end

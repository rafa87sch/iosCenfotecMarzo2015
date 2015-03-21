//
//  EmailViewController.m
//  formulario
//
//  Created by Cesar Brenes on 3/7/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)validateRegularExpresion:(NSString*)email regularExpression:(NSString*)regularExpression{
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regularExpression options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:email options:0 range:NSMakeRange(0, [email length])];
    if (regExMatches == 0) {
        return NO;
    }
    return  YES;
}






- (IBAction)showNextScreen:(id)sender {
    
    
    
    NSString *regularExpression = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z{2,4}$]";
    BOOL result = [self validateRegularExpresion:self.emailTextField.text regularExpression:regularExpression];
    UIAlertView *alert;
    if (result) {
//        paso la validación
        alert = [[UIAlertView alloc] initWithTitle:@"Felicitaciones" message:@"Su email es valido" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
    }
    else{
//        error en la validacion
        alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:[NSString stringWithFormat:@"El email: %@ no es valido",self.emailTextField.text] delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
    
    }
    
    [alert show];
}
@end

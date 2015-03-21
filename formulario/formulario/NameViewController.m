//
//  NameViewController.m
//  formulario
//
//  Created by Cesar Brenes on 3/7/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "NameViewController.h"
#import "Person.h"
#import "EmailViewController.h"

@interface NameViewController ()

@end

@implementation NameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.personObject = [Person new];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextAction:(id)sender {
    
    NSString *name = [self.nameTextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (name.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El nombre no puede estar vacio" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }
    else{
        self.personObject.name = self.nameTextfield.text;
        EmailViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"emailViewController"];
        secondView.personObject = self.personObject;
        [self.navigationController pushViewController:secondView animated:YES];
    }
}
@end

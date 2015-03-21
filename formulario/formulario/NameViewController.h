//
//  NameViewController.h
//  formulario
//
//  Created by Cesar Brenes on 3/7/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;
@interface NameViewController : UIViewController

// Properties
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (nonatomic,strong) Person *personObject;



//actions
- (IBAction)nextAction:(id)sender;

@end

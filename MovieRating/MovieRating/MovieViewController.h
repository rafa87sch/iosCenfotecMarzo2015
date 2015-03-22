//
//  MovieViewController.h
//  MovieRating
//
//  Created by Cesar Brenes on 3/21/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryName;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;

@end

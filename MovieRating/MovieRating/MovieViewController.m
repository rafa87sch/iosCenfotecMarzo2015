//
//  MovieViewController.m
//  MovieRating
//
//  Created by Cesar Brenes on 3/21/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"

//aqui declaro todas mis constantes
const static int ZERO = 0;

@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMovie)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    // Do any additional setup after loading the view.
}

-(void)addMovie{
    //creamos el objeto de tipo movie
    Movie *movieToAdd = [Movie new];
    //LO LLENAMOS CON LA INFORMACIÓN SUMINISTRADA
    //POR EL USUARIO
    movieToAdd.name = self.nameTextField.text;
    movieToAdd.categoryName = self.categoryName.text;
    movieToAdd.year = [self.yearTextField.text intValue];
    movieToAdd.count = ZERO;
    movieToAdd.rating = ZERO;
    movieToAdd.totalRating = ZERO;
    //AGREGO EL OBJETO AL ARRAY
    [self.movieArray addObject:movieToAdd];
    //ME DEVUELVO A LA VISTA ANTERIOR
    [self.navigationController  popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

@end

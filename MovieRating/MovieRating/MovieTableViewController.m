//
//  MovieTableViewController.m
//  MovieRating
//
//  Created by Cesar Brenes on 3/21/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "MovieTableViewController.h"
#import "Movie.h"
#import "MovieViewController.h"
#import "RatingViewController.h"
#import "MoviesCustomCell.h"


static int NUMBER_OF_SECTION = 1;
static NSString *CELL_IDENTIFIER = @"CELL";
static NSString * CELL_ID = @"MoviesCustomCell";
static CGFloat HEIGHT_OF_ROW = 70.0;



@interface MovieTableViewController ()

@end

@implementation MovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    UINib *nib = [UINib nibWithNibName:CELL_ID bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_ID];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


-(void)initialize{
//    initializo el array
    self.moviesArray = [NSMutableArray new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NUMBER_OF_SECTION;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return HEIGHT_OF_ROW;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoviesCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    
    // Configure the cell...
    
   // Movie *movieObject = [self.moviesArray objectAtIndex:indexPath.row];
    
    cell.nameLabelEXAMPLE.text = @"DSDSD";
    //cell.textLabel.text =
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //EXTRAIGO EL OBJETO MOVIE DEL ARRAY
    Movie *movieSelectedObject = [self.moviesArray objectAtIndex:indexPath.row];
    //CREO LA NUEVA VISTA A LA CUAL VOY A HACERLE EL PUSH
    RatingViewController *ratingView = [self.storyboard instantiateViewControllerWithIdentifier:@"RatingViewController"];
    //LE PASO EL OBJETO MOVIE EXTRAIDO ANTERIORMENTE A LA NUEVA VISTA
    ratingView.movieObject = movieSelectedObject;
    //HACEMOS UN PUSH A LA VISTA RATING VIEW CONTROLLER
    [self.navigationController pushViewController:ratingView animated:YES];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addMovieAction:(id)sender {
    MovieViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"MovieViewController"];
    // PASO POR REFERENCIA
    newView.movieArray = self.moviesArray;
    // PASO CON UN OBJECTO NUEVO SIN REFERENCIA
   // newView.movieArray = [[NSMutableArray alloc] initWithArray:self.moviesArray];
    
    [self.navigationController pushViewController:newView animated:YES];
}
@end

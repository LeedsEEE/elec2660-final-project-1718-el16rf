//
//  TableViewController.m
//  NSLogic
//
//  Created by Reuben Frankel [el16rf] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // https://stackoverflow.com/questions/12193458/show-and-hide-navigationbar-on-different-views
    // navigation bar shown for this view controller
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // Data Model object created
    self.data = [[DataModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

// number of sections in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// number of rows in table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 0;
    if (section == 0) {
        numberOfRows = self.data.samples.count;
    }
    return numberOfRows;
}

// moving data from SampleStyle to text fields in the table view controller
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SampleStyleCell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    
    if (indexPath.section == 0) {
        // create SampleStyle tempoary object
        SampleStyle *tempSampleStyle = [self.data.samples objectAtIndex:indexPath.row];
        
        cell.textLabel.text = tempSampleStyle.name;
        cell.detailTextLabel.text = tempSampleStyle.style;
    }
    return cell;
}

#pragma mark - Navigation

// on segue...
- (IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // https://stackoverflow.com/questions/12509422/how-to-perform-unwind-segue-programmatically
    // https://stackoverflow.com/questions/27392203/unwind-push-segue-from-uitableviewcell-tap
    // https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html
    // https://stackoverflow.com/questions/23450111/unwind-segue-with-uitableviewcell-in-xamarin-ios
    // if segue returns to main view
    if ([[segue identifier] isEqualToString:@"ReturnMainView"]) {
        // create view controller object
        ViewController *destinationViewController = [segue destinationViewController];
        
        // create table view cell object
        UITableViewCell *cell = (UITableViewCell *)sender;
        
        // if first cell is pressed
        if (cell.tag == 0) {
            NSLog(@"cell %ld pressed", cell.tag);
            
            // initialise samples
            [destinationViewController.data initElectroSamples];
        }
        
        else if (cell.tag == 1) {
            NSLog(@"cell %ld pressed", cell.tag);
            
            [destinationViewController.data initDubstepSamples];
        }
        
        else if (cell.tag == 2) {
            NSLog(@"cell %ld pressed", cell.tag);
            
            [destinationViewController.data initDrumAndBassSamples];
        }
        
        else if (cell.tag == 3) {
            NSLog(@"cell %ld pressed", cell.tag);
            
            [destinationViewController.data initHipHopSamples];
        }
        
        else if (cell.tag == 4) {
            NSLog(@"cell %ld pressed", cell.tag);
            
            [destinationViewController.data initFutureBassSamples];
        }
        [destinationViewController.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

// https://stackoverflow.com/questions/1214965/setting-action-for-back-button-in-navigation-controller
// dismisses the table view controller after a cell is selected
-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // hides navigation bar
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    [super viewWillDisappear:animated];
}

@end

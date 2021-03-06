//
//  TableViewController.h
//  NSLogic
//
//  Created by Reuben Frankel [el16rf] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "SampleStyle.h"
#import "ViewController.h"

@interface TableViewController : UITableViewController

// PROPERTIES
// Object declarations
@property (strong, nonatomic) DataModel *data;

@end

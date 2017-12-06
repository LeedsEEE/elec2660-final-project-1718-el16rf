//
//  TableViewController.h
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "SampleStyle.h"

@interface TableViewController : UITableViewController

@property (strong, nonatomic) DataModel *data;

@end

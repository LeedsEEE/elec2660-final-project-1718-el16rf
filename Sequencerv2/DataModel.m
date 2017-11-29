//
//  DataModel.m
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

-(void) initAudioPlayers {
    NSLog(@"initialising audio players...");
    
    // Track one
    NSString *trackOneFilePath = [[NSBundle mainBundle] pathForResource:@"c1" ofType:@"wav"];
    NSURL *trackOneFileURL = [[NSURL alloc] initFileURLWithPath:trackOneFilePath];
    self.trackOne = [[AVAudioPlayer alloc] initWithContentsOfURL:trackOneFileURL error:nil];
    [self.trackOne prepareToPlay];
}

@end

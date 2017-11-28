//
//  ViewController.h
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface ViewController : UIViewController {
    
    ///////////////
    // VARIABLES //
    ///////////////
    
    // Track state arrays
    NSInteger trackOneButtonStateArray[16];
    NSInteger trackTwoButtonStateArray[16];
    NSInteger trackThreeButtonStateArray[16];
    NSInteger trackFourButtonStateArray[16];
    NSInteger trackFiveButtonStateArray[16];
    NSInteger trackSixButtonStateArray[16];
}

////////////////
// PROPERTIES //
////////////////

// Object definitions
@property DataModel *data;

// Global controls
@property (weak, nonatomic) IBOutlet UISlider *BPMSlider;

// Track buttons
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackOneButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackTwoButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackThreeButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackFourButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackFiveButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackSixButtons;

/////////////
// METHODS //
/////////////

// Global controls
- (IBAction)didPressPlay:(id)sender;
- (IBAction)didMoveBPMSlider:(UISlider *)sender;

// Track buttons
- (IBAction)didPressTrackOne:(UIButton *)sender;
- (IBAction)didPressTrackTwo:(UIButton *)sender;
- (IBAction)didPressTrackThree:(UIButton *)sender;
- (IBAction)didPressTrackFour:(UIButton *)sender;
- (IBAction)didPressTrackFive:(UIButton *)sender;
- (IBAction)didPressTrackSix:(UIButton *)sender;

// Track faders



- (void) initTrackArrays;

@end


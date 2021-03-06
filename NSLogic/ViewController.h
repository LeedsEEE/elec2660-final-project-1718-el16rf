//
//  ViewController.h
//  NSLogic
//
//  Created by Reuben Frankel [el16rf] on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "TableViewController.h"

@interface ViewController : UIViewController {
    
    // VARIABLES
    // Track state arrays
    NSInteger trackOneButtonStateArray[16];
    NSInteger trackTwoButtonStateArray[16];
    NSInteger trackThreeButtonStateArray[16];
    NSInteger trackFourButtonStateArray[16];
    NSInteger trackFiveButtonStateArray[16];
    NSInteger trackSixButtonStateArray[16];
}

// PROPERTIES
// Object declarations
@property DataModel *data;

// Sample style selection states
@property BOOL *electroSelected;
@property BOOL *dubstepSelected;
@property BOOL *drumAndBassSelected;
@property BOOL *hipHopSelected;
@property BOOL *futureBassSelected;

// Global controls
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UISlider *BPMSlider;
@property (weak, nonatomic) IBOutlet UIButton *decrementButton;
@property (weak, nonatomic) IBOutlet UIButton *incrementButton;
@property (weak, nonatomic) IBOutlet UILabel *BPMLabel;
@property (weak, nonatomic) IBOutlet UIButton *drumStyleButton;

// Track buttons
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackOneButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackTwoButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackThreeButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackFourButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackFiveButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackSixButtons;

// Track faders
@property (weak, nonatomic) IBOutlet UISlider *trackOneVolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *trackTwoVolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *trackThreeVolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *trackFourVolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *trackFiveVolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *trackSixVolumeSlider;

// METHODS
// Global controls
- (IBAction)didPressPlay:(id)sender;
- (IBAction)didPressPause:(id)sender;
- (IBAction)didPressStop:(id)sender;
- (IBAction)didPressClear:(id)sender;
- (IBAction)didMoveBPMSlider:(UISlider *)sender;
- (IBAction)didPressBPMDecrement:(id)sender;
- (IBAction)didPressBPMIncrement:(id)sender;

// Track buttons
- (IBAction)didPressTrackOne:(UIButton *)sender;
- (IBAction)didPressTrackTwo:(UIButton *)sender;
- (IBAction)didPressTrackThree:(UIButton *)sender;
- (IBAction)didPressTrackFour:(UIButton *)sender;
- (IBAction)didPressTrackFive:(UIButton *)sender;
- (IBAction)didPressTrackSix:(UIButton *)sender;

// Track faders
- (IBAction)didMoveTrackOneVolumeSlider:(UISlider *)sender;
- (IBAction)didMoveTrackTwoVolumeSlider:(UISlider *)sender;
- (IBAction)didMoveTrackThreeVolumeSlider:(UISlider *)sender;
- (IBAction)didMoveTrackFourVolumeSlider:(UISlider *)sender;
- (IBAction)didMoveTrackFiveVolumeSlider:(UISlider *)sender;
- (IBAction)didMoveTrackSixVolumeSlider:(UISlider *)sender;

// Track toggles
- (IBAction)didToggleTrackOne:(UISwitch *)sender;
- (IBAction)didToggleTrackTwo:(UISwitch *)sender;
- (IBAction)didToggleTrackThree:(UISwitch *)sender;
- (IBAction)didToggleTrackFour:(UISwitch *)sender;
- (IBAction)didToggleTrackFive:(UISwitch *)sender;
- (IBAction)didToggleTrackSix:(UISwitch *)sender;

// Void functions
- (void) clearAll;

@end

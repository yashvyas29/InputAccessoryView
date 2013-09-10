//
//  ViewController.h
//  InputAccessoryView
//
//  Created by Chandra Prakash on 06/09/13.
//  Copyright (c) 2013 YashFiles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>
{
    CGPoint scrollViewPoint;
}

@property (weak, nonatomic) IBOutlet UIScrollView* scrollView;
@property (weak, nonatomic) UITextView* txtActive;
@property (weak, nonatomic) IBOutlet UITextView* txtFirst;
@property (weak, nonatomic) IBOutlet UITextView* txtSecond;
@property (weak, nonatomic) IBOutlet UIToolbar* keyboardToolbar;
@property (weak, nonatomic) IBOutlet UISegmentedControl* segment;

- (IBAction)hideKeyboard:(id)sender;
- (IBAction)segmentValueChanged;

@end

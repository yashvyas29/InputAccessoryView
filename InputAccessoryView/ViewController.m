//
//  ViewController.m
//  InputAccessoryView
//
//  Created by Chandra Prakash on 06/09/13.
//  Copyright (c) 2013 YashFiles. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    _scrollView.contentSize = CGSizeMake(320, 700);
    
    _txtFirst.inputAccessoryView = _keyboardToolbar;
    _txtSecond.inputAccessoryView = _keyboardToolbar;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideKeyboard:(id)sender {
    [_txtActive resignFirstResponder];
}

- (IBAction)segmentValueChanged {
    if (_segment.selectedSegmentIndex == 0 && _txtActive != _txtFirst) {
        [_txtFirst becomeFirstResponder];
    } else if (_segment.selectedSegmentIndex == 1 && _txtActive != _txtSecond) {
        [_txtSecond becomeFirstResponder];
    }
}

#pragma mark - UITextView delegates

- (void)textViewDidBeginEditing:(UITextView *)textView {
    _txtActive = textView;
    
    if (textView == _txtFirst) {
        
        if (_segment.selectedSegmentIndex == 1) {
            _segment.selectedSegmentIndex = 0;
        }
        
    } else if (textView == _txtSecond) {
        
        if (_segment.selectedSegmentIndex == 0) {
            _segment.selectedSegmentIndex = 1;
        }
        
        scrollViewPoint = _scrollView.contentOffset;
        CGRect rect = textView.bounds;
        [textView convertRect:rect toView:_scrollView];
        CGPoint point = rect.origin;
        point.y += 170;
        
        [UIView animateWithDuration:0.5 animations:^{
            [_scrollView setContentOffset:point];
        }];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView == _txtSecond) {
        [UIView animateWithDuration:0.5 animations:^{
            [_scrollView setContentOffset:scrollViewPoint];
        }];
    }
}

@end

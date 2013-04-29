//
//  ViewController.h
//  imageCaptureExample
//
//  Created by Chris Milne on 4/26/13.
//  Copyright (c) 2013 Chris Milne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)makeActionSheetAppear:(id)sender;
@end

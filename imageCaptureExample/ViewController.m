//
//  ViewController.m
//  imageCaptureExample
//
//  Created by Chris Milne on 4/26/13.
//  Copyright (c) 2013 Chris Milne. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property(strong, nonatomic) UIImagePickerController *imagePicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Photo Popup Functions -

- (IBAction)makeActionSheetAppear:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Photo Source"
                                                             delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Use Camera", @"Select from Folder", nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	[actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"actionSheet");
	// the user clicked one of the OK/Cancel buttons
	if (buttonIndex == 0) {
		[self pushTakePhotoScreenInDelegate];
	}
	else if (buttonIndex == 1) {
        [self pushChoosePhotoScreenInDelegate];
    }
}

-(void)pushTakePhotoScreenInDelegate
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"viewfinder_2.png"]];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    [imageView setFrame:CGRectMake(0, -52/2.0, screenSize.width, screenSize.height)];
    self.imagePicker.cameraOverlayView = imageView;
    self.imagePicker.delegate = self;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

-(void)pushChoosePhotoScreenInDelegate
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.delegate = self;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

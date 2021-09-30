//
//  SignUpInfo2ViewController.m
//  pimpler
//
//  Created by Techsviewer on 7/23/18.
//  Copyright © 2018 brainyapps. All rights reserved.
//

#import "SignUpInfo2ViewController.h"
#import "TermsViewController.h"

@interface SignUpInfo2ViewController ()<CircleImageAddDelegate, IQDropDownTextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImage * selectedImage;
    
    BOOL isCamera;
    BOOL isGallery;
}
@property (weak, nonatomic) IBOutlet CircleImageView *img_thumb;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *edt_gender;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *edt_ageBracker;
@property (nonatomic, retain) UIImagePickerController * picker;

@end

@implementation SignUpInfo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor *color = [UIColor colorWithRed:255.f/255.f green:128.f/255.f blue:102.f/255.f alpha:1.f];
    _edt_gender.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_edt_gender.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    _edt_ageBracker.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_edt_ageBracker.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    
    NSMutableArray * genders = [NSMutableArray new];
    [genders addObject:@"Male"];
    [genders addObject:@"Female"];
    self.edt_gender.itemList = genders;
    self.edt_gender.isOptionalDropDown = YES;
    self.edt_gender.delegate = self;
    
    NSMutableArray * ages = [NSMutableArray new];
    for(int i = 16; i<=99;i++){
        [ages addObject:[NSString stringWithFormat:@"%d", i]];
    }
    self.edt_ageBracker.itemList = ages;
    self.edt_ageBracker.isOptionalDropDown = YES;
    self.edt_ageBracker.delegate = self;
    
    self.img_thumb.delegate = self;
    self.img_thumb.layer.borderColor = [UIColor whiteColor].CGColor;
    self.img_thumb.layer.borderWidth = 1.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onNext:(id)sender {
    TermsViewController * controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TermsViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}


-(void)textField:(nonnull IQDropDownTextField*)textField didSelectItem:(nullable NSString*)item
{
}
- (void) tapCircleImageView {
    UIAlertController *actionsheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [actionsheet addAction:[UIAlertAction actionWithTitle:@"Take a new photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self onTakePhoto:nil];
    }]];
    [actionsheet addAction:[UIAlertAction actionWithTitle:@"Select from gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self onChoosePhoto:nil];
    }]];
    [actionsheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:actionsheet animated:YES completion:nil];
}

- (void)onChoosePhoto:(id)sender {
    if (![Util isPhotoAvaileble]){
        [Util showAlertTitle:self title:@"Error" message:@"Check your permissions in Settings > Privacy > Photo"];
        return;
    }
    isGallery = YES;
    isCamera = NO;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)onTakePhoto:(id)sender {
    if (![Util isCameraAvailable]){
        [Util showAlertTitle:self title:@"Error" message:@"Check your permissions in Settings > Privacy > Cameras"];
        return;
    }
    isCamera = YES;
    isGallery = NO;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (isCamera && ![Util isCameraAvailable]){
        [Util showAlertTitle:self title:@"Error" message:@"Check your permissions in Settings > Privacy > Cameras"];
        return;
    }
    if (isGallery && ![Util isPhotoAvaileble]){
        [Util showAlertTitle:self title:@"Error" message:@"Check your permissions in Settings > Privacy > Photo"];
        return;
    }
    UIImage *image = (UIImage *)[info valueForKey:UIImagePickerControllerOriginalImage];
    [_img_thumb setImage:image];
    selectedImage = image;
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (isGallery && ![Util isPhotoAvaileble]){
        [Util showAlertTitle:self title:@"Error" message:@"Check your permissions in Settings > Privacy > Photo"];
        return;
    }
    if (isCamera && ![Util isCameraAvailable]){
        [Util showAlertTitle:self title:@"Error" message:@"Check your permissions in Settings > Privacy > Cameras"];
        return;
    }
}
@end

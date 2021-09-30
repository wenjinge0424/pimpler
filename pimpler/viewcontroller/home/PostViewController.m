//
//  PostViewController.m
//  pimpler
//
//  Created by Techsviewer on 7/23/18.
//  Copyright © 2018 brainyapps. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet CircleImageView *img_thumb;
@property (weak, nonatomic) IBOutlet UITextView *txt_note;
@property (weak, nonatomic) IBOutlet UIImageView *ico_allow;

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)onAllowComment:(id)sender {
}
- (IBAction)onPost:(id)sender {
    [self.parent dismissPopupViewControllerAnimated:YES completion:^{
    }];
}
- (IBAction)oncancel:(id)sender {
    [self.parent dismissPopupViewControllerAnimated:YES completion:^{
    }];
}

@end

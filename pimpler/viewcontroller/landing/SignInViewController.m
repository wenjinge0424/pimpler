//
//  SignInViewController.m
//  pimpler
//
//  Created by Techsviewer on 7/23/18.
//  Copyright © 2018 brainyapps. All rights reserved.
//

#import "SignInViewController.h"
#import "ForgotPWDViewController.h"
#import "SignUpInfoViewController.h"
#import "MainTabViewController.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *edt_email;
@property (weak, nonatomic) IBOutlet UITextField *edt_password;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor *color = [UIColor colorWithRed:255.f/255.f green:128.f/255.f blue:102.f/255.f alpha:1.f];
    _edt_email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_edt_email.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    _edt_password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_edt_password.placeholder attributes:@{NSForegroundColorAttributeName: color}];
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
- (IBAction)onForgotPassword:(id)sender {
    ForgotPWDViewController * controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ForgotPWDViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)onSignUp:(id)sender {
    SignUpInfoViewController * controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SignUpInfoViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)onSignIn:(id)sender {
    MainTabViewController * controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainTabViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)onFacebookSignIn:(id)sender {
}
- (IBAction)onGoogleSignIn:(id)sender {
}


@end

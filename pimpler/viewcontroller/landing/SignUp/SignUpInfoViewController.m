//
//  SignUpInfoViewController.m
//  pimpler
//
//  Created by Techsviewer on 7/23/18.
//  Copyright © 2018 brainyapps. All rights reserved.
//

#import "SignUpInfoViewController.h"
#import "SignUpInfo2ViewController.h"

@interface SignUpInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *edt_userName;
@property (weak, nonatomic) IBOutlet UITextField *edt_email;
@property (weak, nonatomic) IBOutlet UITextField *edt_password;
@property (weak, nonatomic) IBOutlet UITextField *edt_confirm;

@end

@implementation SignUpInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor *color = [UIColor colorWithRed:255.f/255.f green:128.f/255.f blue:102.f/255.f alpha:1.f];
    _edt_userName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_edt_userName.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    _edt_email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_edt_email.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    _edt_password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_edt_password.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    _edt_confirm.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_edt_confirm.placeholder attributes:@{NSForegroundColorAttributeName: color}];
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
- (IBAction)onNext:(id)sender {
    SignUpInfo2ViewController * controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SignUpInfo2ViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

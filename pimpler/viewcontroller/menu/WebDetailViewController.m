//
//  WebDetailViewController.m
//  pimpler
//
//  Created by Techsviewer on 7/23/18.
//  Copyright © 2018 brainyapps. All rights reserved.
//

#import "WebDetailViewController.h"

@interface WebDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UIWebView *m_webView;

@end

@implementation WebDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * docName = @"0";
    if(self.type == ABOUT_TYPE_ABOUT){
        self.lbl_title.text = @"About the App";
        docName = @"0";
    }else if(self.type == ABOUT_TYPE_PRIVACY){
        self.lbl_title.text = @"Privacy Policy";
        docName = @"1";
    }else if(self.type == ABOUT_TYPE_TERMS){
        self.lbl_title.text = @"Terms and Conditions";
        docName = @"2";
    }
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:docName ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSStringEncodingConversionAllowLossy  error:nil];
    [self.m_webView loadHTMLString:htmlString baseURL:[[NSBundle mainBundle] bundleURL]];
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

@end

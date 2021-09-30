//
//  HomeViewController.m
//  pimpler
//
//  Created by Techsviewer on 7/23/18.
//  Copyright © 2018 brainyapps. All rights reserved.
//

#import "HomeViewController.h"
#import "PostItemCell.h"
#import "PostViewController.h"
#import "FriendDetailViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, BIZPopupViewControllerDelegate, CircleImageAddDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tbl_data;
@property (weak, nonatomic) IBOutlet CircleImageView *img_userThumb;
@property (weak, nonatomic) IBOutlet UITextField *edt_search;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edt_search.delegate = self;
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self fetchData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) fetchData
{
    self.tbl_data.delegate = self;
    self.tbl_data.dataSource = self;
    [self.tbl_data reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onSearchCancel:(id)sender {
    [self.edt_search setText:@""];
    [self.edt_search resignFirstResponder];
}
- (IBAction)onPost:(id)sender {
    PostViewController * controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PostViewController"];
    BIZPopupViewController *popUp = [[BIZPopupViewController alloc] initWithContentViewController:controller contentSize:CGSizeMake(self.view.frame.size.width, 400)];
    controller.parent = popUp;
    [self presentViewController:popUp animated:YES completion:nil];
}

#pragma mark - UItextfield delegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PostItemCell_image_1";
    if(indexPath.row == 0) cellIdentifier = @"PostItemCell_image_1";
    else if(indexPath.row == 1) cellIdentifier = @"PostItemCell_image_2";
    else if(indexPath.row == 2) cellIdentifier = @"PostItemCell_image_3";
    else if(indexPath.row == 3) cellIdentifier = @"PostItemCell_image_more";
    else if(indexPath.row == 4) cellIdentifier = @"PostItemCell_image_video";
    PostItemCell *cell = (PostItemCell *)[tv dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell){
        cell.btn_user.tag = indexPath.row;
        [cell.btn_user addTarget:self action:@selector(onSelectUser:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (void) onSelectUser:(UIButton*)button
{
    FriendDetailViewController * controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FriendDetailViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}
@end

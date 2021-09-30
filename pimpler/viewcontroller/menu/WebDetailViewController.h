//
//  WebDetailViewController.h
//  pimpler
//
//  Created by Techsviewer on 7/23/18.
//  Copyright © 2018 brainyapps. All rights reserved.
//

#import "BaseViewController.h"

#define ABOUT_TYPE_ABOUT        0
#define ABOUT_TYPE_PRIVACY      1
#define ABOUT_TYPE_TERMS        2

@interface WebDetailViewController : BaseViewController
@property (atomic) int type;
@end

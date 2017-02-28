//
//  SecondVC.m
//  URLSchemesA
//
//  Created by Leon on 17/2/28.
//  Copyright © 2017年 大途弘安. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupBackgroundColorParmas:(NSDictionary *)params {
    NSString *colorStr = params[@"color"];
    if ([colorStr isEqualToString:@"blueColor"]) {
        
        self.view.backgroundColor = [UIColor blueColor];
    }
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

@end

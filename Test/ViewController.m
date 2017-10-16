//
//  ViewController.m
//  Test
//
//  Created by shendong on 2017/10/16.
//  Copyright © 2017年 shendong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIDevice
//    play_sounds_preference
//    3D_Sound_preference
//    user_name
//    experience_preference
//    gravity_preference
//    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"user_name":@"大东哥"}];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [[NSUserDefaults standardUserDefaults] setObject:@"DON" forKey:@"user_name"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    /*
     参考文章： https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/UserDefaults/Preferences/Preferences.html#//apple_ref/doc/uid/10000059i-CH6-SW1
     
     */
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSArray *identifiers = @[@"play_sounds_preference",
                             @"3D_Sound_preference",
                             @"user_name",
                             @"experience_preference",
                             @"gravity_preference",
                             @"subTitle_perference",
                             @"subEnvironment_preference"];
    
    
    for (NSString *key in identifiers) {
        NSLog(@"key = %@, value = %@",key, [[NSUserDefaults standardUserDefaults] objectForKey:key]);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

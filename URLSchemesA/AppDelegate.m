//
//  AppDelegate.m
//  URLSchemesA
//
//  Created by Leon on 17/2/28.
//  Copyright © 2017年 大途弘安. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


/**
 通过指定的URL跳转到应用时调用(iOS9之前)

 @param url 指定的URL
 @param sourceApplication 请求打开应用的Bundle ID
 */
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    return YES;
}

/**
 
 通过指定的URL跳转到应用时调用(iOS9之后)
 
 @param url 指定的URL
 @param options 通过UIApplicationOpenURLOptionsSourceApplicationKey键可以获得请求打开应用的Bundle ID
 */
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    if (![url.scheme isEqualToString:@"URLSchemesA"]) {
        
        return NO;
    }
    
    NSLog(@"从URLSchemesB应用跳转过来的Bundle ID:%@", options[UIApplicationOpenURLOptionsSourceApplicationKey]);
    
    // 获取类名
    NSString *targetClass = url.host;
    // 获取要执行的方法名
    NSString *actionName = [[url.path stringByReplacingOccurrencesOfString:@"/" withString:@""] stringByAppendingString:@":"];
    SEL actionSEL = NSSelectorFromString(actionName);
    // 参数字符串转化为参数字典
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if([elts count] < 2) continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    
    UIViewController *secondVC = [[NSClassFromString(targetClass) alloc]init];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [secondVC performSelector:actionSEL withObject:params];
#pragma clang diagnostic pop
    [self.window.rootViewController presentViewController:secondVC animated:YES completion:nil];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

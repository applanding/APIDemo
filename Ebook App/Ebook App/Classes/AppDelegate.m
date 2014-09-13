//
//  AppDelegate.m
//  Ebook App
//
//  Created by macmini3 on 05/09/14.
//  Copyright (c) 2014 peerbits. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
      [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _tabBarController = [[UITabBarController alloc]init];
    _tabBarController.delegate=self;
    
    MyBooksViewController *vc1 = [[MyBooksViewController alloc]initWithNibName:@"MyBooksViewController" bundle:nil];
     DiscoverViewController *vc2 = [[DiscoverViewController alloc]initWithNibName:@"DiscoverViewController" bundle:nil];
    GenresViewController *vc3 = [[GenresViewController alloc]initWithNibName:@"GenresViewController" bundle:nil];

    TopChartsViewController *vc4 = [[TopChartsViewController alloc]initWithNibName:@"TopChartsViewController" bundle:nil];

    SearchViewController *vc5 = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
  
    UINavigationController *navController1=[[UINavigationController alloc]initWithRootViewController:vc1];
    [navController1.navigationBar setHidden:YES];
    UINavigationController *navController2=[[UINavigationController alloc]initWithRootViewController:vc2];
    [navController2.navigationBar setHidden:YES];
    UINavigationController *navController3=[[UINavigationController alloc]initWithRootViewController:vc3];
    [navController3.navigationBar setHidden:YES];
    UINavigationController *navController4=[[UINavigationController alloc]initWithRootViewController:vc4];
    [navController4.navigationBar setHidden:YES];
    UINavigationController *navController5=[[UINavigationController alloc]initWithRootViewController:vc5];
    [navController5.navigationBar setHidden:YES];
    
    NSArray *tabArrays = [NSArray arrayWithObjects: navController1, navController2,navController3,navController4,navController5, nil];
    
    _tabBarController.viewControllers = tabArrays ;
    [[_tabBarController.tabBar.items objectAtIndex:0]setTitle:@"My Books"];
    [[_tabBarController.tabBar.items objectAtIndex:1]setTitle:@"Discover"];
    [[_tabBarController.tabBar.items objectAtIndex:2]setTitle:@"Genres"];
    [[_tabBarController.tabBar.items objectAtIndex:3]setTitle:@"Top Charts"];
    [[_tabBarController.tabBar.items objectAtIndex:4]setTitle:@"Search"];
    
    [[_tabBarController.tabBar.items objectAtIndex:0]setFinishedSelectedImage:[UIImage imageNamed:@"book_select"] withFinishedUnselectedImage:[UIImage imageNamed:@"book"]];
     [[_tabBarController.tabBar.items objectAtIndex:1]setFinishedSelectedImage:[UIImage imageNamed:@"discover_select"] withFinishedUnselectedImage:[UIImage imageNamed:@"discover"]];
     [[_tabBarController.tabBar.items objectAtIndex:2]setFinishedSelectedImage:[UIImage imageNamed:@"genre_select"] withFinishedUnselectedImage:[UIImage imageNamed:@"genre"]];
     [[_tabBarController.tabBar.items objectAtIndex:3]setFinishedSelectedImage:[UIImage imageNamed:@"topchart_select"] withFinishedUnselectedImage:[UIImage imageNamed:@"topchart"]];
     [[_tabBarController.tabBar.items objectAtIndex:4]setFinishedSelectedImage:[UIImage imageNamed:@"book_select"] withFinishedUnselectedImage:[UIImage imageNamed:@"book"]];
    
    
     
   _window.backgroundColor = [UIColor whiteColor];
   _window.rootViewController = _tabBarController;
    [_window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  AppDelegate.h
//  Ebook App
//
//  Created by macmini3 on 05/09/14.
//  Copyright (c) 2014 peerbits. All rights reserved.
//

#import <UIKit/UIKit.h>
 #import "AFNetworkActivityIndicatorManager.h"
#import "MyBooksViewController.h"
#import "DiscoverViewController.h"
#import "GenresViewController.h"
#import "TopChartsViewController.h"
#import "SearchViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@end

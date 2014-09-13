//
//  MyBooksViewController.m
//  Ebook App
//
//  Created by macmini3 on 05/09/14.
//  Copyright (c) 2014 peerbits. All rights reserved.
//

#import "MyBooksViewController.h"

@interface MyBooksViewController ()

@end

@implementation MyBooksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ModelClass *mc = [[ModelClass alloc]init];
    [mc setDelegate:self];
   
    
    [mc getProfileInfo:^(id result) {
    
      //  NSLog(@"-->%@",result);
    } error:^(NSError *error) {
       //  NSLog(@"-->%@",error.description);
        
        
    }];
    
    NSMutableDictionary *requestDictionary = [NSMutableDictionary new];
    [requestDictionary setObject:@"80" forKey:@"userid"];
    [mc getProfileInfowithparamter:requestDictionary success:^(id result) {
        
        NSLog(@"-->%@",result);
    } error:^(NSError *error) {
        NSLog(@"-->%@",error.description);
        
        
    }];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

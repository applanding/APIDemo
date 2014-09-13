//
//  ModelClass.h
//  APITest
//
//  Created by Evgeny Kalashnikov on 03.12.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "DarckWaitView.h"

@class DarckWaitView;
@class DarckWaitView_pad;
@interface ModelClass : NSObject {
  
    DarckWaitView *drkSignUp;

}

@property (nonatomic, retain) id delegate;


- (void) getProfileInfo:(void (^)(id))result error:(void (^)(NSError*))error;
- (void) getProfileInfowithparamter:(NSDictionary *)parameters success:(void (^)(id))result error:(void (^)(NSError *))error;
@end

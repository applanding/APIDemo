//
//  ModelClass.m
//  APITest
//
//  Created by Evgeny Kalashnikov on 03.12.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ModelClass.h"



static char base64EncodingTable[64] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};
@implementation ModelClass


- (id)init
{
    self = [super init];
    if (self) {
       drkSignUp = [[DarckWaitView alloc] initWithDelegate:nil andInterval:0.1 andMathod:nil];
    }
    
    return self;
}
-(NSString *) base64StringFromData: (NSData *)data length: (int)length {
    unsigned long ixtext, lentext;
    long ctremaining;
    unsigned char input[3], output[4];
    short i, charsonline = 0, ctcopy;
    const unsigned char *raw;
    NSMutableString *result;
    
    lentext = [data length];
    if (lentext < 1)
        return @"";
    result = [NSMutableString stringWithCapacity: lentext];
    raw = [data bytes];
    ixtext = 0;
    
    while (true) {
        ctremaining = lentext - ixtext;
        if (ctremaining <= 0)
            break;
        for (i = 0; i < 3; i++) {
            unsigned long ix = ixtext + i;
            if (ix < lentext)
                input[i] = raw[ix];
            else
                input[i] = 0;
        }
        output[0] = (input[0] & 0xFC) >> 2;
        output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
        output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
        output[3] = input[2] & 0x3F;
        ctcopy = 4;
        switch (ctremaining) {
            case 1:
                ctcopy = 2;
                break;
            case 2:
                ctcopy = 3;
                break;
        }
        
        for (i = 0; i < ctcopy; i++)
            [result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
        
        for (i = ctcopy; i < 4; i++)
            [result appendString: @"="];
        
        ixtext += 3;
        charsonline += 4;
        
        if ((length > 0) && (charsonline >= length))
            charsonline = 0;
    }
    return result;
}

- (void) getProfileInfo:(void (^)(id))result error:(void (^)(NSError *))error
{
    
    NSMutableDictionary *requestDictionary = [NSMutableDictionary new];
    [requestDictionary setObject:@"80" forKey:@"userid"];
    [self postURL:@"waitlisted" parameters:requestDictionary success:^(id response) {
        result(response);
    } failure:^(NSError *anError) {
        error(anError);
    }];;
}
- (void) getProfileInfowithparamter:(NSDictionary *)parameters success:(void (^)(id))result error:(void (^)(NSError *))error
{
    
  
    [self postURL:@"waitlisted" parameters:parameters success:^(id response) {
        result(response);
    } failure:^(NSError *anError) {
        error(anError);
    }];;
}

-(void)postURL:(NSString *)URL parameters:(NSDictionary *)parameters success: (void (^) (id result)) successBlock failure: (void (^) (NSError * error)) failureBlock{

    if ([self canConnect:API_PATH]) {
        
        [drkSignUp showWithMessage:nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:[[NSString stringWithFormat:@"%@%@",API_PATH,URL]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //    NSLog(@"JSON: %@", responseObject);
        [drkSignUp hide];
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [drkSignUp hide];
        failureBlock(error);
    }];
    }else{
    
    
    }
    
}
-(BOOL) canConnect:(NSString*) urlString;
{
    BOOL            flag=NO;
    @try {
        //NSData          *dataReply;
        NSURLResponse   *response;
        NSError         *error;
        
        // create the request
        NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
        
        // Make the connection
        [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:&error];
        
        if (response != nil)
        {
            //NSLog(@"(canConnect) - TESTING OF CONNECTION SUCCEEDED %@", response);
            flag = YES;
        } else {
            // inform the user that the download could not be made
            NSLog(@"(canConnect) - TESTING OF CONNECTION FAILED: %@ %@", response, error);
            flag = NO;
        }
    }
    @catch (NSException *exception) {
        flag = NO;
    }
    // Return the flag
    return flag;
}
@end
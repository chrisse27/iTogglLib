//
//  TGLUserService.m
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLUserService.h"

@interface TGLUserService ()
@property (strong) TGLTogglClient *client;
@end

@implementation TGLUserService

- (instancetype)initWithClient:(TGLTogglClient *)client
{
    self = [super init];
    
    if (self) {
        _client = client;
    }
    
    return self;
}

- (TGLUser *)currentUser
{
    NSString *url = @"me";
    
    NSDictionary *valueDict = [self.client itemByGetWithRelativeURL:url];
    if (!valueDict) {
        NSLog(@"No current user.");
        return nil;
    }
    
    NSString *apiToken = [valueDict objectForKey:TogglApiToken];
    
    return [[TGLUser alloc] initWithApiToken:apiToken];
}

@end

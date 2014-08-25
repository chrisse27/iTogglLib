//
//  TGLUser.m
//  iTogglLib
//
//  Created by Christoph Krautz on 11/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLUser.h"

@implementation TGLUser

@synthesize apiToken = _apiToken;

- (id)initWithApiToken:(NSString *) apiToken
{
    self = [super init];
    
    if (self) {
        _apiToken = apiToken;
    }
    
    return self;
}

@end

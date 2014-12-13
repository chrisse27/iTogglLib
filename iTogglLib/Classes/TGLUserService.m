//
//  TGLUserService.m
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright 2014 Christoph Krautz
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "TGLUserService.h"

#import "TGLUser+Json.h"

NSString * const TGLUserMeUrl = @"me";

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
    NSDictionary *valueDict = [self.client itemByGetWithRelativeURL:TGLUserMeUrl];
    if (!valueDict) {
        NSLog(@"No current user.");
        return nil;
    }
    
    return [TGLUser userFromDictionary:valueDict];
}

@end

//
//  TGLUser+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 13/12/14.
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

#import "TGLUser+Json.h"

NSString * const TGLJsonKeyUserApiToken = @"api_token";
NSString * const TGLJsonKeyUserFullname = @"fullname";
NSString * const TGLJsonKeyUserEMail = @"email";

@implementation TGLUser (Json)

+ (TGLUser *)userFromDictionary:(NSDictionary *)dictionary
{
    TGLUser *user = [[TGLUser alloc]init];
    
    user.apiToken = [dictionary objectForKey:TGLJsonKeyUserApiToken];
    user.fullName = [dictionary objectForKey:TGLJsonKeyUserFullname];
    user.eMail = [dictionary objectForKey:TGLJsonKeyUserEMail];
    
    return user;
}

@end

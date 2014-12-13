//
//  TGLTogglClient.h
//  iToggl
//
//  Created by Christoph Krautz on 04/05/14.
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

#import <Foundation/Foundation.h>

#import "TGLTimeEntry.h"
#import "TGLUser.h"
#import "TGLUserService.h"
#import "TGLTimeEntryService.h"
#import "TGLProjectService.h"
#import "TGLWorkspaceService.h"

@class TGLUserService;
@class TGLTimeEntryService;
@class TGLProjectService;
@class TGLWorkspaceService;

FOUNDATION_EXPORT NSString * const TogglApiBaseUrl;
FOUNDATION_EXPORT NSString * const TogglApiToken;

@interface TGLTogglClient : NSObject

@property (readonly, strong) NSString *username;
@property (readonly, strong) NSString *password;

@property (readonly, strong) TGLUserService *user;
@property (readonly, strong) TGLTimeEntryService *timeEntry;
@property (readonly, strong) TGLProjectService *project;
@property (readonly, strong) TGLWorkspaceService *workspace;

+ (NSDateFormatter *)formatter;

- (id)initWithUserName:(NSString*)username AndPassword:(NSString *)password;

- (NSDictionary *)itemByGetWithRelativeURL:(NSString *)urlString;
- (NSArray *)listByGetWithRelativeURL:(NSString *)urlString;
- (NSMutableURLRequest*)createRequestForRelativeURL:(NSString *)urlString withMethod:(NSString *)method;
- (id)sendRequest:(NSURLRequest *)request;

@end

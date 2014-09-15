//
//  TGLTogglClient.h
//  iToggl
//
//  Created by Christoph Krautz on 04/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
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

//
//  TGLTogglClient.m
//  iTogglLib
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

#import "TGLTogglClient.h"

NSString * const TogglApiBaseUrl = @"https://www.toggl.com/api/v8/";
NSString * const TogglApiToken = @"api_token";

NSDateFormatter * TogglDateFormat = nil;

@interface TGLTogglClient()
@property (strong) NSURL *apiBaseUrl;
@end

@implementation TGLTogglClient

@synthesize user = _user;
@synthesize timeEntry = _timeEntry;
@synthesize project = _project;
@synthesize workspace = _workspace;

- (id)initWithUserName:(NSString*)username AndPassword:(NSString *)password
{
    self = [super init];
    
    if (self) {
        _username = username;
        _password = password;
        
        _apiBaseUrl = [NSURL URLWithString:TogglApiBaseUrl];
    }
    
    return self;
}

- (TGLUserService *)user
{
    if (!_user) {
        _user = [[TGLUserService alloc] initWithClient:self];
    }
    
    return _user;
}

- (TGLTimeEntryService *)timeEntry
{
    if (!_timeEntry) {
        _timeEntry = [[TGLTimeEntryService alloc] initWithClient:self];
    }
    
    return _timeEntry;
}

- (TGLProjectService *)project
{
    if (!_project) {
        _project = [[TGLProjectService alloc] initWithClient:self];
    }
    
    return _project;
}

- (TGLWorkspaceService *)workspace
{
    if (!_workspace) {
        _workspace = [[TGLWorkspaceService alloc] initWithClient:self];
    }
    
    return _workspace;
}

- (NSDictionary *)itemByGetWithRelativeURL:(NSString *)url
{
    NSMutableURLRequest *request = [self createRequestForRelativeURL:url withMethod:@"GET"];
    
    id responsePayload = [self sendRequest:request];
    if (![responsePayload isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Unexpected format.");
        return nil;
    }
    
    NSDictionary *jsonDict = responsePayload;
    id value = [jsonDict objectForKey:@"data"];
    if (value == [NSNull null]) {
        return nil;
    }
    
    return value;
}

- (NSArray *)listByGetWithRelativeURL:(NSString *)url
{
    NSMutableURLRequest *request = [self createRequestForRelativeURL:url withMethod:@"GET"];
    
    id responsePayload = [self sendRequest:request];
    if (![responsePayload isKindOfClass:[NSArray class]]) {
        NSLog(@"Unexpected format. Expected NSArray.");
        return nil;
    }
    
    return responsePayload;
}

- (NSMutableURLRequest*)createRequestForRelativeURL:(NSString *)urlString withMethod:(NSString *)method
{
    NSURL *absoluteUrl = [NSURL URLWithString:urlString relativeToURL:self.apiBaseUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:absoluteUrl];
    [request setHTTPMethod:method];
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", [self username], [self password]];
    NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    return request;
}

- (id)sendRequest:(NSURLRequest *)request
{
    NSHTTPURLResponse *response =[[NSHTTPURLResponse alloc]init];
    NSError *errorReturned = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&errorReturned];
    
    if (errorReturned) {
        NSLog(@"An error occurred while sending the request: %@", errorReturned.description);
        // TODO proper error handling, e.g., inform user that internet connection is offline
        return nil;
    }
    
    NSInteger statusCode = [response statusCode];
    if (statusCode != 200) {
        NSLog(@"Server returned error %ld", (long)statusCode);
        return nil;
    }
    
    NSError *jsonParsingError = nil;
    id jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&jsonParsingError];
    
    if (jsonParsingError) {
        NSLog(@"An error occurred while parsing the response: %@", jsonParsingError.description);
        return nil;
    }
    
    NSLog(@"Response %@", jsonResponse);
    
    return jsonResponse;
}

+ (NSDateFormatter *)formatter
{
    /*
     Returns a user-visible date time string that corresponds to the specified
     RFC 3339 date time string. Note that this does not handle all possible
     RFC 3339 date time strings, just one of the most common styles.
     */
    
    if (!TogglDateFormat) {
        NSDateFormatter *rfc3339DateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        
        [rfc3339DateFormatter setLocale:enUSPOSIXLocale];
        [rfc3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"];
        [rfc3339DateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        
        TogglDateFormat = rfc3339DateFormatter;
    }

    return TogglDateFormat;
}

@end

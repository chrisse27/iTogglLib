//
//  TGLTogglClient.m
//  iToggl
//
//  Created by Christoph Krautz on 04/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTogglClient.h"
#import "TGLTimeEntry+Json.h"

NSString * const TogglApiBaseUrl = @"https://www.toggl.com/api/v8/%@";
NSString * const TogglApiToken = @"api_token";

NSDateFormatter * TogglDateFormat = nil;

@interface TGLTogglClient()

- (NSMutableURLRequest*)createRequestForURL:(NSString *)urlString withMethod:(NSString *)method;
- (id)sendRequest:(NSURLRequest *)request;
@end

@implementation TGLTogglClient

@synthesize username = _username;
@synthesize password = _password;

- (id)initWithUserName:(NSString*)username AndPassword:(NSString *)password
{
    self = [super init];
    
    if (self) {
        _username = username;
        _password = password;
    }
    
    return self;
}

- (TGLUser *)currentUser
{
    NSString *urlString = [NSString stringWithFormat:TogglApiBaseUrl, @"me"];
    NSMutableURLRequest *request = [self createRequestForURL:urlString withMethod:@"GET"];
    
    id responsePayload = [self sendRequest:request];
    if (!responsePayload) {
        return nil;
    }
    
    if ([responsePayload isKindOfClass:[NSArray class]]) {
        NSLog(@"Unexpected format.");
        return nil;
    }
    
    NSDictionary *jsonDict = responsePayload;
    id value = [jsonDict objectForKey:@"data"];
    if (value == [NSNull null]) {
        NSLog(@"No current user.");
        return nil;
    }
    NSDictionary *valueDict = value;
    NSString *apiToken = [valueDict objectForKey:TogglApiToken];
    
    return [[TGLUser alloc] initWithApiToken:apiToken];
}

- (NSArray *)timeEntriesBetween:(NSDate *)start And:(NSDate *)end
{
    NSMutableString *requestParams = [NSMutableString stringWithString:@"time_entries"];
    
    if (start || end) {
        [requestParams appendString:@"?"];
    }
    
    if (start) {
        [requestParams appendFormat:@"startDate=%@", [TogglDateFormat stringFromDate:start]];
    }
    
    if (end) {
        if (start) {
            [requestParams appendString:@"&"];
        }
        [requestParams appendFormat:@"endDate=%@", [TogglDateFormat stringFromDate:end]];
    }
    
    NSString *urlString = [NSString stringWithFormat:TogglApiBaseUrl, requestParams];
    NSMutableURLRequest *request = [self createRequestForURL:urlString withMethod:@"GET"];
    
    id responsePayload = [self sendRequest:request];
    if (![responsePayload isKindOfClass:[NSArray class]]) {
        NSLog(@"Unexpected format.");
        return nil;
    }
    
    NSArray *timeEntryDicts = responsePayload;
    NSMutableArray *timeEntries = [NSMutableArray arrayWithCapacity:[timeEntryDicts count]];
    for (NSDictionary *timeEntryDict in timeEntryDicts) {
        TGLTimeEntry *timeEntry = [TGLTimeEntry timeEntryFromDictionary:timeEntryDict];
        [timeEntries addObject:timeEntry];
    }
    
    return timeEntries;
}

- (TGLTimeEntry *)currentTimeEntry
{
    NSString *urlString = [NSString stringWithFormat:TogglApiBaseUrl, @"time_entries/current"];
    NSMutableURLRequest *request = [self createRequestForURL:urlString withMethod:@"GET"];
    
    id responsePayload = [self sendRequest:request];
    if (![responsePayload isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Unexpected format.");
        return nil;
    }
    
    NSDictionary *jsonDict = responsePayload;
    id value = [jsonDict objectForKey:@"data"];
    if (value == [NSNull null]) {
        NSLog(@"No current time entry.");
        return nil;
    }
    
    NSDictionary *valueDict = (NSDictionary *) value;
    return [TGLTimeEntry timeEntryFromDictionary:valueDict];
}

- (TGLTimeEntry *)createAndStartTimeEntry:(TGLTimeEntry *)entry
{
    NSString *urlString = [NSString stringWithFormat:TogglApiBaseUrl, @"time_entries/start"];
    NSMutableURLRequest *request = [self createRequestForURL:urlString withMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary *dataDict = [entry dictionary];
    NSError *jsonParsingError = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDict options:NSJSONWritingPrettyPrinted error:&jsonParsingError];
    [request setHTTPBody:data];
    
//    NSString* requestDataLengthString = [[NSString alloc] initWithFormat:@"%lu", (unsigned long)data.length];
//    [request setValue:requestDataLengthString forHTTPHeaderField:@"Content-Length"];
    
    id responsePayload = [self sendRequest:request];
    if (![responsePayload isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Unexpected format.");
        return nil;
    }
    
    NSDictionary *jsonDict = responsePayload;
    id value = [jsonDict objectForKey:@"data"];
    if (value == [NSNull null]) {
        // handle no entry
        NSLog(@"No current time entry.");
        return nil;
    }
    
    // return stopped time entry
    NSDictionary *valueDict = (NSDictionary *) value;
    return [TGLTimeEntry timeEntryFromDictionary:valueDict];
}

- (TGLTimeEntry *)stopTimeEntry:(TGLTimeEntry *)entry
{
    NSString *urlString = [NSString stringWithFormat:@"https://www.toggl.com/api/v8/time_entries/%ld/stop",(long)entry.identifier];
    NSMutableURLRequest *request = [self createRequestForURL:urlString withMethod:@"GET"];
    
    id responsePayload = [self sendRequest:request];
    if (![responsePayload isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Unexpected format.");
        return nil;
    }
    
    NSDictionary *jsonDict = responsePayload;
    id value = [jsonDict objectForKey:@"data"];
    if (value == [NSNull null]) {
        // handle no entry
        NSLog(@"No current time entry.");
        return nil;
    }
    
    // return stopped time entry
    NSDictionary *valueDict = (NSDictionary *) value;
    return [TGLTimeEntry timeEntryFromDictionary:valueDict];
}

- (NSMutableURLRequest*)createRequestForURL:(NSString *)urlString withMethod:(NSString *)method
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
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
        [rfc3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssZ"];
        [rfc3339DateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        
        TogglDateFormat = rfc3339DateFormatter;
    }

    return TogglDateFormat;
}

@end

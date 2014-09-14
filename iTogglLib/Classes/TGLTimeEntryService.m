//
//  TGLTimeEntryService.m
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTimeEntryService.h"

#import "TGLTogglClient.h"
#import "TGLTimeEntry+Json.h"

NSString * const TGLTimeEntryServiceUrl = @"time_entries";
NSString * const TGLTimeEntryCurrentUrl = @"/current";
NSString * const TGLTimeEntryStartUrl = @"/start";
NSString * const TGLTimeEntryStopUrl = @"/%ld/stop";

@interface TGLTimeEntryService ()
@property (strong) TGLTogglClient *client;
@end

@implementation TGLTimeEntryService

- (instancetype)initWithClient:(TGLTogglClient *)client
{
    self = [super init];
    
    if (self) {
        _client = client;
    }
    
    return self;
}

- (NSArray *)entriesBetween:(NSDate *)start And:(NSDate *)end
{
    NSMutableString *url = [NSMutableString stringWithString:TGLTimeEntryServiceUrl];
    
    if (start || end) {
        [url appendString:@"?"];
    }
    
    if (start) {
        [url appendFormat:@"startDate=%@", [[TGLTogglClient formatter] stringFromDate:start]];
    }
    
    if (end) {
        if (start) {
            [url appendString:@"&"];
        }
        [url appendFormat:@"endDate=%@", [[TGLTogglClient formatter] stringFromDate:end]];
    }
    
    NSArray *timeEntryDicts = [self.client listByGetWithRelativeURL:url];
    if (!timeEntryDicts) {
        NSLog(@"Could not retrieve time entries.");
        return nil;
    }
    
    NSMutableArray *timeEntries = [NSMutableArray arrayWithCapacity:[timeEntryDicts count]];
    for (NSDictionary *timeEntryDict in timeEntryDicts) {
        TGLTimeEntry *timeEntry = [TGLTimeEntry timeEntryFromDictionary:timeEntryDict];
        [timeEntries addObject:timeEntry];
    }
    
    return timeEntries;
}

- (TGLTimeEntry *)currentTimeEntry
{
    NSMutableString *url = [NSMutableString stringWithString:TGLTimeEntryServiceUrl];
    [url appendString:TGLTimeEntryCurrentUrl];
    NSDictionary *valueDict = [self.client itemByGetWithRelativeURL:url];
    
    if (!valueDict) {
        NSLog(@"No current time entry.");
        return nil;
    }

    return [TGLTimeEntry timeEntryFromDictionary:valueDict];
}

- (TGLTimeEntry *)createAndStartTimeEntry:(TGLTimeEntry *)entry
{
    NSMutableString *url = [NSMutableString stringWithString:TGLTimeEntryServiceUrl];
    [url appendString:TGLTimeEntryStartUrl];
    NSMutableURLRequest *request = [self.client createRequestForRelativeURL:url withMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary *dataDict = [entry dictionary];
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDict options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"Error while serializing data: %@", error.localizedDescription);
        return nil;
    }
    [request setHTTPBody:data];
    
    id responsePayload = [self.client sendRequest:request];
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
    NSMutableString *url = [NSMutableString stringWithString:TGLTimeEntryServiceUrl];
    [url appendFormat:TGLTimeEntryStopUrl, (long)entry.identifier];
    NSMutableURLRequest *request = [self.client createRequestForRelativeURL:url withMethod:@"GET"];
    
    id responsePayload = [self.client sendRequest:request];
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

@end

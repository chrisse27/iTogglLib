//
//  TGLTimeEntry.m
//  iToggl
//
//  Created by Christoph Krautz on 05/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTimeEntry.h"

#import "TGLTogglClient.h"

@interface TGLTimeEntry ()
@property (nonatomic, readwrite) NSInteger pid;
@end

@implementation TGLTimeEntry

@synthesize description = _description;

- (id)initWithIdentifier:(NSInteger) identifier andDescription:(NSString *)description andStart:(NSDate *)start andStop:(NSDate *)stop andPid:(NSInteger) pid
{
    self = [super init];
    
    if (self) {
        _identifier = identifier;
        _description = description;
        _start = start;
        _stop = stop;
        _pid = pid;
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[TGLTimeEntry class]]) {
        return NO;
    }
    
    return [self isEqualToTimeEntry:(TGLTimeEntry *)object];
}

- (BOOL)isEqualToTimeEntry:(TGLTimeEntry *)entry
{
    BOOL haveSameDescription = (!self.description && !entry.description) || [self.description isEqualToString:entry.description];
    BOOL haveSamePid = self.pid == entry.pid;
    
    return haveSameDescription && haveSamePid;
}

- (NSUInteger)hash {
    return [self.description hash] ^ self.pid;
}

@end

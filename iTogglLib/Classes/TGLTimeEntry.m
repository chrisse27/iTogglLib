//
//  TGLTimeEntry.m
//  iTogglLib
//
//  Created by Christoph Krautz on 05/05/14.
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

#import "TGLTimeEntry.h"

#import "TGLTogglClient.h"

@interface TGLTimeEntry ()
@end

@implementation TGLTimeEntry

- (id)initWithIdentifier:(NSInteger) identifier andDescription:(NSString *)description andStart:(NSDate *)start andStop:(NSDate *)stop andPid:(NSInteger) pid
{
    self = [super init];
    
    if (self) {
        _identifier = identifier;
        _entryDescription = description;
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
    BOOL haveSameDescription = (!self.entryDescription && !entry.entryDescription) || [self.entryDescription isEqualToString:entry.entryDescription];
    BOOL haveSamePid = self.pid == entry.pid;
    
    return haveSameDescription && haveSamePid;
}

- (NSUInteger)hash {
    return [self.entryDescription hash] ^ self.pid;
}

@end

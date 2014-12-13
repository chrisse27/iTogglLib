//
//  TGLProject+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 15/09/14.
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

#import "TGLProject+Json.h"

#import "TGLTogglClient.h"

static NSString * const TGLJsonKeyProjectIdentifier = @"id";
static NSString * const TGLJsonKeyProjectName = @"name";
static NSString * const TGLJsonKeyProjectColor = @"color";

@implementation TGLProject (Json)

+ (TGLProject *)projectFromDictionary:(NSDictionary *)dictionary
{
    TGLProject *project = [[TGLProject alloc] init];
    
    project.identifier = [[dictionary objectForKey:TGLJsonKeyProjectIdentifier] integerValue];
    project.name = [dictionary objectForKey:TGLJsonKeyProjectName];
    project.color = [[dictionary objectForKey:TGLJsonKeyProjectColor] integerValue];
    
    return project;
}

@end

//
//  RootTest.m
//  iGrapeVine
//
//  Created by William Cox on 11/11/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import "RootTest.h"
#import "Root.h"

@interface RootTest () {
    NSFileHandle *_testFile;
}

@end

@implementation RootTest

- (void)setUp {
    _testFile = nil;
}

- (void)tearDown {
    [_testFile closeFile];
}

- (void)testGetIntB {
    int fileNum = [self fileNumForTestFile:@"Luther"];
    
    STAssertEquals([Root getIntB:fileNum], 4, @"Beginning of every .gex file starts with 0x4 0x0");
}

- (void)testGetStrB {
    int fileNum = [self fileNumForTestFile:@"Luther"];
    NSString *testString;
    [Root getStrB:fileNum stringValue:&testString];
    STAssertEqualObjects(testString, @"GVBE", @"Beginning of every .gex file starts with string 'GVBE'");
}

- (void)testDoubleB {
    int fileNum = [self fileNumForTestFile:@"DoubleTest"];
    double testDouble = [Root getDoubleB:fileNum];
    STAssertEquals(testDouble, 3.0, @"Test file Version number should be 3");
}

#pragma mark - Helper Methods

- (int)fileNumForTestFile:(NSString *)resource {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:resource ofType:@"gex"];
    NSFileHandle *testFile = [NSFileHandle fileHandleForReadingAtPath:filePath];
    STAssertTrue([testFile fileDescriptor], @"should have an open file");
    _testFile = testFile;
    return [testFile fileDescriptor];
}
@end

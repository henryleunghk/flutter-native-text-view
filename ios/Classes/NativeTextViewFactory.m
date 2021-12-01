//
//  NativeTextViewFactory.m
//  flutter_native_text_view
//
//  Created by Henry Leung on 30/11/2021.
//

#import "NativeTextViewFactory.h"
#import "NativeTextView.h"

@implementation NativeTextViewFactory {
    NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
    NativeTextView* textView = [[NativeTextView alloc] initWithFrame:frame
                                                     viewIdentifier:viewId
                                                          arguments:args
                                                    binaryMessenger:_messenger];
    return textView;
}

@end

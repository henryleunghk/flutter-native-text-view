#import "FlutterNativeTextViewPlugin.h"
#import "NativeTextViewFactory.h"

@implementation FlutterNativeTextViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  NativeTextViewFactory* textFieldFactory =
        [[NativeTextViewFactory alloc] initWithMessenger:registrar.messenger];
    
    [registrar registerViewFactory:textFieldFactory
                            withId:@"flutter_native_text_view"];
}

@end

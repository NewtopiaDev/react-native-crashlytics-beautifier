import {NativeModules} from 'react-native';

module.exports = {
    init: function() {
        function parseErrorStack(e) {
            if (!e || !e.stack) {
                return [];
            }
            const stacktraceParser = require('stacktrace-parser');
            const stack = Array.isArray(e.stack) ? e.stack : stacktraceParser.parse(e.stack);
            let framesToPop = typeof e.framesToPop === 'number' ? e.framesToPop : 0;
            while (framesToPop--) {
                stack.shift();
            }
            return stack;
        }

        var originalHandler = global.ErrorUtils.getGlobalHandler();
        function errorHandler(e, isFatal) {
            let parsedStack = parseErrorStack(e);
            let a = NativeModules.RNCrashlyticsBeautifier.recordException(e.message, parsedStack, isFatal); 
        }
        global.ErrorUtils.setGlobalHandler(errorHandler);
    }
}

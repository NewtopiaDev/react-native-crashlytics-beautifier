using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Stack.Beautifier.RNStackBeautifier
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNStackBeautifierModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNStackBeautifierModule"/>.
        /// </summary>
        internal RNStackBeautifierModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNStackBeautifier";
            }
        }
    }
}

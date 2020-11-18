using System;
using System.Collections.Generic;
using System.Text;

namespace CodeArtifactSample.Shared
{
    public class Logging : BaseClass
    {
        public void WriteLine(string message)
        {
            Console.WriteLine($"Shared :: {message}");
        }
    }
}

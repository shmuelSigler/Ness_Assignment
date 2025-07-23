using HelloWorld;
using Xunit;
namespace HelloWorld.Tests;

public class UnitTest1
{
    public void Print_ReturnsHelloWorld()
    {
        Assert.Equal("Hello World", Program.Print());
    }
}

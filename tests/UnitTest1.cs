using HelloWorld;
using Xunit;
namespace HelloWorld.Tests;

public class UnitTest1
{
    [Fact]
    public void Print_ReturnsHelloWorld()
    {
        Assert.Equal("Hello World", Program.Print());
    }
}

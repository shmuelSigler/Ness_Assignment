using HelloWorld;
using Xunit;
namespace HelloWorld.Tests;

public class UnitTest1
{
    [Fact]
    public void Print_ReturnsHelloWorld()
    {
        Assert.Equal("Hello Ness", Program.Print());
    }

    [Fact]
    public void Main_PrintsHelloWorldToConsole()
    {
        var output = new StringWriter();
        Console.SetOut(output);
        Program.Main(Array.Empty<string>());
        var consoleOutput = output.ToString().Trim();
        Assert.Equal("Hello Ness", consoleOutput);
    }
}

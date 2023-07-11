var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/KoffeeLuv", () => "Hello World!");

app.Run();

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/KoffeeLuv", () => "The Future Home of Koffee Luv");

app.Run();

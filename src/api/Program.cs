var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHealthChecks();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapPost("/api/resource", () => Results.Ok("Successful POST request !!!")).Produces(200);
app.MapGet("/api/resource", () => Results.Ok("Successful GET request !!!")).Produces(200);

app.MapHealthChecks("/health");

app.Run();

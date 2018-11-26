﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using Customers.API.Repository;

namespace Customers.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //Add SqLite support
            services.AddDbContext<CustomersDbContext>(options => {
                options.UseSqlite(Configuration.GetConnectionString("CustomersSqliteConnectionString"));
            });

            services.AddMvc();

            //Update as appropriate for origin, method, header
            services.AddCors(options =>
            {
                options.AddPolicy("AllowAnyOrigin",
                    builder => builder
                    .AllowAnyOrigin()
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                );
            });

            services.AddScoped<ICustomersRepository, CustomersRepository>();
            services.AddScoped<ICustomerOrdersRepository, CustomerOrdersRepository>();
            services.AddTransient<CustomersDbSeeder>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, CustomersDbSeeder customersDbSeeder)
        {

            app.UseCors("AllowAnyOrigin");

            app.UseMvc();

            customersDbSeeder.SeedAsync(app.ApplicationServices).Wait();
        }
    }
}

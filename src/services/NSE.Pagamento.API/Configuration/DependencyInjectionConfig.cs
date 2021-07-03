﻿using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using NSE.Pagamento.API.Data;
using NSE.Pagamento.API.Data.Repository;
using NSE.Pagamento.API.Models;
using NSE.WebAPI.Core.Usuario;

namespace NSE.Pagamento.API.Configuration
{
    public static class DependencyInjectionConfig
    {
        public static void RegisterServices(this IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IAspNetUser, AspNetUser>();

            //services.AddScoped<IPagamentoService, PagamentoService>();
            //services.AddScoped<IPagamentoFacade, PagamentoCartaoCreditoFacade>();

            services.AddScoped<IPagamentoRepository, PagamentoRepository>();
            services.AddScoped<PagamentosContext>();
        }
    }
}
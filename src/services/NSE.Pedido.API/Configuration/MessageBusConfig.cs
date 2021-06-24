using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace NSE.Pedidos.API.Configuration
{
    public static class MessageBusConfig
    {
        public static void AddMessageBusConfiguration(this IServiceCollection services,
            IConfiguration configuration)
        {

        }
    }
}
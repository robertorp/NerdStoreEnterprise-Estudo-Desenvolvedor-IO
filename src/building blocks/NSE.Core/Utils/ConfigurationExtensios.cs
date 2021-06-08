using Microsoft.Extensions.Configuration;

namespace NSE.Core.Utils
{
    public static class ConfigurationExtensios
    {
        public static string GetMessageQueueConnection(this IConfiguration configuration, string name)
        {
            return configuration?.GetSection("MessageQueueConnection")?[name];
        }
    }
}
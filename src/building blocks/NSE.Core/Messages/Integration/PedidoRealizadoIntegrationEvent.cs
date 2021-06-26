using System;

namespace NSE.Core.Messages.Integration
{
    public class PedidoRealizadoIntegrationEvent : IntegrationEvent
    {
        public Guid ClienteId { get; set; }

        public PedidoRealizadoIntegrationEvent(Guid clienteId)
        {
            ClienteId = clienteId;
        }
    }
}
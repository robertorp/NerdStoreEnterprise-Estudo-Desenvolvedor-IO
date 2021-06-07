using System;

namespace NSE.Cliente.API.Application.Commands
{
    public class RegistrarClienteCommand
    {
        public Guid Id { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Cpf { get; set; }
    }
}
﻿using System;
using NSE.Core.Messages;

namespace NSE.Cliente.API.Application.Commands
{
    public class RegistrarClienteCommand : Command
    {
        public Guid Id { get; private set; }
        public string Nome { get; private set; }
        public string Email { get; private set; }
        public string Cpf { get; private set; }

        public RegistrarClienteCommand(Guid id, string nome, string email, string cpf)
        {
            AggregateId = Id;
            Id = id;
            Nome = nome;
            Email = email;
            Cpf = cpf;
        }
    }
}
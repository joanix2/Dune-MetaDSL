using System;
using System.ComponentModel.DataAnnotations;

public class Role
{
    [Key]
    public Guid Id { get; private set; }  // L'ID est privé, accès en lecture seule

    public string Name { get; private set; }  // Le nom du rôle est en lecture seule pour tout le monde

    public Role(string name)
    {
        Id = Guid.NewGuid();
        Name = name;
    }
}
